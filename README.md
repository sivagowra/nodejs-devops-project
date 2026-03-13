## NodeJS DevOps Application

This repository contains a small Node.js application packaged and deployed using a complete DevOps toolchain (Terraform, Jenkins, Docker, and AWS).

The goal of the project is to demonstrate an end‑to‑end CI/CD pipeline: from a Git commit to an application running on an EC2 instance.

### Tech Stack

- **Application**: Node.js app (see `app/` for the React front‑end)
- **CI/CD**: Jenkins pipeline
- **Containerization**: Docker
- **Infrastructure as Code**: Terraform
- **Cloud provider**: AWS (EC2)

## Architecture

At a high level, the flow is:

1. **GitHub** – Source of truth for the application and Terraform code.
2. **Jenkins** – Watches the GitHub repository and runs the CI/CD pipeline.
3. **Docker** – Builds and tags an image for the Node.js app.
4. **Docker Registry** – Stores the built image (for example Docker Hub or Amazon ECR).
5. **AWS EC2** – Terraform provisions EC2 and related infrastructure, and the instance pulls and runs the Docker image.

## Prerequisites

- **GitHub repository** with this code.
- **Jenkins** server with:
  - Docker installed and available to the Jenkins user.
  - Access to your Docker registry (Docker Hub / ECR credentials).
  - AWS credentials configured (via environment variables, credentials plugin, or instance profile).
- **AWS account** with permissions to create EC2 instances, security groups, IAM roles, and networking resources used by Terraform.
- **Terraform** installed locally or on the Jenkins agent.

## Setup Steps (High Level)

1. **Install and configure Jenkins**
   - Install Jenkins (or use an existing server/agent).
   - Install required plugins (e.g. Git, Pipeline).
   - Configure credentials for:
     - GitHub (if needed).
     - Docker registry.
     - AWS access (access key/secret or role).

2. **Configure Docker**
   - Install Docker on the Jenkins node and/or target EC2 instance.
   - Verify `docker build`, `docker run`, and `docker push` work from the Jenkins environment.

3. **Configure AWS credentials**
   - Export `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION` (or use an IAM role).
   - Make sure Jenkins has access to these credentials.

4. **Provision infrastructure with Terraform**
   - Navigate to the `terraform/` directory.
   - Run:
     - `terraform init`
     - `terraform plan`
     - `terraform apply`

5. **Create / configure the Jenkins pipeline**
   - Point the pipeline at this GitHub repository.
   - Use the provided Jenkinsfile (if present) or create a declarative pipeline that:
     - Checks out the repository.
     - Builds the Docker image for the Node.js app.
     - Pushes the image to your Docker registry.
     - Triggers deployment on the EC2 instance (e.g. via SSH or user data that pulls the latest image).

## Terraform Commands

From the `terraform/` directory:

- **Initialize providers and modules**
  - `terraform init`
- **Review the execution plan**
  - `terraform plan`
- **Apply changes to AWS**
  - `terraform apply`

Always review the plan output before applying, especially in shared or production accounts.

## CI/CD Pipeline Overview

Once everything is wired together, a typical run looks like this:

1. **Developer pushes to GitHub** (e.g. `main` or a feature branch).
2. **GitHub notifies Jenkins** via webhook or polling.
3. **Jenkins pipeline stages**:
   - Checkout repository.
   - Install dependencies and run tests (optional but recommended).
   - Build Docker image for the Node.js app.
   - Tag and push the image to the configured Docker registry.
4. **Deployment to AWS**:
   - EC2 instance (provisioned by Terraform) pulls the new image.
   - Container is restarted with the latest version of the app.

## Project Structure (simplified)

- `app/` – Front‑end React app (Create React App).
- `terraform/` – Terraform configuration for AWS resources (including EC2).
- Other root‑level files – Node.js app, Dockerfile, Jenkinsfile, and configuration (names may vary).

## Troubleshooting Tips

- **Terraform errors**: Check AWS credentials, region, and the Terraform state; run `terraform plan` to see what is failing.
- **Jenkins pipeline failures**: Inspect the stage logs; verify that Docker and AWS credentials are available to the Jenkins agent.
- **Deployment issues on EC2**: SSH into the instance (if allowed), check Docker logs and that the correct image tag is being pulled.

You can further customize this README with project‑specific details such as exact environment variables, example URLs, and screenshots once your pipeline is fully running.