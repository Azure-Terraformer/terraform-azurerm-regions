module "regions" {
  source                      = "../../"
  geography_group             = "US"
  availability_zones_required = true
}

output "regions_by_display_name" {
  value = module.regions.regions_by_display_name
}

provider "azurerm" {
  features {}
}