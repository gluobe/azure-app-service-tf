## Storage
### Storage Account
resource "azurerm_storage_account" "app" {

  name = var.name
  resource_group_name = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

  tags = var.tags
}
resource "azurerm_storage_container" "app" {

  name                  = "media"
  storage_account_name  = azurerm_storage_account.app.name
  container_access_type = "blob"
}
## Database
resource "azurerm_cosmosdb_account" "app" {

  name = var.name
  resource_group_name = var.resource_group
  location   = var.location
  offer_type = "Standard"
  kind       = "MongoDB"

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}
## Web App Service
resource "azurerm_app_service_plan" "app" {

  name = var.name
  resource_group_name = var.resource_group
  location = var.location
  kind     = "Linux"
  reserved = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}
resource "azurerm_app_service" "app" {

  name = var.name
  resource_group_name = var.resource_group
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.app.id

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|${var.app_service_registry_host}/${var.app_service_registry_account}/${var.app_service_registry_image_url}"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = var.app_service_registry_host
    "DOCKER_REGISTRY_SERVER_USERNAME"     = var.app_service_registry_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = var.app_service_registry_password
    "CLOUD"                               = "AZ"
    "MANAGED_DB"                          = "true"
    "MANAGED_FILES"                       = "true"
    "AZURE_DB_USER"                       = azurerm_cosmosdb_account_app.name
    "AZURE_DB_PASSWORD"                   = azurerm_cosmosdb_account_app.primary_key
    "AZURE_STORAGE_ACCOUNT"               = azurerm_storage_account.app.name
    "AZURE_STORAGE_CONTAINER"             = azurerm_storage_container.app.name
    "AZURE_STORAGE_KEY"                   = azurerm_storage_account.app.primary_access_key
  }

}

