### Azure App Service ###
module "app-service" {

  name          = var.app_name
  resourceGroup = data.azurerm_resource_group.workshop.name
  source        = "./modules/azure-app-service"
  location      = var.location
  tags          = var.tags

  app_service_registry_username  = var.git_user
  app_service_registry_password  = var.git_password
  app_service_registry_account   = var.git_account
  app_service_registry_host      = var.git_host
  app_service_registry_image_url = var.git_image
}
