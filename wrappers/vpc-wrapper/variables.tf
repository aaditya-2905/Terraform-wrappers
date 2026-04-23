variable "vpcs" {
  description = "Map of VPC configurations"
  type = map(object({
    name                   = string
    cidr_block             = string
    enable_dns_hostnames   = optional(bool)
    enable_dns_support     = optional(bool)
    enable_nat_gateway     = optional(bool)
    tags                   = optional(map(string))
  }))
  default = {}
}
