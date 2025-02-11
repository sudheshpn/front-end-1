pipeline {
    agent any
    tools {nodejs "node"}
    environment {
        //be sure to replace "willbla" with your own Docker Hub username
        DOCKER_IMAGE_NAME = "sudheshpn/frontend"
    }
    stages {
        stage('Install') {
            steps {
                echo 'Install..'
                sh 'npm install'
            }
        }

    stage('Build') {
            steps {
                echo 'Building Nodejs APP..'
                sh 'npm build'
            }
        }     
        
     stage('Test') {
            steps {
                echo 'Testing..'
                sh 'npm test'
            }
        }
        
 
        stage('Package') {
            steps {
                echo 'Deploying....'
                sh 'npm run package'
                dir('distribution') {
                 archiveArtifacts artifacts: '*.zip', fingerprint: true
            }
        }
        }
        stage('Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                        app = docker.build(DOCKER_IMAGE_NAME)                   
                        app.inside {
                        sh 'echo $(curl localhost:8079)'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            when {
                branch 'master'
           }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
            stage('DeployToProduction') {
            when {
                branch 'master'
            }
            steps {
                input 'Deploy to Production?'
                milestone(1)
                //implement Kubernetes deployment here
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    kubeConfig: [path: '/var/lib/jenkins/workspace/.kube/config'],
                    configs: 'frontend.yaml',
                    enableConfigSubstitution: true
                )
            }
        }
    }
}
     
   
