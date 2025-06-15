# 🚀 Terraform AWS Deployment with Jenkins Pipeline Automation

This project automates the provisioning of AWS infrastructure using Terraform, integrated into a Jenkins pipeline. The infrastructure-as-code approach enables reproducible, version-controlled, and automated deployments using CI/CD principles.

---

## ✨ Key Features

- 🧾 **Infrastructure as Code** – Define AWS infrastructure using Terraform scripts.
- 🔁 **Automated CI/CD Pipeline** – Jenkins pipeline automates `terraform init`, `plan`, and `apply`.
- ☁️ **Remote State Management** – Terraform state is stored securely in an S3 bucket.
- 🛠️ **Custom Jenkins Agent** – Pipeline runs in a Docker container preloaded with Terraform and AWS CLI.
- 🔐 **Credential Management** – AWS credentials are securely managed through Jenkins Credentials.
- ✅ **Reproducibility** – Everything is tracked in version control and rebuildable from scratch.

---

## 📁 Repository Contents

| File / Folder        | Description                                      |
|----------------------|--------------------------------------------------|
| `main.tf`            | Core Terraform configuration for AWS resources  |
| `iam.tf`             | IAM roles and policies                          |
| `ec2.tf`             | Terraform config to provision EC2 instance      |
| `Jenkinsfile`        | Jenkins pipeline definition                      |
| `Dockerfile`         | Docker image for Jenkins agent with Terraform   |
| `.gitignore`         | Git ignored files                               |
| `README.md`          | This file 📘                                     |

---

## ⚙️ Prerequisites

- ✅ AWS account with required IAM permissions
- ✅ S3 bucket for remote Terraform backend
- ✅ Jenkins server with Docker plugin configured
- ✅ Docker installed on Jenkins master (or agent host)
- ✅ Jenkins Plugins:
  - 🧩 Git Server
  - 🧩 Pipeline
  - 🧩 Docker Pipeline
  - 🧩 Terraform
  - 🧩 AWS Credentials

---

## 🧱 Docker-Based Jenkins Agent Setup

To ensure consistency across Jenkins builds, use a Docker-based Jenkins agent with Terraform and AWS CLI pre-installed.

### 🔧 Build the Docker Image

Run this command in your project root (where the Dockerfile is located):

docker build -t terraform-agent .

🧪 Configure Jenkins Agent
Go to Manage Jenkins → Manage Nodes and Clouds → Configure Clouds

Under Docker Cloud, add a new template:

Docker Image: terraform-agent

Label: slave (must match the Jenkinsfile)

Remote FS Root: /home/jenkins/agent

Launch Method: Connect with Docker container

Save and Apply

🔐 AWS Credentials Setup
Go to Manage Jenkins → Credentials → (Global) → Add Credentials

Add AWS credentials:

Kind: Username with Password or Secret Text

ID: 6b8dd80a-cc18-474d-922f-609de74e352c

Use your AWS Access Key ID and Secret Access Key

The Jenkinsfile uses:
environment {
    AWS_ACCESS_KEY_ID = credentials('6b8dd80a-cc18-474d-922f-609de74e352c')
    AWS_SECRET_ACCESS_KEY = credentials('6b8dd80a-cc18-474d-922f-609de74e352c')
}

📦 Jenkins Pipeline Execution
The Jenkinsfile runs the following steps:

🔄 Checkout Code

🔧 Terraform Init

✅ Terraform Validate

📋 Terraform Plan

🚀 Terraform Apply

▶️ How to Run
In Jenkins:

Create a new pipeline job

Point it to your GitHub repo

Click Build Now

Watch the pipeline in Stage View

📦 S3 Remote Backend Configuration (main.tf)
Make sure your main.tf contains the following backend config:
terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

🧪 Test Locally (Optional)
To enter the container and test Terraform manually:

docker run -it terraform-agent /bin/bash
🙋‍♂️ Author
Dilip Keshav

GitHub: @DilipKeshav8

🤝 Contributions
Feel free to open issues or pull requests to improve this setup.

🧼 Cleanup
Don't store AWS credentials in plain text.

Use .gitignore to exclude sensitive or generated files.

Use version control for all infrastructure changes.

