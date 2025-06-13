pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('2a6b919d-c24d-4dae-b343-cc85c9a554db')
        AWS_SECRET_ACCESS_KEY = credentials('2a6b919d-c24d-4dae-b343-cc85c9a554db')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/DilipKeshav8/assessment.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
