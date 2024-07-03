data "azapi_resource_action" "compute_provider" {
  type                   = "Microsoft.Resources/subscriptions@2023-07-01"
  action                 = "providers/Microsoft.Compute"
  method                 = "GET"
  resource_id            = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  response_export_values = ["*"]
}

locals {
  compute_data = jsondecode(data.azapi_resource_action.compute_provider.output)
}

resource "local_file" "save_compute_data" {
  content  = jsonencode(local.compute_data)
  filename = "${path.module}/compute_data.json"
}