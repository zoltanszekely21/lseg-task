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

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "app-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "web_subnet_cidr" {
  description = "CIDR block for App Service Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "db_subnet_cidr" {
  description = "CIDR block for Database Subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
