pipeline {
    agent any
    tools{
        maven 'maven_3_9_6'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ZTH11/devops-automation']])
                sh 'mvn clean install'

            }
        }
        stage('Build Docker') {
            steps {
                script{
                  sh 'docker build . -t hzait/devops-integration'
                }
            }
        }
         stage('Push Image to Hub') {
            steps {
                script{
                withCredentials([string(credentialsId: 'docker-password', variable: 'dockerPassword')]) {
                sh 'docker login -u hzait -p ${dockerPassword}'
                sh 'docker push hzait/devops-integration'
                }
                }
            }
        }
    }
}
