pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'Maven3'
    }

    environment {
        GIT_CREDENTIALS = credentials('github-key')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:ZeusLightX/ecommerce-api.git',
                    credentialsId: "${GIT_CREDENTIALS}"
            }
        }

        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh './mvnw test'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ecommerce-api:jenkins .'
            }
        }

        stage('Run') {
            steps {
                echo 'Starting container...'
                sh 'docker run -d -p 8080:8080 ecommerce-api:jenkins'
            }
        }
    }

    post {
        success {
            echo '✅ Build and deployment successful!'
        }
        failure {
            echo '❌ Build or test failed.'
        }
    }
}