locals {
  regions_by_name = {
    for v in local.regions_data_merged : v.name => v
  }
}