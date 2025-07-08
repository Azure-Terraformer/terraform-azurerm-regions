# These resources allow the use of live data from the Azure API
data "azapi_resource_action" "compute_provider" {
  type                   = "Microsoft.Resources/subscriptions@2023-07-01"
  action                 = "providers/Microsoft.Compute"
  method                 = "GET"
  resource_id            = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  response_export_values = ["resourceTypes"]
}

locals {
  all_zonemappings_list = tolist(flatten([
    for resource_type in data.azapi_resource_action.compute_provider.output.resourceTypes : [
      for mapping in resource_type.zoneMappings : [{
        location = mapping.location
        zones    = sort([for zone in mapping.zones : tonumber(zone)])
      }]
    ] if(resource_type.resourceType == "virtualMachines")
  ]))
}
