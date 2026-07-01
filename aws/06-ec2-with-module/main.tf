# EC2 with module example

# Data source to get the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Use the reusable EC2 module
module "web_server" {
  source = "../../modules/aws-ec2"

  # Pass variables to the module
  instance_name = "${var.project_name}-${var.environment}-web"
  ami_id        = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  additional_tags = {
    Role = "web-server"
  }
}
