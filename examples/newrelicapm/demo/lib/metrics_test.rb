require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'opentelemetry-sdk',
    path: '/Users/kreopelle/dev/opentelemetry-ruby',
    # git: 'https://github.com/xuan-cao-swi/opentelemetry-ruby',
    # branch: 'otlp-metrics-exporter',
    glob: 'sdk/*.gemspec'

  gem 'opentelemetry-metrics-api',
    path: '/Users/kreopelle/dev/opentelemetry-ruby/metrics_api'
    # git: 'https://github.com/xuan-cao-swi/opentelemetry-ruby',
    # branch: 'otlp-metrics-exporter',
    # glob: 'metrics_api/*.gemspec'

  gem 'opentelemetry-metrics-sdk',
    path: '/Users/kreopelle/dev/opentelemetry-ruby/metrics_sdk'
    # git: 'https://github.com/xuan-cao-swi/opentelemetry-ruby',
    # branch: 'otlp-metrics-exporter',
    # glob: 'metrics_sdk/*.gemspec'

  gem 'opentelemetry-exporter-otlp',
    path: '/Users/kreopelle/dev/opentelemetry-ruby/exporter/otlp'
    # git: 'https://github.com/xuan-cao-swi/opentelemetry-ruby',
    # branch: 'otlp-metrics-exporter',
    # glob: 'exporter/otlp/*.gemspec'
end

require 'opentelemetry/sdk'
require 'opentelemetry-metrics-sdk'
require 'opentelemetry/exporter/otlp'

# ENV['OTEL_EXPORTER_OTLP_HEADERS'] = "api-key=ENV['NEW_RELIC_STAGING_KEY']"
# ENV['OTEL_EXPORTER_OTLP_ENDPOINT'] = 'https://staging-otlp.nr-data.net:4317'
ENV['OTEL_EXPORTER_OTLP_HEADERS'] = "api-key=#{ENV['NEW_RELIC_API_KEY']}"
ENV['OTEL_EXPORTER_OTLP_ENDPOINT'] = 'https://otlp.nr-data.net:4317'
ENV['OTEL_SERVICE_NAME'] = 'otlp-metrics-exporter-test'
ENV['OTEL_LOG_LEVEL'] = 'debug'
ENV['OTEL_METRICS_EXPORTER'] = 'otlp'

OpenTelemetry::SDK.configure

# To start a trace you need to get a Tracer from the TracerProvider

# otlp_metric_exporter = OpenTelemetry::Exporter::OTLP::MetricsExporter.new

# OpenTelemetry.meter_provider.add_metric_reader(otlp_metric_exporter)

meter = OpenTelemetry.meter_provider.meter("SAMPLE_METER_NAME")

# counter = meter.create_counter('counter_k', unit: 'ounce', description: 'mL')
# 5.times { |i| counter.add(1, attributes: {'loop': "#{i}"}) }
histogram = meter.create_histogram('histogram', unit: 'smidgen', description: 'description')

histogram.record(123, attributes: {'foo' => 'bar'})
histogram.record(123, attributes: {'foo' => 'baz'})
histogram.record(100, attributes: {'foo' => 'bar'})
OpenTelemetry.meter_provider.metric_readers.each(&:pull)
OpenTelemetry.meter_provider.shutdown
# not seeing a new app in New Relic
# API key is correct
# headers are correct
# URI is correct
# Get a success response
# why aren't the metrics sending??
