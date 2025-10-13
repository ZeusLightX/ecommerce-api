pipeline {
    agent any

    environment {
        JAVA_HOME = '/opt/java/openjdk'
        PATH = "${JAVA_HOME}/bin:${PATH}"
        DOCKER_IMAGE = 'ecommerce-api:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:ZeusLightX/ecommerce-api.git',
                    credentialsId: 'github-key'
            }
        }

        stage('Build') {
            steps {
                echo '🏗️ Building project...'
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh './mvnw test'
            }
        }

        stage('Docker Build') {
            steps {
                echo '🐳 Building Docker image...'
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Run') {
            steps {
                echo '🚀 Running container...'
                sh "docker run -d -p 8080:8080 ${DOCKER_IMAGE}"
            }
        }
    }

    post {
        success {
            echo '✅ Build completed successfully!'
        }
        failure {
            echo '❌ Build or test failed.'
        }
    }
}
