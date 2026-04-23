variable "clusters" {
  description = "Map of ECS cluster configurations"
  type = map(object({
    name                         = string
    capacity_providers           = optional(list(string))
    default_capacity_provider    = optional(string)
    container_insights           = optional(string)
    enable_execute_command       = optional(bool)
    setting                      = optional(string)
    tags                         = optional(map(string))
  }))
  default = {}
}
