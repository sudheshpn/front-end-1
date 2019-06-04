pipeline {
    agent any
      tools {nodejs "node"}
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'npm build'
            }
        }
    stage('Install') {
            steps {
                echo 'Installing Instambul module..'
                sh 'npm install -g istanbul'
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
                sh 'npm package'
                archiveArtifacts artifacts: '**/distribution/*.jar', fingerprint: true
            }
        }
    }
}

