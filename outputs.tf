output "resource_group_name" {
  value = data.azurerm_resource_group.abenbrief12.name
}

output "location" {
  value = data.azurerm_resource_group.abenbrief12.location
}

output "adressippublic" {
  value = azurerm_public_ip.test.ip_address
}

output "ipprive1" {
  value = azurerm_network_interface.test[0].private_ip_address
}

output "iprive2" {
  value = azurerm_network_interface.test[1].private_ip_address
}
