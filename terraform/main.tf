terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


# Resource Group
module "resource_group" {
  source              = "./modules/resource_group"
  environment         = var.environment
}

# App Service
module "app_service" {
  source              = "./modules/app_service"
  resource_group_name = module.resource_group.name
  environment         = var.environment
}

# Database
module "database" {
  source              = "./modules/database"
  resource_group_name = module.resource_group.name
  environment         = var.environment
}

# Storage
module "storage" {
  source              = "./modules/storage"
  resource_group_name = module.resource_group.name
  environment         = var.environment
}

# Outputs
output "app_service_url" {
  value       = module.app_service.url
  description = "Deployed App Service URL"
}