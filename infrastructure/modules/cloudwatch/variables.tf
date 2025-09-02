variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to monitor"
  type        = string
}

variable "glue_crawler_name" {
  description = "Name of the Glue crawler to monitor"
  type        = string
}

variable "s3_size_threshold_bytes" {
  description = "S3 bucket size threshold in bytes for alarm"
  type        = number
  default     = 10737418240  # 10 GB
}

variable "alarm_actions" {
  description = "List of ARNs for alarm actions (SNS topics, etc.)"
  type        = list(string)
  default     = []
}

variable "evaluation_periods" {
  description = "Number of evaluation periods for alarms"
  type        = number
  default     = 2
}

variable "alarm_period" {
  description = "Period in seconds for alarm evaluation"
  type        = number
  default     = 300
}

variable "glue_success_threshold" {
  description = "Threshold for Glue crawler success rate alarm"
  type        = number
  default     = 100
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 30
}

variable "statistic_type" {
  description = "Statistic type for CloudWatch alarms (Average, Sum, Minimum, Maximum)"
  type        = string
}
