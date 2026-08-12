variable "api_gateway_method_settings" {
  description = <<EOT
Map of api_gateway_method_settings, attributes below
Required:
    - method_path
    - rest_api_id
    - stage_name
    - settings (block):
        - cache_data_encrypted (optional)
        - cache_ttl_in_seconds (optional)
        - caching_enabled (optional)
        - data_trace_enabled (optional)
        - logging_level (optional)
        - metrics_enabled (optional)
        - require_authorization_for_cache_control (optional)
        - throttling_burst_limit (optional)
        - throttling_rate_limit (optional)
        - unauthorized_cache_control_header_strategy (optional)
Optional:
    - region
EOT

  type = map(object({
    method_path = string
    rest_api_id = string
    stage_name  = string
    region      = optional(string)
    settings = object({
      cache_data_encrypted                       = optional(bool)
      cache_ttl_in_seconds                       = optional(number)
      caching_enabled                            = optional(bool)
      data_trace_enabled                         = optional(bool)
      logging_level                              = optional(string)
      metrics_enabled                            = optional(bool)
      require_authorization_for_cache_control    = optional(bool)
      throttling_burst_limit                     = optional(number)
      throttling_rate_limit                      = optional(number)
      unauthorized_cache_control_header_strategy = optional(string)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_gateway_method_settings : (
        v.settings.logging_level == null || (contains(["OFF", "ERROR", "INFO"], v.settings.logging_level))
      )
    ])
    error_message = "must be one of: OFF, ERROR, INFO"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

