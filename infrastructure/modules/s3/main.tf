# S3 Storage

# Criação do bucket
resource "aws_s3_bucket" "create_bucket" {
  bucket = var.name_bucket
  force_destroy = true
  tags = {
    Name = "Bucket"
  }
}

# Bucket versioning
resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.create_bucket.id
  versioning_configuration {
    status = var.versioning_bucket
  }
  depends_on = [aws_s3_bucket.create_bucket]
}

# Block Public Access
resource "aws_s3_bucket_public_access_block" "blocking" {
  bucket = aws_s3_bucket.create_bucket.id
  block_public_policy     = false
  restrict_public_buckets = false
}

# S3 Module
module "s3_object" {
  source       = "./s3_objects"
  name_bucket  = aws_s3_bucket.create_bucket.bucket
  files_bucket = var.files_bucket
  files_data   = var.files_data
}


