data "azurerm_resource_group" "workshop" {
   name = var.resource_group
}

# data "terraform_remote_state" "resource_group" {
#   backend = "local"
#   name = var.resource_group
#}
