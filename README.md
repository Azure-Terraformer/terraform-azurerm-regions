# Azure Regions and Availability Zones module

This module provides an output of all Azure regions and availability zones.

The module outputs a list of objects with the following attributes:

- `name` - The name of the region. E.g. "eastus"
- `display_name` - The display name of the region. E.g. "East US".
- `paired_region_name` - The name of the region paired with this region.  May be `null` if the region has no pair.
- `geography` - The geography of the region.
- `geography_group` - The geography group of the region.
- `zones` - A list of the availability zones in the region. Will be `null` if the region does not support zones.

This data is the further composed into useful maps keyed by region name and region display name.

## Usage

```json
module "regions" {
  source  = "Azure/regions/azurerm"
}

output "regions" {
  value = module.regions.regions
}
```

## Credits

Based off the work of matt-FFFFFF and his version found [here](https://github.com/Azure/terraform-azurerm-regions)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.74.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | >= 1.9.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource_action.compute_provider](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/resource_action) | data source |
| [azapi_resource_action.locations](https://registry.terraform.io/providers/azure/azapi/latest/docs/data-sources/resource_action) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones_required"></a> [availability\_zones\_required](#input\_availability\_zones\_required) | If true, will only include regions that have availability zones.<br><br>  If false, will include all regions, regardless of whether they have availability zones.<br><br>  The default is false. | `bool` | `false` | no |
| <a name="input_geography"></a> [geography](#input\_geography) | The code for the geography to filter by. For example, "United Kingdom" or "United States". | `string` | `null` | no |
| <a name="input_geography_group"></a> [geography\_group](#input\_geography\_group) | The code for the geography group to filter by. For example, "US" or "Europe". | `string` | `null` | no |
| <a name="input_include_only_recommended_regions"></a> [include\_only\_recommended\_regions](#input\_include\_only\_recommended\_regions) | If true, will only include regions that are recommended for new resources.<br><br>  If false, will include all regions, regardless of whether they are recommended for new resources.<br><br>  The default is false. The 'recommended' attribute is a qualitiative determined by Microsoft. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_region_names"></a> [all\_region\_names](#output\_all\_region\_names) | A list of all region names. |
| <a name="output_regions"></a> [regions](#output\_regions) | A list of region objects. Each region object contains the following attributes:<br><br>- `name` - The name of the region.<br>- `display_name` - The display name of the region.<br>- `paired_region_name` - The name of the region paired with this region. May be `null` if the region has no pair.<br>- `geography` - The geography of the region.<br>- `geography_group` - The geography group of the region.<br>- `zones` - A list of the availability zones in the region. Will be empty if the region does not support zones. |
| <a name="output_regions_by_display_name"></a> [regions\_by\_display\_name](#output\_regions\_by\_display\_name) | A map of region display names to region objects. See `regions` output for more details. |
| <a name="output_regions_by_geography"></a> [regions\_by\_geography](#output\_regions\_by\_geography) | A map of geographies to a list of region objects. See `regions` output for more details. |
| <a name="output_regions_by_geography_group"></a> [regions\_by\_geography\_group](#output\_regions\_by\_geography\_group) | A map of geography groups to a list of region objects. See `regions` output for more details. |
| <a name="output_regions_by_name"></a> [regions\_by\_name](#output\_regions\_by\_name) | A map of region display names to region objects. See `regions` output for more details. |
| <a name="output_regions_by_name_or_display_name"></a> [regions\_by\_name\_or\_display\_name](#output\_regions\_by\_name\_or\_display\_name) | A map of regions by either display names or name, to region objects. See `regions` output for more details. |
| <a name="output_supported_geographies"></a> [supported\_geographies](#output\_supported\_geographies) | Supported geographies. |
| <a name="output_supported_geography_groups"></a> [supported\_geography\_groups](#output\_supported\_geography\_groups) | Supported geography groups. |
<!-- END_TF_DOCS -->