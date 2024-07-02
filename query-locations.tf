data "azapi_resource_action" "locations" {
  type                   = "Microsoft.Resources/subscriptions@2022-12-01"
  action                 = "locations"
  method                 = "GET"
  resource_id            = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  response_export_values = ["value"]
}

locals {
  all_physical_locations_list = [
    for location in jsondecode(data.azapi_resource_action.locations.output).value : {
      display_name       = location.displayName
      geography          = location.metadata.geography
      geography_group    = location.metadata.geographyGroup
      id                 = location.id
      name               = location.name
      paired_region_name = try(one(location.metadata.pairedRegion).name, null)
      recommended        = location.metadata.regionCategory == "Recommended"
    }
    if location.metadata.regionType == "Physical"
  ]
  all_locations_list = [
    for location in local.all_physical_locations_list : location
    if(
      (!var.include_only_recommended_regions || location.recommended) &&
      (var.geography_group == null || location.geography_group == var.geography_group)
    )
  ]
}