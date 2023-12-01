# frozen_string_literal: true

# ENV['OTEL_EXPORTER_OTLP_HEADERS'] = "api-key=#{ENV['NEW_RELIC_API_KEY]}"
# ENV['OTEL_SERVICE_NAME'] = 'rails71-test'
# ENV['OTEL_EXPORTER_OTLP_ENDPOINT'] = 'https://otlp.nr-data.net:4317'
# ENV['OTEL_LOGS_EXPORTER'] = 'otlp'

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry-metrics-sdk'
# require 'opentelemetry/exporter/otlp_logs'

# ENV['OTEL_TRACES_EXPORTER'] = 'console'

ENV['OTEL_EXPORTER_OTLP_HEADERS'] = "api-key=#{ENV['NEW_RELIC_API_KEY']}"
ENV['OTEL_EXPORTER_OTLP_ENDPOINT'] = 'https://otlp.nr-data.net:4317'
ENV['OTEL_SERVICE_NAME'] = 'otlp-metrics-exporter-test'
ENV['OTEL_LOG_LEVEL'] = 'debug'
ENV['OTEL_METRICS_EXPORTER'] = 'otlp'

OpenTelemetry::SDK.configure(&:use_all)

# require 'bundler/inline'

# require 'opentelemetry/sdk'


# ENV['OTEL_EXPORTER_OTLP_HEADERS'] = "api-key=#{ENV['NEW_RELIC_STAGING_KEY']"
# ENV['OTEL_EXPORTER_OTLP_ENDPOINT'] = 'https://staging-otlp.nr-data.net:4317'


# OpenTelemetry::SDK.configure

# To start a trace you need to get a Tracer from the TracerProvider

# otlp_metric_exporter = OpenTelemetry::Exporter::OTLP::MetricsExporter.new

# OpenTelemetry.meter_provider.add_metric_reader(otlp_metric_exporter)

METER = OpenTelemetry.meter_provider.meter("SAMPLE_METER_NAME")
HISTOGRAM = METER.create_histogram('histogram', unit: 'smidgen', description: 'description')
# counter = meter.create_counter('counter_k', unit: 'ounce', description: 'mL')
# 5.times { |i| counter.add(1, attributes: {'loop': "#{i}"}) }

# not seeing a new app in New Relic
# API key is correct
# headers are correct
# URI is correct
# Get a success response
# why aren't the metrics sending??
