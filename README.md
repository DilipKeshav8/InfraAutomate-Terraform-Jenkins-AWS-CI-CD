# 🚀 Terraform AWS Deployment with Jenkins Pipeline Automation

This project automates the provisioning of AWS infrastructure using **Terraform**, integrated with a **Jenkins** pipeline. The focus is on CI/CD-style infrastructure-as-code delivery, leveraging remote state management via **Amazon S3**.

---

## ✨ Key Features

- 🧾 **Infrastructure as Code**: Define AWS infrastructure using Terraform scripts.
- 🔁 **Automated CI/CD Pipeline**: Jenkins pipeline automates Terraform commands.
- ☁️ **Remote State with S3**: Stores Terraform state in a centralized and versioned S3 bucket.
- 🛠️ **Jenkins Agent Execution**: Pipeline runs on Jenkins agent nodes (e.g., EC2).
- 🔐 **Credential Management**: Uses secure AWS credentials via Jenkins plugin.
- ✅ **Reproducible Deployments**: Changes are tracked and repeatable via version control.

---

## 📁 Repository Contents

| File / Folder         | Description                                               |
|-----------------------|-----------------------------------------------------------|
| `main.tf`             | Core Terraform configuration for AWS resources            |
| `iam.tf`              | IAM roles and policies needed for resource access         |
| `Jenkinsfile`         | Jenkins pipeline definition (declarative)                 |
| `jenkins_setupec2/`   | Scripts to provision Jenkins agent EC2 instance           |
| `.gitignore`          | Git ignored files                                         |

---

## ⚙️ Prerequisites

- ✅ **AWS Account** with required IAM permissions
- ✅ **S3 Bucket** for Terraform remote backend
- ✅ **Jenkins Server** with agent node
- ✅ **AWS CLI** and **Terraform** installed on the agent
- ✅ **Jenkins Plugins**:
  - 🧩 Git Server
  - 🧩 Terraform
  - 🧩 Stage View Pipeline
  - 🧩 AWS Credentials

---

## 🛠️ Setup Instructions

1. **Clone the Repository**  
   git clone https://github.com/DilipKeshav8/<repository-name>.git
   cd <repository-name>

2. Configure Remote Backend
Make sure your S3 bucket backend is set in the main.tf like this:

terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

3. Provision Jenkins Agent EC2

Navigate to jenkins_setupec2/ and run your provisioning script or Terraform to launch an EC2 instance with Jenkins agent configuration.

4. Set AWS Credentials in Jenkins

Go to Jenkins → Manage Jenkins → Credentials

Add AWS Access Key ID and Secret Access Key under a Global credential scope.

Reference it in your Jenkinsfile.

🚦 Running the Jenkins Pipeline
The Jenkinsfile pipeline performs the following:

🔄 Checkout Code

🧪 Terraform Init & Plan

🚀 Terraform Apply

▶️ Trigger Manually
Open Jenkins Dashboard

Select your pipeline job

Click Build Now ✅

You can also schedule builds or trigger them via GitHub webhooks.

📌 Notes
Ensure Jenkins agents can reach AWS endpoints.

Never store plaintext credentials—use Jenkins' AWS Credentials plugin.

Customize resources in main.tf and iam.tf to match your AWS infrastructure needs.

👤 Author
Dilip Keshav
GitHub: @DilipKeshav8

🧩 Contributions
Feel free to open issues or submit pull requests to enhance this project.

