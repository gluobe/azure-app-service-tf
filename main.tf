### Azure App Service ###
module "app-service" {

  name           = var.app_name
  resource_group = data.azurerm_resource_group.workshop.name
  source         = "./modules/azure-app-service"
  location       = data.azurerm_resource_group.workshop.location
  tags           = var.tags

  dns_zone       = data.azurerm_dns_zone.domain.name
  dns_rg         = data.azurerm_resource_group.domain.name

  app_service_registry_username  = var.git_user
  app_service_registry_password  = var.git_password
  app_service_registry_account   = var.git_account
  app_service_registry_host      = var.git_host
  app_service_registry_image_url = var.git_image
}
