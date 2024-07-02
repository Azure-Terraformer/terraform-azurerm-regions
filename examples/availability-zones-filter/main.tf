module "regions" {
  source                      = "../../"
  availability_zones_required = false
}

output "regions_by_display_name" {
  value = module.regions.regions_by_display_name
}

provider "azurerm" {
  features {}
}