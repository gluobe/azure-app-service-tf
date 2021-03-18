data "azurerm_resource_group" "workshop" {
  name = var.resource_group
}

data "azurerm_resource_group" "domain" {
  name = var.dns_rg
}

data "azurerm_dns_zone" "domain" {
  name = var.dns_zone
  resource_group_name = data.azurerm_resource_group.domain.name
}
