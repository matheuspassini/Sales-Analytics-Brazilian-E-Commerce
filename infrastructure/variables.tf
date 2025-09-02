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

variable "glue_database_name" {
  description = "Name of the Glue database for analytics"
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

# CloudWatch Variables
variable "s3_size_threshold_gb" {
  description = "S3 bucket size threshold in GB for CloudWatch alarm"
  type        = number
}

variable "enable_cloudwatch_alarms" {
  description = "Enable CloudWatch alarms for monitoring"
  type        = bool
}

# CloudWatch Configuration Variables
variable "evaluation_periods" {
  description = "Number of evaluation periods for alarms"
  type        = number
}

variable "alarm_period" {
  description = "Period in seconds for alarm evaluation"
  type        = number
}

variable "glue_success_threshold" {
  description = "Threshold for Glue crawler success rate alarm"
  type        = number
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
}

variable "statistic_type" {
  description = "Statistic type for CloudWatch alarms (Average, Sum, Minimum, Maximum)"
  type        = string
}
