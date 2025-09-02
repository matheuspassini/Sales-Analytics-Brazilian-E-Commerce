output "glue_crawler_log_group_name" {
  description = "Name of the Glue crawler log group"
  value       = aws_cloudwatch_log_group.glue_crawler_logs.name
}

output "glue_jobs_log_group_name" {
  description = "Name of the Glue jobs log group"
  value       = aws_cloudwatch_log_group.glue_jobs_logs.name
}

output "s3_bucket_size_alarm_name" {
  description = "Name of the S3 bucket size alarm"
  value       = aws_cloudwatch_metric_alarm.s3_bucket_size.alarm_name
}

output "glue_crawler_success_alarm_name" {
  description = "Name of the Glue crawler success alarm"
  value       = aws_cloudwatch_metric_alarm.glue_crawler_success.alarm_name
}

