output "api_gateway_method_settings_id" {
  description = "Map of id values across all api_gateway_method_settings, keyed the same as var.api_gateway_method_settings"
  value       = { for k, v in aws_api_gateway_method_settings.api_gateway_method_settings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "api_gateway_method_settings_method_path" {
  description = "Map of method_path values across all api_gateway_method_settings, keyed the same as var.api_gateway_method_settings"
  value       = { for k, v in aws_api_gateway_method_settings.api_gateway_method_settings : k => v.method_path if v.method_path != null && length(v.method_path) > 0 }
}
output "api_gateway_method_settings_region" {
  description = "Map of region values across all api_gateway_method_settings, keyed the same as var.api_gateway_method_settings"
  value       = { for k, v in aws_api_gateway_method_settings.api_gateway_method_settings : k => v.region if v.region != null && length(v.region) > 0 }
}
output "api_gateway_method_settings_rest_api_id" {
  description = "Map of rest_api_id values across all api_gateway_method_settings, keyed the same as var.api_gateway_method_settings"
  value       = { for k, v in aws_api_gateway_method_settings.api_gateway_method_settings : k => v.rest_api_id if v.rest_api_id != null && length(v.rest_api_id) > 0 }
}
output "api_gateway_method_settings_settings" {
  description = "Map of settings values across all api_gateway_method_settings, keyed the same as var.api_gateway_method_settings"
  value       = { for k, v in aws_api_gateway_method_settings.api_gateway_method_settings : k => one(v.settings) if v.settings != null && length(v.settings) > 0 }
}
output "api_gateway_method_settings_stage_name" {
  description = "Map of stage_name values across all api_gateway_method_settings, keyed the same as var.api_gateway_method_settings"
  value       = { for k, v in aws_api_gateway_method_settings.api_gateway_method_settings : k => v.stage_name if v.stage_name != null && length(v.stage_name) > 0 }
}

