resource "azurerm_app_service_plan" "asp" {
  name                = "app-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "python-webapp"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "DOCKER|zltnacr.azurecr.io/python-hello-world:v1"
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL" = "https://${var.acr_login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.acr_admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.acr_admin_password
    "DATABASE_URL" = var.db_connection_string
    
  }
}