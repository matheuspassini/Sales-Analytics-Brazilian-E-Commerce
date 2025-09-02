output "database_name" {
  description = "Name of the Glue database"
  value       = aws_glue_catalog_database.glue_database.name
}

output "database_arn" {
  description = "ARN of the Glue database"
  value       = aws_glue_catalog_database.glue_database.arn
}

output "crawler_name" {
  description = "Name of the Glue crawler"
  value       = aws_glue_crawler.glue_crawler.name
}

output "crawler_arn" {
  description = "ARN of the Glue crawler"
  value       = aws_glue_crawler.glue_crawler.arn
}

output "trigger_name" {
  description = "Name of the Glue trigger"
  value       = aws_glue_trigger.crawler_trigger.name
}