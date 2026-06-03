pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "beauty7718/first_project:0.0.2"
        KUBECONFIG = '/root/.kube/config-jenkins'
    }

    stages {

        stage('Clone Code') {
            steps {

                git branch: 'dev',
                    credentialsId: 'git_credentials',
                    url: 'https://github.com/beauty-singh-code/k8s-practice-project.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Test') {
    steps {
        sh 'docker version'
        sh 'docker ps'
    }
}

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push Docker Image') {
            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {

                    sh 'echo $PASS | docker login -u $USER --password-stdin'

                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {

                sh 'kubectl get nodes'

                sh 'kubectl apply -f k8s/deployment.yaml'

                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}