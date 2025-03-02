variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "python-app-rg"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "North Europe"
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
  default     = "python-webapp"
}

variable "app_service_plan_sku" {
  description = "SKU for the App Service Plan"
  type        = string
  default     = "S1"
}

variable "acr_login_server" {
  description = "Azure Container Registry login server"
  type        = string
  default     = "zltnacr.azurecr.io"
}

variable "acr_admin_username" {
  description = "Azure Container Registry admin username"
  type        = string
  default     = "zltnacr"
}

variable "acr_admin_password" {
  description = "Azure Container Registry admin password"
  type        = string
  sensitive   = true
}

variable "db_admin_user" {
  description = "PostgreSQL admin username"
  type        = string
  default     = "adminuser"
}

variable "db_admin_password" {
  description = "PostgreSQL admin password"
  type        = string
  sensitive   = true
}

variable "db_fqdn" {
  description = "PostgreSQL FQDN"
  type        = string
  default     = "app-db-server1.database.windows.net"
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "appdb"
}

variable "db_connection_string" {
  description = "Database connection string"
  type        = string
  sensitive   = true
}