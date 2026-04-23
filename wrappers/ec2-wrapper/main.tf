module "instance" {
  for_each = var.instances

  source = "aaditya-2905/ec2/aws"

  name                    = each.value.name
  ami                     = each.value.ami
  instance_type           = each.value.instance_type
  subnet_id               = each.value.subnet_id
  security_groups         = lookup(each.value, "security_groups", [])
  key_name                = lookup(each.value, "key_name", null)
  associate_public_ip_address = lookup(each.value, "associate_public_ip_address", false)
  root_volume_size        = lookup(each.value, "root_volume_size", 20)
  root_volume_type        = lookup(each.value, "root_volume_type", "gp2")
  monitoring              = lookup(each.value, "monitoring", false)
  tags                    = lookup(each.value, "tags", {})
}

output "instance_ids" {
  description = "IDs of created EC2 instances"
  value       = { for k, v in module.instance : k => v.instance_id }
}

output "instance_private_ips" {
  description = "Private IPs of created EC2 instances"
  value       = { for k, v in module.instance : k => v.private_ip }
}
