# AWS EC2 instance example

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

# Security group allowing SSH and HTTP traffic
resource "aws_security_group" "example" {
  name        = "${var.project_name}-${var.environment}-sg"
  description = "Security group for the example EC2 instance"

  # Allow SSH from your IP (restrict this in production)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr]
    description = "SSH access"
  }

  # Allow HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffic"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-sg"
  }
}

# EC2 instance
resource "aws_instance" "example" {
  # Use the latest Amazon Linux 2023 AMI
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.example.id]

  # Optional: attach an existing key pair for SSH access
  # key_name = var.key_pair_name

  tags = {
    Name = "${var.project_name}-${var.environment}-instance"
  }
}
