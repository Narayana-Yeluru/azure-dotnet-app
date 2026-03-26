provider "azurerm" {
  features {}
}

# Reference existing Resource Group
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# Reference existing App Service Plan
data "azurerm_app_service_plan" "existing" {
  name                = var.app_service_plan_name
  resource_group_name = data.azurerm_resource_group.existing.name
}

# Create App Service (Linux, .NET 7)
resource "azurerm_linux_web_app" "webapp" {
  name                = "${var.environment}-dotnet-webapp-${random_string.suffix.result}"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  service_plan_id     = data.azurerm_app_service_plan.existing.id

  site_config {
    application_stack {
      dotnet_version = "7.0"
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}

# Random suffix for unique name
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}
