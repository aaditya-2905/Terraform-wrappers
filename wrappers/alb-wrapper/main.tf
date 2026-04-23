module "alb" {
  for_each = var.albs

  source = "aaditya-2905/alb/aws"

  name               = each.value.name
  load_balancer_type = lookup(each.value, "load_balancer_type", "application")
  internal           = lookup(each.value, "internal", false)
  security_groups    = lookup(each.value, "security_groups", [])
  subnets            = each.value.subnets
  enable_deletion_protection = lookup(each.value, "enable_deletion_protection", false)
  enable_http2       = lookup(each.value, "enable_http2", true)
  enable_cross_zone_load_balancing = lookup(each.value, "enable_cross_zone_load_balancing", true)
  tags               = lookup(each.value, "tags", {})
}

output "alb_arns" {
  description = "ARNs of created ALBs"
  value       = { for k, v in module.alb : k => v.alb_arn }
}

output "alb_dns_names" {
  description = "DNS names of created ALBs"
  value       = { for k, v in module.alb : k => v.alb_dns_name }
}
