module "regions" {
  source = "../../"
}

output "regions" {
  value = module.regions.regions
}

provider "azurerm" {
  features {}
}