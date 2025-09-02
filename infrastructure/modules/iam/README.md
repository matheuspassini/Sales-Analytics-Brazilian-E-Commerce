# IAM Security Module

## 🎯 Purpose

This module implements **Identity and Access Management (IAM)** for the Sales Analytics infrastructure. It follows the **principle of least privilege** to ensure secure access to AWS resources.

## 🏗️ Architecture Decisions

### **Why IAM Module?**
- **Centralized Security**: All permissions in one place
- **Least Privilege**: Only necessary permissions granted
- **Audit Trail**: Clear visibility of who can access what
- **Compliance**: Security best practices implemented

### **Why Service Roles?**
- **AWS Service Integration**: Native integration with AWS services
- **Temporary Credentials**: No long-term access keys
- **Automatic Rotation**: Credentials managed by AWS
- **Security**: Reduced attack surface

## 🔐 Security Model

### **Trust Relationships**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

### **Permission Boundaries**
- **S3 Access**: Only to specific bucket and operations
- **Glue Operations**: Database, table, and crawler management
- **CloudWatch**: Log writing and metric access
- **No Administrative**: Prevents privilege escalation

## 🚀 Usage

### **Module Configuration**
```hcl
module "iam" {
  source = "./modules/iam"
  
  project_name   = "sales-analytics"
  s3_bucket_arn  = module.s3.bucket_arn
}
```

### **Role Usage**
```hcl
# In Glue module
resource "aws_glue_crawler" "crawler" {
  role = module.iam.glue_s3_access_role_arn
}
```

## 🔧 Features

### **Glue Service Role**
- **S3 Access**: Read/write to data lake bucket
- **Glue Operations**: Database and table management
- **CloudWatch Logs**: Write application logs
- **Crawler Execution**: Run data discovery jobs

### **Permission Structure**
```hcl
# S3 Permissions
- s3:GetObject     # Read data files
- s3:PutObject     # Write processed data
- s3:ListBucket    # List bucket contents
- s3:DeleteObject  # Clean up temporary files

# Glue Permissions
- glue:GetDatabase # Access databases
- glue:CreateTable # Create tables
- glue:UpdateTable # Modify tables
- glue:DeleteTable # Remove tables

# CloudWatch Permissions
- logs:CreateLogGroup    # Create log groups
- logs:PutLogEvents      # Write log entries
- logs:DescribeLogGroups # List log groups
```

## 🔒 Security Best Practices

### **Principle of Least Privilege**
- **Minimal Permissions**: Only what's absolutely necessary
- **Resource Scoping**: Limit to specific resources
- **Action Limiting**: Restrict to required operations
- **Regular Review**: Periodic permission audits

### **Access Control**
- **Resource Policies**: Additional access restrictions
- **Single Account**: Current implementation scope

## 📊 Monitoring & Auditing

### **CloudWatch Monitoring**
- **Access Metrics**: Monitor role usage
- **Error Tracking**: Identify permission issues
- **Cost Monitoring**: Track resource usage
- **Alerting**: Notify on security events

## 🛠️ Maintenance

### **Regular Tasks**
- **Permission Reviews**: Quarterly access audits
- **Role Updates**: Modify permissions as needed
- **Access Monitoring**: Review CloudWatch logs
- **Policy Validation**: Verify permission effectiveness

### **Troubleshooting**
- **Access Denied**: Check role permissions
- **Service Errors**: Verify trust relationships
- **Performance Issues**: Review permission complexity
- **Security Alerts**: Investigate suspicious activity

## 📚 Resources

- [IAM Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [IAM Service Roles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_terms-and-concepts.html)
- [IAM Security Best Practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/security-iam.html)
- [AWS Security Blog](https://aws.amazon.com/blogs/security/)

