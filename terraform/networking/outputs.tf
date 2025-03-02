output "vnet_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.vnet.name
}

output "web_subnet_id" {
  description = "App Service Subnet ID"
  value       = azurerm_subnet.web_subnet.id
}

output "db_subnet_id" {
  description = "Database Subnet ID"
  value       = azurerm_subnet.db_subnet.id
}