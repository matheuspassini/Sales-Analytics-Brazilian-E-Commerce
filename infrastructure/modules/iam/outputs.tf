# IAM Module Outputs - S3 for Glue
output "glue_s3_access_role_name" {
  description = "Name of the Glue S3 access IAM role"
  value       = aws_iam_role.glue_s3_access_role.name
}

output "glue_s3_access_role_arn" {
  description = "ARN of the Glue S3 access IAM role"
  value       = aws_iam_role.glue_s3_access_role.arn
}

output "glue_s3_access_policy_name" {
  description = "Name of the Glue S3 access policy"
  value       = aws_iam_role_policy.glue_s3_access_policy.name
}
