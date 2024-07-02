variable "primary_region" {
  type = string

  validation {
    condition     = contains(module.regions.supported_geographies, var.primary_region)
    error_message = "The primary region must be a supported region."
  }
}