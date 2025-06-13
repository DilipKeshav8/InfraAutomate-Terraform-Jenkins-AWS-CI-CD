pipeline {
    agent label { 'slave' }

    environment {
        AWS_ACCESS_KEY_ID = credentials('6b8dd80a-cc18-474d-922f-609de74e352c')
        AWS_SECRET_ACCESS_KEY = credentials('6b8dd80a-cc18-474d-922f-609de74e352c')
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
