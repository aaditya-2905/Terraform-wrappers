module "role" {
  for_each = var.roles

  source = "aaditya-2905/iam/aws"

  name               = each.value.name
  assume_role_policy = each.value.assume_role_policy
  policy_arns        = lookup(each.value, "policy_arns", [])
  inline_policies    = lookup(each.value, "inline_policies", {})
  max_session_duration = lookup(each.value, "max_session_duration", 3600)
  description        = lookup(each.value, "description", "")
  tags               = lookup(each.value, "tags", {})
}

output "role_arns" {
  description = "ARNs of created IAM roles"
  value       = { for k, v in module.role : k => v.role_arn }
}

output "role_names" {
  description = "Names of created IAM roles"
  value       = { for k, v in module.role : k => v.role_name }
}
