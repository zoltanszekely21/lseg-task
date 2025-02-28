variable "resource_group_name" {
  type        = string
  default     = "python-app-rg"
  description = "Azure Resource Group"
}

variable "location" {
  type        = string
  default     = "North Europe"
  description = "Azure region"
}

variable "app_service_name" {
  type        = string
  default     = "python-app-service"
  description = "App Service name"
}

variable "database_name" {
  type        = string
  default     = "python-app-db"
  description = "PostgreSQL Database name"
}

variable "admin_user" {
  type        = string
  default     = "admin"
  description = "Database Admin User"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Database Password"
}