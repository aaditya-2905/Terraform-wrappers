output "alb_arn" {
  description = "The ARN of the created load balancer"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  description = "The DNS name (URL) to access your load balancer"
  value       = module.alb.alb_dns_name
}

output "alb_zone_id" {
  description = "The Zone ID of the load balancer. Use for Route53 alias records."
  value       = module.alb.alb_zone_id
}

output "target_group_arns" {
  description = "ARNs of the created target groups"
  value       = module.alb.target_group_arns
}
