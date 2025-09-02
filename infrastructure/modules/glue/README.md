# AWS Glue Data Catalog Module

## 🎯 Purpose

This module implements **AWS Glue** services for automated data discovery, cataloging, and ETL orchestration. It provides a serverless data catalog that automatically discovers data structure and creates metadata tables.

## 🏗️ Architecture Decisions

### **Why AWS Glue?**
- **Serverless**: No infrastructure management required
- **Automatic Discovery**: Crawler discovers data schema automatically
- **Data Catalog**: Centralized metadata management
- **ETL Ready**: Built-in transformation capabilities (when jobs are created)
- **Cost Effective**: Pay only for compute time used

### **Why Crawler Approach?**
- **Schema Discovery**: Automatically infers data structure
- **Multiple Formats**: Supports CSV, JSON, Parquet, Avro
- **Metadata Management**: Creates metadata tables in Data Catalog
- **Cost Effective**: Pay only when crawler runs

## 🔧 Components

### **Glue Database**
```hcl
resource "aws_glue_catalog_database" "glue_database" {
  name        = var.database_name
  description = "Database for sales analytics data"
}
```
- **Purpose**: Organize related tables and metadata
- **Benefits**: Logical grouping, access control, cost allocation

### **Glue Crawler**
```hcl
resource "aws_glue_crawler" "glue_crawler" {
  database_name = aws_glue_catalog_database.glue_database.name
  name          = var.glue_crawler
  role          = var.glue_role_arn
}
```
- **Purpose**: Automatically discover data structure
- **Target**: S3 bronze layer (`s3://bucket/data/bronze`)
- **Output**: Tables in Glue Data Catalog

### **Glue Trigger**
```hcl
resource "aws_glue_trigger" "crawler_trigger" {
  name     = var.glue_trigger_name
  type     = "ON_DEMAND"
  enabled  = true
}
```
- **Purpose**: Execute crawler when needed
- **Type**: Manual execution (ON_DEMAND)
- **Future**: Can be scheduled or event-driven

## 📊 Data Discovery Process

### **How Crawler Works**
1. **Scan S3**: Reads files in bronze layer
2. **Schema Inference**: Analyzes data structure
3. **Metadata Creation**: Creates metadata tables in catalog
4. **Schema Storage**: Stores inferred schema information
5. **Partition Detection**: Identifies folder-based partitions

### **Supported Data Formats**
- **CSV**: Comma-separated values
- **JSON**: JavaScript Object Notation
- **Parquet**: Columnar storage format
- **Avro**: Row-based serialization
- **ORC**: Optimized Row Columnar

## 🚀 Usage

### **Module Configuration**
```hcl
module "glue" {
  source = "./modules/glue"
  
  database_name      = var.glue_database_name
  project_name       = var.project_name
  glue_crawler       = var.glue_crawler
  glue_trigger_name  = var.glue_trigger_name
  glue_role_arn      = module.iam.glue_s3_access_role_arn
  bucket_name        = module.s3.name_bucket
}
```

### **Running the Crawler**
```bash
# Via AWS CLI
aws glue start-crawler --name sales-analytics-crawler

# Via Console
# AWS Console → Glue → Crawlers → sales-analytics-crawler → Run crawler

# Via Trigger
aws glue start-trigger --name sales-analytics-crawler-trigger
```

### **Table Properties**
- **Schema**: Automatically inferred from data samples
- **Format**: Identified from file extensions
- **Location**: References S3 data path

## 🔧 Configuration Options

### **Crawler Settings**
- **Database**: Target database for table creation
- **Role**: IAM role with S3 and Glue permissions
- **Target Path**: S3 location to crawl
- **Schedule**: When to run (currently ON_DEMAND)

### **Schema Change Policy**
```hcl
schema_change_policy {
  delete_behavior = "LOG"        # Log schema deletions
  update_behavior = "UPDATE_IN_DATABASE"  # Update existing tables
}
```

## 📈 Monitoring & Observability

### **CloudWatch Integration**
- **Logs**: Crawler execution logs
- **Metrics**: Success rate, duration, tables created
- **Alarms**: Failure notifications

### **Success Metrics**
- **Tables Created**: Number of new tables
- **Execution Time**: Crawler duration
- **Error Rate**: Failed executions

## 🛠️ Maintenance

### **Regular Tasks**
- **Monitor Crawler Runs**: Check execution logs
- **Review Table Schema**: Verify data structure
- **Update Permissions**: Modify IAM roles as needed
- **Clean Up**: Remove obsolete tables

### **Troubleshooting**
- **Permission Errors**: Check IAM role permissions
- **Schema Issues**: Verify data format consistency
- **Performance**: Monitor execution times
- **Data Quality**: Validate discovered schemas

## 📚 Resources

- [AWS Glue Developer Guide](https://docs.aws.amazon.com/glue/latest/dg/)
- [Glue Crawler Best Practices](https://docs.aws.amazon.com/glue/latest/dg/monitor-debug-capacity.html)
- [Data Catalog Concepts](https://docs.aws.amazon.com/glue/latest/dg/catalog-and-crawler.html)
- [Glue ETL Jobs](https://docs.aws.amazon.com/glue/latest/dg/add-job.html)

## ⚠️ Important Notes

### **Data Considerations**
1. **Consistent Format**: Ensure data files have consistent structure
2. **File Naming**: Use consistent naming conventions
3. **Data Quality**: Validate data before crawling
4. **Schema Evolution**: Plan for data structure changes

### **Performance Tips**
- **Format Choice**: Use consistent formats for better inference
- **Crawler Frequency**: Balance freshness vs. cost
