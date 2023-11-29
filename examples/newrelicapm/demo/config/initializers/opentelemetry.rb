# frozen_string_literal: true

# ENV['OTEL_EXPORTER_OTLP_HEADERS'] = "api-key=#{ENV['NEW_RELIC_API_KEY]}"
# ENV['OTEL_SERVICE_NAME'] = 'rails71-test'
# ENV['OTEL_EXPORTER_OTLP_ENDPOINT'] = 'https://otlp.nr-data.net:4317'
# ENV['OTEL_LOGS_EXPORTER'] = 'otlp'

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/exporter/otlp-logs'

OpenTelemetry::SDK.configure(&:use_all)
