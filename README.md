# Sales Analytics Medallion Architecture

## 📊 Overview
A comprehensive data analytics solution built on AWS using Medallion architecture principles. This project processes retail sales data from Olist (Brazilian e-commerce) using AWS Glue, S3, and PySpark.

## 🏗️ Architecture

### Medallion Architecture Components
- **Bronze Layer**: Raw data from Olist (CSV files)
- **Silver Layer**: Cleaned and processed data
- **Gold Layer**: Aggregated business metrics and KPIs

### AWS Services
- **S3**: Data storage with Medallion architecture (Bronze → Silver → Gold)
- **AWS Glue**: ETL/ELT processing with PySpark
- **IAM**: Secure access control for Glue jobs
- **CloudWatch**: Monitoring and logging

### Data Flow
```
Raw Data (Bronze) → Processed Data (Silver) → Aggregated Data (Gold)
     ↓                    ↓                    ↓
  CSV Files         PySpark Jobs         Business Metrics
```

## 📁 Project Structure
```
sales-analytics/
├── infrastructure/        # Terraform IaC
│   ├── modules/           # Reusable modules
│   │   ├── s3/            # S3 bucket and structure
│   │   │   └── s3_objects/ # S3 objects (Bronze, Silver, Gold)
│   │   └── iam/           # IAM roles and policies
│   ├── main.tf            # Main infrastructure
│   ├── variables.tf       # Variable definitions
│   ├── terraform.tfvars   # Variable values
│   ├── providers.tf       # AWS provider configuration
│   └── outputs.tf         # Output values
├── data/                  # Raw datasets (Olist + test.txt)
├── jobs/                  # PySpark scripts (Glue jobs)
├── Dockerfile             # Container configuration
├── docker-compose.yml     # Docker services configuration
├── LICENSE               # MIT License
├── CHANGELOG.md          # Project history
└── README.md             # Project documentation
```

## 🚀 Getting Started

### Prerequisites
- Docker installed and running
- AWS CLI configured
- Access to AWS services (S3, Glue, IAM)

### Quick Start with Docker

#### 1. Build the Docker Image
```bash
docker build -t sales-analytics-image .
```

#### 2. Run with Docker Compose
```bash
# Start the container
docker-compose up -d

# Access the container
docker-compose exec sales-analytics bash
```

#### 3. Inside the Container
```bash
# The /infrastructure directory is already available
cd /infrastructure

# Configure AWS credentials
aws configure



# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the infrastructure
terraform apply
```

### Data Preparation
1. **Download Olist Dataset**: Extract the ZIP from Kaggle to `data/` folder
2. **Verify Structure**: Ensure CSV files are in the correct location
3. **Run Terraform**: The provisioner will automatically upload data to S3 Bronze layer

## 📊 Data Sources

### Olist Dataset
- **Source**: [Brazilian E-commerce Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Download**: Extract the ZIP file and place CSV files in the `data/` folder
- **Customers**: Customer information and location
- **Orders**: Order details and status
- **Products**: Product catalog and categories
- **Order Items**: Individual items in orders
- **Payments**: Payment methods and amounts
- **Reviews**: Customer feedback and ratings
- **Sellers**: Seller information and performance

## 🔧 Configuration

### Variables
- `project_name`: Project identifier
- `aws_region`: AWS region for deployment
- `name_bucket`: **S3 bucket name (must be unique globally)**
- `versioning_bucket`: Enable bucket versioning
- `files_bucket`: Local scripts folder
- `files_data`: Local data folder

### Important Configuration Notes
- **S3 Bucket Name**: Must be globally unique across all AWS accounts
- **Example**: `my-sales-analytics-xxxxxxx` or use your company prefix

## 🐳 Docker Details

### Container Contents
- **Ubuntu Latest**: Base operating system
- **Terraform 1.6.5**: Infrastructure as Code tool
- **AWS CLI v2**: AWS command line interface
- **Python3**: For local development and testing

### Volume Mounts
- **`/infrastructure`**: Project directory (available in container)
- **AWS Credentials**: Configured via `aws configure` command

### Benefits
- **Consistent Environment**: Same setup across all machines
- **No Local Installation**: Terraform and AWS CLI included
- **Isolation**: Clean environment for each deployment
- **Portability**: Works on any machine with Docker

## 📈 Data Processing

### Bronze Layer (Raw)
- Original CSV files from Olist
- No transformations applied
- Preserves data integrity

### Silver Layer (Processed)
- Cleaned and validated data
- Standardized schemas
- Business rules applied

### Gold Layer (Aggregated)
- Business metrics and KPIs
- Aggregated by time, category, region
- Ready for analytics and reporting

## 🔒 Security

### IAM Roles
- **Glue S3 Access Role**: Minimal permissions for data processing
- **S3 Bucket Policy**: Secure access control
- **Principle of Least Privilege**: Only necessary permissions

### Data Protection
- **S3 Encryption**: Server-side encryption enabled
- **Versioning**: Data versioning for audit trails
- **Access Logging**: Comprehensive access monitoring


## 📚 Technologies

### Core
- **PySpark**: Distributed data processing
- **Terraform**: Infrastructure as Code
- **AWS Glue**: Serverless ETL/ELT

### Data Storage
- **S3**: Scalable object storage
- **CSV**: Source data format

### Containerization
- **Docker**: Consistent development environment
- **Ubuntu**: Linux base image
- **Multi-tool**: Terraform + AWS CLI + Python

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
