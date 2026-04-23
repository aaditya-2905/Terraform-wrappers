module "distribution" {
  for_each = var.distributions

  source = "aaditya-2905/cloudfront/aws"

  name           = each.value.name
  domain_name    = each.value.domain_name
  enabled        = lookup(each.value, "enabled", true)
  default_ttl    = lookup(each.value, "default_ttl", 86400)
  min_ttl        = lookup(each.value, "min_ttl", 0)
  max_ttl        = lookup(each.value, "max_ttl", 31536000)
  price_class    = lookup(each.value, "price_class", "PriceClass_100")
  viewer_protocol_policy = lookup(each.value, "viewer_protocol_policy", "redirect-to-https")
  compress       = lookup(each.value, "compress", true)
  tags           = lookup(each.value, "tags", {})
}

output "distribution_ids" {
  description = "IDs of created CloudFront distributions"
  value       = { for k, v in module.distribution : k => v.distribution_id }
}

output "distribution_domain_names" {
  description = "Domain names of created CloudFront distributions"
  value       = { for k, v in module.distribution : k => v.domain_name }
}
