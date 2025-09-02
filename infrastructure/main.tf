# S3 Modules
module "s3" {
  source = "./modules/s3"
  
  name_bucket        = var.name_bucket
  versioning_bucket  = var.versioning_bucket
  files_bucket       = var.files_bucket
  files_data         = var.files_data
}

# IAM Module - Creates Glue role and S3 permissions
module "iam" {
  source = "./modules/iam"
  
  project_name        = var.project_name
  s3_bucket_arn       = module.s3.bucket_arn 
}

# Glue Module - Creates Glue database and crawler
module "glue" {
  source = "./modules/glue"
  
  database_name      = var.glue_database_name
  glue_database_name = var.glue_database_name
  project_name       = var.project_name
  glue_crawler       = var.glue_crawler
  glue_trigger_name  = var.glue_trigger_name
  glue_role_arn      = module.iam.glue_s3_access_role_arn
  bucket_name        = module.s3.name_bucket
}

# CloudWatch Module - Monitoring and alerting
module "cloudwatch" {
  source = "./modules/cloudwatch"
  
  project_name           = var.project_name
  aws_region             = var.aws_region
  s3_bucket_name         = module.s3.name_bucket
  glue_crawler_name      = var.glue_crawler
  s3_size_threshold_bytes = var.s3_size_threshold_gb * 1073741824  # Convert GB to bytes
  alarm_actions          = []
  evaluation_periods     = var.evaluation_periods
  alarm_period           = var.alarm_period
  glue_success_threshold = var.glue_success_threshold
  log_retention_days     = var.log_retention_days
  statistic_type         = var.statistic_type
}
