# S3 Module Outputs

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.create_bucket.arn
}

# Bucket Name - Used for reference in other modules
output "name_bucket" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.create_bucket.bucket
}

# Bucket ID - Used for resource references
output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.create_bucket.id
}

