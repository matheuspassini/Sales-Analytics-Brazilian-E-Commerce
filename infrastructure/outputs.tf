# S3 Bucket Outputs
output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.s3.bucket_arn
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3.name_bucket
}

# IAM Outputs
output "glue_role_name" {
  description = "Name of the Glue IAM role"
  value       = module.iam.glue_s3_access_role_name
}

output "glue_role_arn" {
  description = "ARN of the Glue IAM role"
  value       = module.iam.glue_s3_access_role_arn
}
