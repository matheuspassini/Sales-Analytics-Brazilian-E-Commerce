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
  
  project_name   = var.project_name
  s3_bucket_arn  = module.s3.bucket_arn 
}

