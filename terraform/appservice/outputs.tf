output "app_service_name" {
  description = "App Service Name"
  value       = azurerm_app_service.app.name
}

output "app_service_url" {
  description = "URL of the deployed app"
  value       = "https://${azurerm_app_service.app.default_site_hostname}"
}