# Create a resource group
resource "azurerm_resource_group" "bistec_rg" {
  name     = "bistec_rg"
  location = "West Europe"
}