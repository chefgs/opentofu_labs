variable "instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"

  validation {
    condition     = can(regex("^[a-z][0-9][a-z]?\\.", var.instance_type))
    error_message = "Must be a valid EC2 instance type (e.g., t3.micro, m5.large)."
  }
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in (optional)"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to attach"
  type        = list(string)
  default     = []
}

variable "additional_tags" {
  description = "Additional tags to apply to the instance"
  type        = map(string)
  default     = {}
}
