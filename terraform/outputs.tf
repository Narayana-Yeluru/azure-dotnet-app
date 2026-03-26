output "dotnet_app_url" {
  value = azurerm_linux_web_app.dotnet_app.default_hostname
}

output "node_app_url" {
  value = azurerm_linux_web_app.node_app.default_hostname
}

output "python_app_url" {
  value = azurerm_linux_web_app.python_app.default_hostname
}
