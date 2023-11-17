#!/usr/bin/env ruby

# frozen_string_literal: true
require 'net/http'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rack'
  gem 'rackup'
  gem 'webrick'
  gem 'opentelemetry-instrumentation-all'
  gem 'opentelemetry-sdk'
  gem 'opentelemetry-exporter-otlp'
end

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'rack'

OpenTelemetry::SDK.configure do |c|
  c.use_all
end

class MyApp
  def call(env)
    ['200', { "Content-Type" => "text/plain" }, ["hello world"]]
  end
end

Rackup::Handler::WEBrick.run(MyApp.new)
