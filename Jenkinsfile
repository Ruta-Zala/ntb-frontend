pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = 'vue-project-vue-app-1'  // You can change this to the name you want
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build Docker image using docker-compose
                    sh 'docker-compose build'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside the container (ensure the test script is available in your package.json)
                    sh 'docker-compose run vue-app npm run test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy the application with docker-compose in detached mode
                    sh 'docker-compose up -d'
                }
            }
        }
    }
    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed.'
        }
    }
}
