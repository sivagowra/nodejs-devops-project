1️ Project Overview

NodeJS DevOps Application

Tools Used:
- Terraform
- Jenkins
- Docker
- AWS
- NodeJS


2️ Architecture

Explain:
GitHub → Jenkins → Docker → AWS EC2

3️ Setup Steps

1 Install Jenkins
2 Configure Docker
3 Setup AWS credentials
4 Run Terraform
5 Run Jenkins pipeline

4️ Run Terraform

- terraform init
- terraform plan
- terraform apply

5️ Pipeline Execution

- Git push triggers Jenkins
- Pipeline builds Docker image
- Pushes to DockerHub
- Deploys to EC2