provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

data "azurerm_service_plan" "existing" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_linux_web_app" "dotnet_app" {
  name                = "dotnet-app"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  service_plan_id     = data.azurerm_service_plan.existing.id

  site_config {
    always_on = false  # disable for Free/F1/D1 sku
  }

  app_settings = {
    "DOTNET_RUNNING_IN_CONTAINER" = "true"
    "WEBSITES_PORT"               = "8080"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_linux_web_app" "node_app" {
  name                = "node-app"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  service_plan_id     = data.azurerm_service_plan.existing.id

  site_config {
    always_on = false  # disable for Free/F1/D1 sku
  }

  app_settings = {
    "WEBSITES_PORT" = "3000"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_linux_web_app" "python_app" {
  name                = "python-app"
  resource_group_name = data.azurerm_resource_group.existing.name
  location            = data.azurerm_resource_group.existing.location
  service_plan_id     = data.azurerm_service_plan.existing.id

  site_config {
    always_on = false  # disable for Free/F1/D1 sku
  }

  app_settings = {
    "WEBSITES_PORT" = "8000"
  }

  identity {
    type = "SystemAssigned"
  }
}
