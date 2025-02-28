# Terraform Project Structure for Multiple Environments

## Overview
This Terraform project is designed to manage infrastructure across multiple environments, including **Development, Quality Assurance (QA), and Production**. Each environment is structured separately to ensure isolation and better management.

## Key Components
### 1. **Environments**
Each environment (Development, QA, Production) has its own directory containing:
- `main.tf`: Defines infrastructure resources such as **EC2, S3, and DynamoDB**.
- `variables.tf`: Contains input variables for configuration.
- `outputs.tf`: Defines output values.
- `provider.tf`: Configures the cloud provider (AWS in this case).

### 2. **Modules**
Reusable Terraform modules for managing specific resources:
- **EC2 Module**: Defines EC2 instances for each environment.
- **S3 Module**: Manages S3 bucket creation and configurations.
- **DynamoDB Module**: Defines DynamoDB tables for state locking or data storage.

### 3. **Backend Configuration**
- `backend.tf`: Configures remote backend storage for Terraform state files, typically using **S3 with DynamoDB for state locking**.

### 4. **Terraform Variables**
- `terraform.tfvars`: Stores common variables across environments.

## Deployment Instructions
##Initialize Terraform

terraform init


### Plan Deployment

terraform plan -var-file="environments/development/terraform.tfvars"


### Apply Changes

terraform apply -var-file="environments/development/terraform.tfvars"


## Destroy Resources

terraform destroy -var-file="environments/development/terraform.tfvars"



