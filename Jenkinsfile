pipeline {
    agent any

      tools {nodejs "4.4.6"}
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
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
                sh 'npm package'
                archiveArtifacts artifacts: '**/distribution/*.jar', fingerprint: true
            }
        }
    }
}
