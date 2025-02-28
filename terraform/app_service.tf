# App Service Plan (Linux)
resource "azurerm_service_plan" "app_plan" {
  name                = "python-app-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "PremiumV3"
    size = "P1v3"
  }
}

# Web App (Dockerized)
resource "azurerm_app_service" "app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id

  site_config {
    linux_fx_version = "DOCKER|zltndockerhub/python-app:latest"
    always_on        = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DATABASE_URL" = "postgres://${azurerm_postgresql_flexible_server.db.administrator_login}:${azurerm_postgresql_flexible_server.db.administrator_password}@${azurerm_postgresql_flexible_server.db.fqdn}:5432/${azurerm_postgresql_flexible_server.db.name}"
  }
}