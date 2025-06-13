pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    parameters {
        booleanParam(name: 'AUTO_APPLY', defaultValue: false, description: 'Automatically apply terraform plan')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/DilipKeshav8/assessment.git'
            }
        }

        stage('Terraform Init and Plan') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: '2a6b919d-c24d-4dae-b343-cc85c9a554db'
                ]]) {
                    sh 'terraform init'
                    sh 'terraform validate'
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { return params.AUTO_APPLY == true }
            }
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: '2a6b919d-c24d-4dae-b343-cc85c9a554db'
                ]]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
