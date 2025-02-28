# PostgreSQL Firewall Rule (Allow Azure Services)
resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name                = "AllowAzureServices"
  server_id          = azurerm_postgresql_flexible_server.db.id
  start_ip_address   = "0.0.0.0"
  end_ip_address     = "0.0.0.0"
}

# Identity for App Service
resource "azurerm_user_assigned_identity" "app_identity" {
  name                = "app-service-identity"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}