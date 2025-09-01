# IAM Module Variables - S3 
variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket for permissions"
  type        = string
}
