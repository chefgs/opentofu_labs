# Reusable AWS EC2 module

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Optional: launch in a specific subnet
  subnet_id = var.subnet_id

  # Optional: attach security groups
  vpc_security_group_ids = length(var.vpc_security_group_ids) > 0 ? var.vpc_security_group_ids : null

  tags = merge(
    {
      Name      = var.instance_name
      ManagedBy = "opentofu"
    },
    var.additional_tags
  )
}
