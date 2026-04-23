module "sg" {
  for_each = var.sgs

  source = "aaditya-2905/sg/aws"

  name        = each.value.name
  description = lookup(each.value, "description", each.value.name)
  vpc_id      = each.value.vpc_id
  ingress_rules = lookup(each.value, "ingress_rules", [])
  egress_rules = lookup(each.value, "egress_rules", [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ])
  tags = lookup(each.value, "tags", {})
}

output "sg_ids" {
  description = "IDs of created Security Groups"
  value       = { for k, v in module.sg : k => v.sg_id }
}
