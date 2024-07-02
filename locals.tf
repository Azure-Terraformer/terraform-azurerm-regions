locals {
  geo_groups          = distinct([for v in local.regions_data_merged : v.geography_group])
  geos                = distinct([for v in local.regions_data_merged : v.geography])
  locations           = local.all_locations_list
  region_to_zones_map = { for v in local.all_zonemappings_list : v.location => v.zones }
  unfiltered_regions_data_merged = [
    for location in local.locations :
    merge(
      location,
      {
        zones = lookup(local.region_to_zones_map, location.display_name, [])
      }
    )
  ]
  regions_data_merged = [
    for location in local.unfiltered_regions_data_merged : location
    if(!var.availability_zones_required || length(location.zones) > 1)
  ]
}