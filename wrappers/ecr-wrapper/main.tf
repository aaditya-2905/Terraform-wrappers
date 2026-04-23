module "repository" {
  for_each = var.repositories

  source = "aaditya-2905/ecr/aws"

  name                 = each.value.name
  image_tag_mutability = lookup(each.value, "image_tag_mutability", "MUTABLE")
  scan_on_push         = lookup(each.value, "scan_on_push", true)
  image_retention_days = lookup(each.value, "image_retention_days", 30)
  encryption_type      = lookup(each.value, "encryption_type", "AES256")
  tags                 = lookup(each.value, "tags", {})
}

output "repository_urls" {
  description = "Repository URLs of created ECR repositories"
  value       = { for k, v in module.repository : k => v.repository_url }
}

output "repository_arns" {
  description = "ARNs of created ECR repositories"
  value       = { for k, v in module.repository : k => v.repository_arn }
}
