resource "azurerm_postgresql_flexible_server" "db" {
  name                = var.database_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name           = "GP_Standard_D2s_v3"

  administrator_login    = var.admin_user
  administrator_password = var.admin_password

  storage_mb = 32768
}