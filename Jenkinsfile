pipeline {
  agent none
  stages {
    stage('build and test') {
      agent { docker { image 'python:3.6.9-alpine' } }
      stages {
        stage('build'){
          steps {
            sh 'pip install --no-cache-dir --user -r requirements.txt'
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
  }
}
