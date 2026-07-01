output "state_bucket_name" {
  description = "The S3 bucket name for remote state"
  value       = aws_s3_bucket.state.id
}

output "state_bucket_arn" {
  description = "The S3 bucket ARN"
  value       = aws_s3_bucket.state.arn
}

output "lock_table_name" {
  description = "The DynamoDB lock table name"
  value       = aws_dynamodb_table.state_lock.id
}

output "backend_config" {
  description = "Backend configuration block to use in other projects"
  value       = <<-EOT
    terraform {
      backend "s3" {
        bucket         = "${aws_s3_bucket.state.id}"
        key            = "myproject/terraform.tfstate"
        region         = "${var.aws_region}"
        encrypt        = true
        dynamodb_table = "${aws_dynamodb_table.state_lock.id}"
      }
    }
  EOT
}
