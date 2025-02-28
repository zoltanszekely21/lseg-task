output "app_service_url" {
  value       = azurerm_app_service.app.default_site_hostname
  description = "The URL of the deployed Web App"
}

output "database_connection_string" {
  value       = "postgres://${var.admin_user}:${var.admin_password}@${azurerm_postgresql_flexible_server.db.fqdn}:5432/${var.database_name}"
  sensitive   = true
  description = "Database connection string"
}