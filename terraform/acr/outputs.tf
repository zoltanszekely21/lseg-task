output "acr_name" {
  description = "Azure Container Registry name"
  value       = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "ACR Login Server URL"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "ACR Admin Username"
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  description = "ACR Admin Password"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}