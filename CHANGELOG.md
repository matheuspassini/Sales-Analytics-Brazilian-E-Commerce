# Changelog

## Current Status

### Implemented
- **Infrastructure as Code**: Complete Terraform setup with modular architecture
- **S3 Data Lake**: Medallion architecture (Bronze, Silver, Gold layers)
- **IAM Security**: Glue role with minimal S3 permissions
- **Containerization**: Docker environment with Terraform + AWS CLI + Python3
- **Data Integration**: Olist e-commerce dataset (9 CSV files, ~100MB total)
- **Automated Deployment**: S3 objects created automatically from local data

### Technical Stack
- **Infrastructure**: Terraform 1.6.5 with modular design (S3, IAM modules)
- **Data Processing**: AWS Glue + PySpark (serverless ETL/ELT)
- **Containerization**: Docker + Ubuntu + AWS CLI v2
- **Development**: Python3 + Terraform + AWS SDK
- **Architecture**: Medallion data lake architecture (Bronze → Silver → Gold)

### Data Sources
- **Olist Brazilian E-commerce Dataset**: [Kaggle Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
  - **Size**: ~100MB total across 9 CSV files
  - **Content**: Customers, Orders, Products, Payments, Reviews, Sellers, Geolocation
  - **Format**: CSV files automatically uploaded to S3 Bronze layer
