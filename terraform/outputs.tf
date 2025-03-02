output "resource_group_name" {
  description = "RG name"
  value       = azurerm_resource_group.rg.name
}

output "vnet_name" {
  description = "VNet name"
  value       = module.networking.vnet_name
}

output "app_service_name" {
  description = "App Service name"
  value       = module.appservice.app_service_name
}

output "app_service_url" {
  description = "Deployed app URL"
  value       = "https://${module.appservice.app_service_url}"
}

output "db_name" {
  description = "PostgreSQL DB name"
  value       = module.database.db_name
}

output "db_fqdn" {
  description = "FQDN of the PostgreSQL server"
  value       = module.database.db_fqdn
}

output "db_connection_string" {
  description = "PostgreSQL DB connection string"
  value       = module.database.db_connection_string
  sensitive   = true
}

output "acr_login_server" {
  description = "Azure Container Registry login server"
  value       = module.acr.acr_login_server
}

output "acr_admin_username" {
  description = "Azure Container Registry username"
  value       = module.acr.acr_admin_username
}

output "acr_admin_password" {
  description = "Azure Container Registry password"
  value       = module.acr.acr_admin_password
  sensitive   = true
}