variable "resource_group_name" {
  description = "Azure RG name"
  type        = string
  default     = "python-app-rg"
}

variable "location" {
  description = "Deployment Region"
  type        = string
  default     = "North Europe"
}

variable "vnet_name" {
  description = "VNet Name"
  type        = string
  default     = "app-vnet"
}

variable "web_subnet_cidr" {
  description = "CIDR block for the web subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "db_subnet_cidr" {
  description = "CIDR block for the database subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "db_name" {
  description = "PostgreSQL DB name"
  type        = string
  default     = "appdb"
}

variable "db_admin_user" {
  description = "PostgreSQL DB admin username"
  type        = string
  default     = "adminuser"
}

variable "db_admin_password" {
  description = "PostgreSQL DB admin password"
  type        = string
  sensitive   = true
  default = "Pass1234"
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
  default     = "zltnacr"
}

variable "app_service_name" {
  description = "Azure App Service name"
  type        = string
  default     = "python-webapp"
}

variable "app_service_plan_sku" {
  description = "App Service Plan SKU size"
  type        = string
  default     = "S1"
}