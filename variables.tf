variable "geography" {
  description = "The geography of the region."
  type        = string
  default     = null
}
variable "geography_group" {
  description = "The geography group of the region."
  type        = string
  default     = null
}
variable "availability_zones_required" {
  type    = bool
  default = true
}
variable "include_only_recommended_regions" {
  type    = bool
  default = false
}