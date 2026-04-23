variable "repositories" {
  description = "Map of ECR repository configurations"
  type = map(object({
    name                 = string
    image_tag_mutability = optional(string)
    scan_on_push         = optional(bool)
    image_retention_days = optional(number)
    encryption_type      = optional(string)
    tags                 = optional(map(string))
  }))
  default = {}
}
