resource "aws_api_gateway_method_settings" "api_gateway_method_settings" {
  for_each = var.api_gateway_method_settings

  method_path = each.value.method_path
  rest_api_id = each.value.rest_api_id
  stage_name  = each.value.stage_name
  region      = each.value.region

  settings {
    cache_data_encrypted                       = each.value.settings.cache_data_encrypted
    cache_ttl_in_seconds                       = each.value.settings.cache_ttl_in_seconds
    caching_enabled                            = each.value.settings.caching_enabled
    data_trace_enabled                         = each.value.settings.data_trace_enabled
    logging_level                              = each.value.settings.logging_level
    metrics_enabled                            = each.value.settings.metrics_enabled
    require_authorization_for_cache_control    = each.value.settings.require_authorization_for_cache_control
    throttling_burst_limit                     = each.value.settings.throttling_burst_limit
    throttling_rate_limit                      = each.value.settings.throttling_rate_limit
    unauthorized_cache_control_header_strategy = each.value.settings.unauthorized_cache_control_header_strategy
  }
}

