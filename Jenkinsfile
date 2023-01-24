pipeline {
    agent any
  
    //create dockerhub credential in github with your dockerhub Username and Password/Token
    environment {
      DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }
    
    stages {
      
        stage('Checkout') {
            steps {
                git url: 'https://github.com/adeoyedewale/BackendandFrontend.git'
            }
        }
      
        stage('Build Backend') {
            steps {
                sh 'cd backend && npm install'
                sh 'cd ..'
            }
        }
        stage('Build Frontend') {
            steps {
                sh 'cd frontend && npm install && npm run build'
                sh 'cd ..'
            }
        }
        stage('Build Images') {
            steps {
                sh 'docker-compose build'
            }
        }
        
        stage('Login') {
		
              steps {
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login --username febfun --password-stdin'    
              }
		    }
        
     //   stage('Push') {

     //         steps {
     //            sh 'docker push febfun/frontendapp:${BUILD_NUMBER}'
     //         }
     //   }
        
        stage('Push Images to Registry') {
            steps {
                sh 'docker-compose push backend'
		sh 'docker-compose push frontend'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
    
    post {
        always {
	    //cleanWs()
      	sh 'docker logout'
        }
   }
}
