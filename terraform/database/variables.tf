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

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdb"
}

variable "db_admin_user" {
  description = "Admin username for PostgreSQL"
  type        = string
  default     = "adminuser"
}

variable "db_admin_password" {
  description = "Admin password for PostgreSQL"
  type        = string
  sensitive   = true
  default = "Pass1234"
}
