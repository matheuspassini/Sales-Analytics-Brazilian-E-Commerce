variable "database_name" {
  description = "Name of the Glue database"
  type        = string
}

variable "glue_database_name" {
  description = "Name of the Glue database for the table"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "glue_crawler" {
  description = "Name of the Glue crawler"
  type        = string
}

variable "glue_trigger_name" {
  description = "Name of the Glue crawler trigger"
  type        = string
}

variable "glue_role_arn" {
  description = "ARN of the IAM role for Glue"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}