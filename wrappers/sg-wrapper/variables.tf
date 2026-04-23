variable "sgs" {
  description = "Map of Security Group configurations"
  type = map(object({
    name        = string
    description = optional(string)
    vpc_id      = string
    ingress_rules = optional(list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string))
      security_groups = optional(list(string))
    })))
    egress_rules = optional(list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string))
    })))
    tags = optional(map(string))
  }))
  default = {}
}
