terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "terraformstatezltn1234"
    container_name       = "tfstate2"
    key                  = "terraform.tfstate"
    subscription_id       = "f94c5a2b-36b1-4083-b44a-afe3f7f18fae"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "python-app-rg"
  location = "North Europe"
}

module "networking" {
  source = "./networking"
  vnet_name       = var.vnet_name
  web_subnet_cidr = var.web_subnet_cidr
  db_subnet_cidr  = var.db_subnet_cidr
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
}

module "database" {
  source            = "./database"
  db_name           = var.db_name
  db_admin_user     = var.db_admin_user
  db_admin_password = var.db_admin_password
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
}

module "acr" {
  source   = "./acr"
  acr_name = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
}

module "appservice" {
  source = "./appservice"
  app_service_name       = var.app_service_name
  app_service_plan_sku   = var.app_service_plan_sku
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  
  acr_login_server    = module.acr.acr_login_server
  acr_admin_username  = module.acr.acr_admin_username
  acr_admin_password  = module.acr.acr_admin_password
  
  db_admin_user       = module.database.db_admin_user
  db_admin_password   = module.database.db_admin_password
  db_fqdn             = module.database.db_fqdn
  db_name             = module.database.db_name
  db_connection_string = module.database.db_connection_string
}

