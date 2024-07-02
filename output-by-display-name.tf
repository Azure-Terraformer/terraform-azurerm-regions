locals {
  regions_by_display_name = {
    for v in local.regions_data_merged : v.display_name => v
  }
}