output "regions_by_display_name" {
  value       = module.regions.regions_by_display_name
  description = "Regions displayed by name"
  sensitive   = false
}