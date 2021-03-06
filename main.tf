resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr]
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.subnet_names[count.index]}-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  count               = length(var.subnet_names)
}

resource "azurerm_subnet" "subnet" {
  name                      = "${var.subnet_names[count.index]}-SUBNET"
  virtual_network_name      = azurerm_virtual_network.vnet.name
  resource_group_name       = var.resource_group_name
  address_prefixes          = [var.subnet_prefixes[count.index]]
  count                     = length(var.subnet_names)
}

resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  subnet_id                 = element(azurerm_subnet.subnet.*.id, count.index)
  network_security_group_id = element(azurerm_network_security_group.nsg.*.id, count.index)
  count                     = length(var.subnet_names)
}
