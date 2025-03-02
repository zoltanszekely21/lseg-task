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

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "zltnacr"
}

variable "acr_sku" {
  description = "SKU for the ACR"
  type        = string
  default     = "Basic"
}
