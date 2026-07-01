# AWS EC2 Module

## Usage

```hcl
module "web_server" {
  source = "../../modules/aws-ec2"

  instance_name = "my-web-server"
  ami_id        = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  additional_tags = {
    Role = "web-server"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| opentofu | >= 1.6 |
| aws | ~> 5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| instance_name | Name tag for the EC2 instance | string | - | yes |
| ami_id | The AMI ID for the instance | string | - | yes |
| instance_type | EC2 instance type | string | t3.micro | no |
| subnet_id | Subnet ID to launch in | string | null | no |
| vpc_security_group_ids | List of security group IDs | list(string) | [] | no |
| additional_tags | Additional tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | The instance ID |
| public_ip | The public IP address |
| private_ip | The private IP address |
