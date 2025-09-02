# CloudWatch Module for Sales Analytics

# Log Group for Glue Crawler
resource "aws_cloudwatch_log_group" "glue_crawler_logs" {
  name              = "/aws-glue/crawlers/${var.project_name}-crawler"
  retention_in_days = var.log_retention_days
  
  tags = {
    Name = "${var.project_name}-glue-crawler-logs"
  }
}

# Log Group for Glue Jobs (future use)
resource "aws_cloudwatch_log_group" "glue_jobs_logs" {
  name              = "/aws-glue/jobs/${var.project_name}-jobs"
  retention_in_days = var.log_retention_days
  
  tags = {
    Name = "${var.project_name}-glue-jobs-logs"
  }
}

# S3 Bucket Size Alarm
resource "aws_cloudwatch_metric_alarm" "s3_bucket_size" {
  alarm_name          = "${var.project_name}-s3-bucket-size"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "BucketSizeBytes"
  namespace           = "AWS/S3"
  period              = var.alarm_period
  statistic           = var.statistic_type
  threshold           = var.s3_size_threshold_bytes
  alarm_description   = "S3 bucket size exceeded threshold"
  alarm_actions       = var.alarm_actions

  dimensions = {
    BucketName = var.s3_bucket_name
    StorageType = "StandardStorage"
  }
}

# Glue Crawler Success Rate Alarm
resource "aws_cloudwatch_metric_alarm" "glue_crawler_success" {
  alarm_name          = "${var.project_name}-glue-crawler-success"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "SuccessRate"
  namespace           = "AWS/Glue"
  period              = var.alarm_period
  statistic           = var.statistic_type
  threshold           = var.glue_success_threshold
  alarm_description   = "Glue crawler success rate below threshold"
  alarm_actions       = var.alarm_actions

  dimensions = {
    CrawlerName = var.glue_crawler_name
  }
}

