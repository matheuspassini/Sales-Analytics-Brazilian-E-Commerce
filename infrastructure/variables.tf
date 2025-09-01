variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

# S3 Module Variables
variable "name_bucket" {
  description = "S3 bucket name"
  type        = string
}

variable "versioning_bucket" {
  description = "Enable bucket versioning (Enabled/Disabled)"
  type        = string
}

variable "files_bucket" {
  description = "Local folder containing Python scripts for processing"
  type        = string
}

variable "files_data" {
  description = "Local folder containing data files"
  type        = string
}
