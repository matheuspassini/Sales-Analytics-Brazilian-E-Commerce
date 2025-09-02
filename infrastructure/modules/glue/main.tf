resource "aws_glue_catalog_database" "glue_database" {
  name        = var.database_name
  description = "Database for sales analytics data"
}

resource "aws_glue_crawler" "glue_crawler" {
  database_name = aws_glue_catalog_database.glue_database.name
  name          = var.glue_crawler
  role          = var.glue_role_arn
  description   = "Crawler to discover data structure in S3 bronze layer"

  s3_target {
    path = "s3://${var.bucket_name}/data/bronze"
  }

  schema_change_policy {
    delete_behavior = "LOG"
    update_behavior = "UPDATE_IN_DATABASE"
  }
}

# Trigger to run crawler automatically
resource "aws_glue_trigger" "crawler_trigger" {
  name     = var.glue_trigger_name
  type     = "ON_DEMAND"
  enabled  = true

  actions {
    crawler_name = aws_glue_crawler.glue_crawler.name
  }
}
