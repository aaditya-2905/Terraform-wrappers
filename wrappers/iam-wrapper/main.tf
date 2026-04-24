locals {
  # Common tags for all resources
  common_tags = merge(
    var.tags,
    {
      created_by = "terraform"
      module     = "iam-wrapper"
    }
  )
}

module "iam" {
  source = "aaditya-2905/iam/aws"

  # Multi-resource configuration
  users              = var.users
  roles              = var.roles
  policies           = var.policies
  groups             = var.groups
  policy_attachments = var.policy_attachments
  group_memberships  = var.group_memberships

  # Common configuration
  tags = local.common_tags
}

output "role_arns" {
  description = "ARNs of created IAM roles"
  value       = try(module.iam.role_arns, {})
}

output "user_arns" {
  description = "ARNs of created IAM users"
  value       = try(module.iam.user_arns, {})
}
