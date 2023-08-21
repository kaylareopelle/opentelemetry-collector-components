// Code generated by mdatagen. DO NOT EDIT.

package metadata

import "go.opentelemetry.io/collector/confmap"

// MetricConfig provides common config for a particular metric.
type MetricConfig struct {
	Enabled bool `mapstructure:"enabled"`

	enabledSetByUser bool
}

func (ms *MetricConfig) Unmarshal(parser *confmap.Conf) error {
	if parser == nil {
		return nil
	}
	err := parser.Unmarshal(ms, confmap.WithErrorUnused())
	if err != nil {
		return err
	}
	ms.enabledSetByUser = parser.IsSet("enabled")
	return nil
}

// MetricsConfig provides config for apm metrics.
type MetricsConfig struct {
	ApmServiceApdex               MetricConfig `mapstructure:"apm.service.apdex"`
	ApmServiceErrorCount          MetricConfig `mapstructure:"apm.service.error.count"`
	ApmServiceTransactionDuration MetricConfig `mapstructure:"apm.service.transaction.duration"`
}

func DefaultMetricsConfig() MetricsConfig {
	return MetricsConfig{
		ApmServiceApdex: MetricConfig{
			Enabled: true,
		},
		ApmServiceErrorCount: MetricConfig{
			Enabled: true,
		},
		ApmServiceTransactionDuration: MetricConfig{
			Enabled: true,
		},
	}
}

// MetricsBuilderConfig is a configuration for apm metrics builder.
type MetricsBuilderConfig struct {
	Metrics MetricsConfig `mapstructure:"metrics"`
}

func DefaultMetricsBuilderConfig() MetricsBuilderConfig {
	return MetricsBuilderConfig{
		Metrics: DefaultMetricsConfig(),
	}
}
