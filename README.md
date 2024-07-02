# Infra Cloud Engineer Project
## Introduction
This project automates the deployment of AWS infrastructure using Terraform. It provisions a Virtual Private Cloud (VPC) with public and private subnets, launches an EC2 instance running Nginx, and configures necessary networking components.

## Architecture Overview
The architecture includes the following components:

### AWS VPC
Creates a dedicated VPC with the specified CIDR block. 

### Public Subnets
Multiple public subnets are created across different availability zones. Each subnet is associated with a route table that directs internet-bound traffic (`0.0.0.0/0`) through an attached Internet Gateway.

### Private Subnets
Private subnets are provisioned. Designed for backend services or databases inaccessible directly from the internet.

### EC2 Instance
An EC2 instance running Nginx. It serves a simple "Hello World" webpage using user data scripts.

### Security Groups
A security group controls inbound and outbound traffic to the EC2 instance, allowing HTTP (port 80) and SSH (port 22) access from any IP (`0.0.0.0/0`).

### Internet Gateway and Route Tables
An Internet Gateway facilitates communication between instances in the VPC and the internet. Separate route tables manage routing for public and private subnets.

## Features
- **Infrastructure as Code:** Uses Terraform for defining and managing AWS resources.
- **Modular and Scalable:** Organized into reusable modules for easier maintenance and scalability.
- **Automated Deployment:** Easily deploy or tear down the entire infrastructure using Terraform commands.

## Getting Started
### Prerequisites
Before starting, ensure you have installed:
- Terraform
- AWS CLI

### Installation
Clone the repository:
```bash
git clone <repository-url>
cd <repository-directory>
```

### Running The Project
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

### Cleanup
```bash
terraform destroy
```

## Disaster Recovery Plan

For detailed information on the disaster recovery plan for this infrastructure, please refer to `DisasterRecoveryPlan.md`.
