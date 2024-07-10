variable "primary_region" {
  type = string

  validation {
    condition     = contains(module.regions.all_region_names, var.primary_region)
    error_message = "The primary region must be a supported region."
  }
  description = "value of the primary region"
  sensitive   = false
}