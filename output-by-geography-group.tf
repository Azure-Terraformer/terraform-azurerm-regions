locals {
  regions_by_geography_group = {
    for geo_group in local.geo_groups : geo_group => [
      for v in local.regions_data_merged : v if v.geography_group == geo_group
    ]
  }
}