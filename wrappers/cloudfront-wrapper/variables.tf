variable "distributions" {
  description = "Map of CloudFront distribution configurations"
  type = map(object({
    name           = string
    domain_name    = string
    enabled        = optional(bool)
    default_ttl    = optional(number)
    min_ttl        = optional(number)
    max_ttl        = optional(number)
    price_class    = optional(string)
    viewer_protocol_policy = optional(string)
    compress       = optional(bool)
    tags           = optional(map(string))
  }))
  default = {}
}
