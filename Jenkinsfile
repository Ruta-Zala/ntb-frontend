pipeline {
    agent any
    
    environment {
        // Define environment variables if needed
        NODE_HOME = tool name: 'NodeJS', type: 'NodeJS'
        PATH = "${NODE_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install project dependencies
                script {
                    // Run npm install (you could also use yarn if that's your preference)
                    sh 'npm install'
                }
            }
        }

        stage('Lint') {
            steps {
                // Run ESLint for code quality checks
                script {
                    // Run ESLint to check for issues and automatically fix them
                    sh 'npm run lint'
                }
            }
        }

        stage('Format Check') {
            steps {
                // Check code formatting with Prettier
                script {
                    sh 'npm run format-check'
                }
            }
        }

        stage('Build') {
            steps {
                // Run the build process using Vite
                script {
                    sh 'npm run build'
                }
            }
        }

        stage('Test') {
            steps {
                // Run unit tests (if applicable)
                // You can add this stage if you have tests set up in your project
                script {
                    sh 'npm test'  // Replace with your actual test command
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'main'  // Ensure deployment only happens on the main branch
            }
            steps {
                // Add your deployment steps here (e.g., to AWS, Firebase, Netlify, etc.)
                script {
                    echo "Deploying application..."
                    // For example, deploying to Firebase (replace with actual command)
                    // sh 'firebase deploy'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
