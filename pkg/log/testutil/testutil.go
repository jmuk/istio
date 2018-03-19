// Copyright 2017 Istio Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package testutil

import (
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"
	"testing"

	"istio.io/istio/pkg/log"
)

const (
	logFilename   = "logs"
	errorFilename = "errors"
)

// BenchmarkLogger suppresses logging for most of the cases. Typically
// benchmarks (testing.B) should print out its statistics only, normal
// logs should be ignored; otherwise it is very hard to analyze the
// benchmark data (see bin/perfcheck.sh too).
//
// This is typically created on the beginning of benchmark funciton, and
// call 'Done' at the end, like
//   func BenchmarkFoo(b *testing.B) {
//     blog := NewBenchmarkLogger(b)
//     defer blog.Done()
//     ...
//   }
type BenchmarkLogger struct {
	b      *testing.B
	tmpdir string
}

// NewBenchmarkLogger creates a new benchmark.
func NewBenchmarkLogger(b *testing.B) *BenchmarkLogger {
	tempdir, err := ioutil.TempDir("", b.Name())
	if err != nil {
		b.Fatalf("Failed to create a temporary directory: %s", err)
	}
	opt := log.DefaultOptions()
	opt.OutputPaths = []string{filepath.Join(tempdir, logFilename)}
	opt.ErrorOutputPaths = []string{filepath.Join(tempdir, "errors")}
	log.Configure(opt)
	return &BenchmarkLogger{b, tempdir}
}

func (bl *BenchmarkLogger) printLog(filename string) {
	f, err := os.Open(filepath.Join(bl.tmpdir, filename))
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to read %s: %v", filename, err)
		return
	}
	defer f.Close()
	_, err = io.Copy(os.Stderr, f)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failure on reading file %s: %v", filename, err)
	}
}

// Done cleans up the logging situation on the benchmark. This should be called
// at the end of the benchmark.
func (bl *BenchmarkLogger) Done() {
	log.Sync()
	log.Configure(log.DefaultOptions())
	if bl.b.Failed() {
		fmt.Fprintf(os.Stderr, "Benchmark failed. Here's the log\n")
		bl.printLog(logFilename)
		fmt.Fprintf(os.Stderr, "Errors\n")
		bl.printLog(errorFilename)
	}
	os.RemoveAll(bl.tmpdir)
}
