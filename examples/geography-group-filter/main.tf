module "regions" {
  source                      = "../../"
  geography_group             = "Europe"
  availability_zones_required = true
}