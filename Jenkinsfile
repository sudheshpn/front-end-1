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

    stage('Install Moca') {
            steps {
                echo 'Installing Mocha module..'
                sh 'npm install -g mocha'
            }
        }     
        
    stage('Install Moca Save') {
            steps {
                echo 'Installing Mocha module..'
                sh 'npm install mocha --save-dev  '
            }
        }        
 

        stage('Install') {
            steps {
                echo 'Deploying....'
                sh 'npm Install'
            }
        }
    }
}

