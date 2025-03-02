output "db_name" {
  description = "PostgreSQL Database Name"
  value       = azurerm_postgresql_flexible_server_database.app_db.name
}

output "db_fqdn" {
  description = "FQDN of the PostgreSQL Server"
  value       = azurerm_postgresql_flexible_server.db.fqdn
}

output "db_admin_user" {
  description = "Database admin username"
  value       = azurerm_postgresql_flexible_server.db.administrator_login
}

output "db_admin_password" {
  description = "PostgreSQL administrator password"
  value       = azurerm_postgresql_flexible_server.db.administrator_password
  sensitive   = true
}

output "db_connection_string" {
  description = "Database connection string"
  value       = "postgresql://${azurerm_postgresql_flexible_server.db.administrator_login}:${azurerm_postgresql_flexible_server.db.administrator_password}@${azurerm_postgresql_flexible_server.db.fqdn}/${azurerm_postgresql_flexible_server_database.app_db.name}"
  sensitive   = true
}