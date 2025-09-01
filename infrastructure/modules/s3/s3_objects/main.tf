# python_scripts
resource "aws_s3_object" "jobs" {
  for_each = fileset("${var.files_bucket}/", "**")
  bucket = var.name_bucket
  key    = "jobs/${each.value}"
  source = "${var.files_bucket}/${each.value}"
  etag   = filemd5("${var.files_bucket}/${each.value}")
}

# bronze - raw data (raw data that you upload to S3)
resource "aws_s3_object" "bronze" {
  for_each = fileset("${var.files_data}/", "**")
  bucket   = var.name_bucket
  key      = "data/bronze/${each.value}"
  source = "${var.files_data}/${each.value}"
  etag   = filemd5("${var.files_data}/${each.value}")
}

# silver - folder created to receive data processed by Glue jobs
resource "aws_s3_object" "silver" {
  bucket = var.name_bucket
  key    = "data/silver/"
}

# gold - folder created to receive aggregated data by Glue jobs
resource "aws_s3_object" "gold" {
  bucket = var.name_bucket
  key    = "data/gold/"
}

# logs
resource "aws_s3_object" "logs" {
  bucket = var.name_bucket
  key    = "logs/"
}

