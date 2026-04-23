module "vpc" {
  for_each = var.vpcs

  source = "aaditya-2905/vpc/aws"

  name                 = each.value.name
  cidr_block           = each.value.cidr_block
  enable_dns_hostnames = lookup(each.value, "enable_dns_hostnames", true)
  enable_dns_support   = lookup(each.value, "enable_dns_support", true)
  enable_nat_gateway   = lookup(each.value, "enable_nat_gateway", false)
  tags                 = lookup(each.value, "tags", {})
}

output "vpc_ids" {
  description = "IDs of created VPCs"
  value       = { for k, v in module.vpc : k => v.vpc_id }
}

output "vpc_cidr_blocks" {
  description = "CIDR blocks of created VPCs"
  value       = { for k, v in module.vpc : k => v.vpc_cidr_block }
}
