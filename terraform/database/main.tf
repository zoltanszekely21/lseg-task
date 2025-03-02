resource "azurerm_postgresql_flexible_server" "db" {
  name                = "app-db-server1"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "GP_Standard_D2s_v3"
  storage_mb          = 32768
  version             = "13"
  administrator_login    = var.db_admin_user
  administrator_password = var.db_admin_password
}

resource "azurerm_postgresql_flexible_server_database" "app_db" {
  name      = "appdb"
  server_id = azurerm_postgresql_flexible_server.db.id
  charset   = "UTF8"
  collation = "C.UTF-8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_app" {
  name             = "AllowAppService"
  server_id        = azurerm_postgresql_flexible_server.db.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}
