variable "albs" {
  description = "Map of ALB configurations"
  type = map(object({
    name               = string
    load_balancer_type = optional(string)
    internal           = optional(bool)
    security_groups    = optional(list(string))
    subnets            = list(string)
    enable_deletion_protection = optional(bool)
    enable_http2       = optional(bool)
    enable_cross_zone_load_balancing = optional(bool)
    tags               = optional(map(string))
  }))
  default = {}
}
