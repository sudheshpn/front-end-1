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
                sh 'npm install coveralls --save-dev'
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

