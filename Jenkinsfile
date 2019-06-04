pipeline {
    agent any
      tools {nodejs "node"}
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
                archiveArtifacts artifacts: '**'/*.jar", allowEmptyArchive: true
            }
        }
    }
}
}
