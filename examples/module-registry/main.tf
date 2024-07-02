module "regions" {
  source  = "Azure-Terraformer/regions/azurerm"
  version = "1.0.1"
}

provider "azurerm" {
  features {}
}