resource "azurerm_lb" "test" {
   name                = "loadBalancer"
   location            = data.azurerm_resource_group.abenbrief12.location
   resource_group_name = data.azurerm_resource_group.abenbrief12.name

   frontend_ip_configuration {
     name                 = "publicIPAddress"
     public_ip_address_id = azurerm_public_ip.test.id
   }
 }

 resource "azurerm_lb_backend_address_pool" "test" {
   loadbalancer_id     = azurerm_lb.test.id
   name                = "BackEndAddressPool"
 }
