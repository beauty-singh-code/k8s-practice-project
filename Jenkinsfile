pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "beauty7718/first_project:0.0.1"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'git branch: 'dev', credentialsId: 'git_credentials', url: 'https://github.com/beauty-singh-code/End-to-End-DevOps-Project.git''
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package'
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

        //stage('Deploy to Kubernetes') {
           // steps {
                //sh 'kubectl apply -f k8s/deployment.yaml'
               // sh 'kubectl apply -f k8s/service.yaml'
            //}
       // }
    }
}