# CloudWatch Monitoring Module

## 🎯 Purpose

This module implements **AWS CloudWatch** monitoring, alerting, and observability for the Sales Analytics infrastructure. It provides proactive monitoring, cost tracking, and operational insights.

## 🏗️ Architecture Decisions

### **Why CloudWatch?**
- **Native Integration**: Built-in AWS service monitoring
- **Real-time Metrics**: Immediate visibility into resources
- **Automated Alerting**: Proactive issue detection
- **Cost Optimization**: Monitor resource usage and costs
- **Centralized Logs**: Unified logging across services

### **Why Monitoring is Critical?**
- **Operational Excellence**: Detect issues before they impact users
- **Cost Management**: Identify and optimize expensive operations
- **Performance**: Monitor resource utilization and bottlenecks
- **Compliance**: Audit trails and security monitoring

## 🔧 Components

### **Log Groups**
```hcl
resource "aws_cloudwatch_log_group" "glue_crawler_logs" {
  name              = "/aws-glue/crawlers/${var.project_name}-crawler"
  retention_in_days = var.log_retention_days
}
```
- **Purpose**: Centralized log storage for Glue services
- **Retention**: Configurable log retention (default: 30 days)
- **Benefits**: Unified logging, search, and analysis

### **Metric Alarms**
```hcl
resource "aws_cloudwatch_metric_alarm" "s3_bucket_size" {
  alarm_name          = "${var.project_name}-s3-bucket-size"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.s3_size_threshold_bytes
}
```
- **Purpose**: Alert when S3 bucket exceeds size threshold
- **Trigger**: Bucket size > configured threshold
- **Action**: Configurable alarm actions (SNS, etc.)

### **Success Rate Monitoring**
```hcl
resource "aws_cloudwatch_metric_alarm" "glue_crawler_success" {
  metric_name         = "SuccessRate"
  namespace           = "AWS/Glue"
  threshold           = var.glue_success_threshold
}
```
- **Purpose**: Monitor Glue crawler success rate
- **Trigger**: Success rate < 100%
- **Benefits**: Early detection of data processing issues

## 📊 Monitoring Strategy

### **S3 Monitoring**
- **Bucket Size**: Track storage growth and costs
- **Object Count**: Monitor data volume changes
- **Access Patterns**: Identify usage trends
- **Cost Optimization**: Alert on storage thresholds

### **Glue Monitoring**
- **Success Rate**: Ensure data processing reliability
- **Execution Time**: Monitor performance trends
- **Error Rates**: Detect processing failures
- **Resource Usage**: Optimize compute costs

### **Log Management**
- **Centralized Storage**: All logs in one place
- **Structured Format**: Easy parsing and analysis
- **Retention Policies**: Cost-effective log management
- **Search Capabilities**: Quick issue investigation

## 🚀 Usage

### **Module Configuration**
```hcl
module "cloudwatch" {
  source = "./modules/cloudwatch"
  
  project_name           = var.project_name
  environment            = var.environment
  aws_region            = var.aws_region
  s3_bucket_name        = module.s3.name_bucket
  glue_crawler_name     = var.glue_crawler
  s3_size_threshold_bytes = var.s3_size_threshold_gb * 1073741824
  alarm_actions          = []
  evaluation_periods     = var.evaluation_periods
  alarm_period           = var.alarm_period
  glue_success_threshold = var.glue_success_threshold
  log_retention_days     = var.log_retention_days
  statistic_type         = var.statistic_type
}
```

### **Configuration Variables**
```hcl
# CloudWatch Configuration
s3_size_threshold_gb = 10
enable_cloudwatch_alarms = true
evaluation_periods = 2
alarm_period = 300
glue_success_threshold = 100
log_retention_days = 30
statistic_type = "Average"
```

## 🔔 Alerting Strategy

### **S3 Bucket Size Alarm**
- **Metric**: `BucketSizeBytes`
- **Threshold**: Configurable (default: 10GB)
- **Period**: 5 minutes
- **Evaluation**: 2 consecutive periods
- **Action**: Alert when exceeded

### **Glue Crawler Success Alarm**
- **Metric**: `SuccessRate`
- **Threshold**: 100% (configurable)
- **Period**: 5 minutes
- **Evaluation**: 2 consecutive periods
- **Action**: Alert when below threshold

### **Alarm Actions**
- **CloudWatch Logs**: Store alarm history
- **Monitoring**: Track alarm state changes

## 📈 Metrics & Insights

### **Key Performance Indicators**
- **Storage Utilization**: S3 bucket size trends
- **Processing Success**: Glue crawler reliability
- **Cost Efficiency**: Resource usage optimization
- **Operational Health**: System availability

### **Trend Analysis**
- **Storage Growth**: S3 bucket size trends
- **Processing Success**: Glue crawler success patterns
- **Cost Monitoring**: Resource usage trends
- **Error Tracking**: Failure rate analysis

## 🛠️ Maintenance

### **Regular Tasks**
- **Alarm Review**: Monthly threshold adjustments
- **Log Analysis**: Weekly log review
- **Cost Monitoring**: Daily cost tracking
- **Performance Review**: Monthly performance analysis

### **Troubleshooting**
- **False Positives**: Adjust alarm thresholds
- **Missing Metrics**: Verify service integration
- **High Costs**: Optimize log retention
- **Alert Fatigue**: Consolidate similar alarms


## 📚 Resources

- [CloudWatch Best Practices](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_best_practices.html)
- [CloudWatch Metrics](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/working_with_metrics.html)
- [CloudWatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [CloudWatch Logs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)

## ⚠️ Important Considerations

### **Cost Management**
1. **Log Retention**: Balance retention vs. cost
2. **Custom Metrics**: Monitor custom metric costs
3. **Alarm Frequency**: Avoid excessive alerting
4. **Data Resolution**: Choose appropriate metric periods

### **Operational Excellence**
1. **Alert Tuning**: Minimize false positives
2. **Response Procedures**: Define alert response processes
3. **Escalation Paths**: Clear escalation procedures
4. **Documentation**: Maintain runbooks for common issues

### **Security & Compliance**
1. **Access Control**: Limit CloudWatch access
2. **Audit Logging**: Track monitoring changes
3. **Data Privacy**: Ensure log data compliance
4. **Encryption**: Secure sensitive monitoring data
