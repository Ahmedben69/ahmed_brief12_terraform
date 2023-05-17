resource "azurerm_virtual_network" "test" {
   name                = "acctvn"
   address_space       = ["10.0.0.0/16"]
   location            = data.azurerm_resource_group.abenbrief12.location
   resource_group_name = data.azurerm_resource_group.abenbrief12.name
 }

 resource "azurerm_subnet" "test" {
   name                 = "acctsub"
   resource_group_name  = data.azurerm_resource_group.abenbrief12.name
   virtual_network_name = azurerm_virtual_network.test.name
   address_prefixes     = ["10.0.2.0/24"]
 }

 resource "azurerm_public_ip" "test" {
   name                         = "publicIPForLB"
   location                     = data.azurerm_resource_group.abenbrief12.location
   resource_group_name          = data.azurerm_resource_group.abenbrief12.name
   allocation_method            = "Static"
 }

resource "azurerm_network_interface" "test" {
   count               = 2
   name                = "acctni${count.index}"
   location            = data.azurerm_resource_group.abenbrief12.location
   resource_group_name = data.azurerm_resource_group.abenbrief12.name

   ip_configuration {
     name                          = "testConfiguration"
     subnet_id                     = azurerm_subnet.test.id
     private_ip_address_allocation = "dynamic"
   }
 }
