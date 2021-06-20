pipeline {
  agent none
  stages {
    stage('build and test') {
      agent { docker { image 'python:3.6.9-alpine' } }
      stages {
        stage('build'){
          steps {
            sh 'pip install --target {env.WORKSPACE} -r requirements.txt'
          }
        }
        stage('test') {
          steps {
            sh 'echo "skip test"'
      
          }
        }
      }
    }
    stage('build docker image'){
      agent any
      steps{
        sh 'docker build -t my-flask-image:latest .'
        sh 'a=`docker images -f "dangling=true" -q | wc -l`'
        sh 'if [ $a -ge 0 ];then docker rmi $(docker images -f "dangling=true" -q);fi'
      }
    }
    
    stage('run docker image'){
      agent any
      steps{
        sh 'docker stop my-flask-app'
        sh 'docker rm my-flask-app'
        sh 'docker run -d -p 5001:5001 --name=my-flask-app my-flask-image:latest'
      }
    }
  }
}
