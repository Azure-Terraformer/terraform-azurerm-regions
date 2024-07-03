data "azapi_resource_action" "vm_size_data" {
  type                   = "Microsoft.Compute@2021-07-01"
  resource_id            = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/providers/Microsoft.Compute"
  action                 = "skus?api-version=2021-07-01&$filter=location%20eq%20'${var.location}'"
  method                 = "GET"
  response_export_values = ["*"]
}

locals {
  vm_size_data = jsondecode(data.azapi_resource_action.vm_size_data.output)
}

resource "local_file" "vm_size_data" {
  content  = jsonencode(local.vm_size_data)
  filename = "${path.module}/vm_size_data.json"
}