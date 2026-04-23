variable "instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    name                    = string
    ami                     = string
    instance_type           = string
    subnet_id               = string
    security_groups         = optional(list(string))
    key_name                = optional(string)
    associate_public_ip_address = optional(bool)
    root_volume_size        = optional(number)
    root_volume_type        = optional(string)
    monitoring              = optional(bool)
    tags                    = optional(map(string))
  }))
  default = {}
}
