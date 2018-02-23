module "istio.io/istio"

require (
	"cloud.google.com/go" v0.0.0-20180119154837-767c40d6a2e0
	"github.com/DataDog/datadog-go" v0.0.0-20180216124641-1db03a3cc56b
	"github.com/alicebob/gopher-json" v0.0.0-20180125190556-5a6b3ba71ee6
	"github.com/alicebob/miniredis" v0.0.0-20180220160213-9bec9d56d714
	"github.com/aws/aws-sdk-go" v1.13.3
	"github.com/circonus-labs/circonus-gometrics" v1.2.0
	"github.com/circonus-labs/circonusllhist" v0.0.0-20180104205821-1e65893c4458
	"github.com/cpuguy83/go-md2man" v1.0.8
	"github.com/fluent/fluent-logger-golang" v1.3.0
	"github.com/garyburd/redigo" v1.5.0
	"github.com/go-redis/redis" v0.0.0-20180219000000-71ed499c4651
	"github.com/google/go-github" v0.0.0-20180222172113-9b583fa3cb7d
	"github.com/google/go-querystring" v0.0.0-20170111101155-53e6ce116135
	"github.com/googleapis/gax-go" v1.0.0
	"github.com/grpc-ecosystem/go-grpc-middleware" v0.0.0-20180108155640-d0c54e68681e
	"github.com/grpc-ecosystem/grpc-opentracing" v0.0.0-20171214222146-0e7658f8ee99
	"github.com/hashicorp/go-cleanhttp" v0.0.0-20171218145408-d5fe4b57a186
	"github.com/hashicorp/go-multierror" v0.0.0-20171204182908-b7773ae21874
	"github.com/hashicorp/go-retryablehttp" v0.0.0-20170824180859-794af36148bf
	"github.com/natefinch/lumberjack" v0.0.0-20170911100457-aee462912944
	"github.com/open-policy-agent/opa" v0.7.0
	"github.com/pborman/uuid" v0.0.0-20170612153648-e790cca94e6c
	"github.com/philhofer/fwd" v1.0.0
	"github.com/pquerna/cachecontrol" v0.0.0-20171018203845-0dec1b30a021
	"github.com/spf13/cobra" v0.0.1
	"github.com/spf13/pflag" v1.0.0
	"github.com/tinylib/msgp" v1.0.2
	"github.com/uber/jaeger-client-go" v1.0.0
	"github.com/uber/jaeger-lib" v1.0.0
	"github.com/yuin/gopher-lua" v0.0.0-20180122005251-7d7bc8747e3f
	"golang.org/x/sync" v0.0.0-20171101214715-fd80eb99c8f6
	"golang.org/x/tools" v0.0.0-20180222035806-f8f2f88271bf
	"google.golang.org/api" v0.0.0-20180222000501-ab90adb3efa2
	"google.golang.org/grpc" v1.10.0
	"gopkg.in/bufio.v1" v0.0.0-20140618132640-567b2bfa514e
	"gopkg.in/square/go-jose.v2" v1.1.3-gopkgin-v2.1.3
	"istio.io/api" v0.0.0-20180221152845-a11fc3a78b68
	"k8s.io/api" v0.0.0-20180216210113-b378c47b2dcb
	"k8s.io/apiextensions-apiserver" v0.0.0-20180220060421-90a5ba227a3a
	"k8s.io/apimachinery" v0.0.0-20180216125745-cced8e64b6ca
	"k8s.io/client-go" v0.0.0-20180102000000-9389c055a838
)

replace (
	// Somehow, specifying in "require" section does not work, needs to be replaced.
	"github.com/prometheus/client_golang" v0.8.0 => "github.com/prometheus/client_golang" v0.0.0-20180216000000-e69720d204a4

	// The following two are moved github repositories, vgo reports them as errors.
	// We can't fix this by changing our code, since their internal packages are still
	// referred as the old name.
	// See also: https://github.com/golang/go/issues/23974
	"github.com/uber/jaeger-client-go" v1.0.0 => "github.com/jaegertracing/jaeger-client-go" v0.0.0-20180214000000-d7f08d5091e1
	"github.com/uber/jaeger-lib" v1.0.0 => "github.com/jaegertracing/jaeger-lib" v1.3.0
)
