pipeline {
    agent any

    tools {
        jdk 'jdk17'
        nodejs 'node16'
    }

    environment {
        DOCKER_IMAGE = "sivagowra/node:latest"
    }

    stages {

        stage("Clean") {
            steps {
                cleanWs()
            }
        }

        stage("Code") {
            steps {
                git 'https://github.com/sivagowra/nodejs-devops-project.git'
            }
        }

        stage("Install dependencies") {
            steps {
                dir('app') {
                    sh 'npm install'
                }
            }
        }

        stage("Build Docker Image") {
            steps {
                sh 'pwd'
                sh 'ls -la'
                sh 'docker build -t $DOCKER_IMAGE -f docker/Dockerfile app'
            }
        }

        stage("Push to DockerHub") {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub') {
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }

        stage("Deployment") {
            steps {
                sh '''
                docker rm -f cont-1 || true
                docker run -d --name cont-1 -p 1234:3000 $DOCKER_IMAGE
                '''
            }
        }
    }
}