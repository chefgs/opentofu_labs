output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_state" {
  description = "The state of the EC2 instance"
  value       = aws_instance.example.instance_state
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.example.public_dns
}

output "ami_id" {
  description = "The AMI ID used for the instance"
  value       = data.aws_ami.amazon_linux.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.example.id
}
