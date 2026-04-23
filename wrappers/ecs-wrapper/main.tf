module "cluster" {
  for_each = var.clusters

  source = "aaditya-2905/ecs/aws"

  name                      = each.value.name
  capacity_providers        = lookup(each.value, "capacity_providers", ["FARGATE"])
  default_capacity_provider = lookup(each.value, "default_capacity_provider", "FARGATE")
  container_insights        = lookup(each.value, "container_insights", "disabled")
  enable_execute_command    = lookup(each.value, "enable_execute_command", false)
  setting                   = lookup(each.value, "setting", "containerInsights")
  tags                      = lookup(each.value, "tags", {})
}

output "cluster_arns" {
  description = "ARNs of created ECS clusters"
  value       = { for k, v in module.cluster : k => v.cluster_arn }
}

output "cluster_names" {
  description = "Names of created ECS clusters"
  value       = { for k, v in module.cluster : k => v.cluster_name }
}
