locals {
  regions_by_geography = {
    for geo in local.geos : geo => [
      for v in local.regions_data_merged : v if v.geography == geo
    ]
  }
}