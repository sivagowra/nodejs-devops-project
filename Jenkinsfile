pipeline {

    agent any

    environment {
        DOCKER_IMAGE = "sivagowra/node-devops-app"
        DOCKER_TAG = "latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/sivagowra/nodejs-devops-project.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Security Scan') {
            steps {
                sh 'npm audit'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile .'
            }
        }

        stage('Push Image') {

            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-cred',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $DOCKER_IMAGE:$DOCKER_TAG
                    '''
                }
            }
        }

        stage('Deploy') {

            steps {

                sshagent(['server-ssh']) {

                    sh '''
                    ssh ubuntu@SERVER-IP << EOF

                    docker pull sivagowra/node-devops-app:latest

                    docker stop nodeapp || true
                    docker rm nodeapp || true

                    docker run -d -p 3000:3000 --name nodeapp sivagowra/node-devops-app:latest

                    EOF
                    '''
                }
            }
        }
    }
}