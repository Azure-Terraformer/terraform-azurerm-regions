variable "primary_region" {
  type = string

  validation {
    condition     = contains(module.regions.all_region_names, var.primary_region)
    error_message = "The primary region must be a supported region."
  }
}

module "regions" {
  source  = "Azure-Terraformer/regions/azurerm"
  version = "1.0.2"
}