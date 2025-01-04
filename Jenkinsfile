pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x scripts/build.sh'
        sh './scripts/build.sh'
      }
    }

    stage('Test') {
      steps {
        sh './scripts/test.sh'
      }
    }

    stage('Docker image build') {
      steps {
        sh 'docker build -t myimagetest:latest .'
        sh 'docker images'
      }
    }

    stage('Docker image push') {
      steps {
        sh 'echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin'
        sh 'docker tag myimagetest:latest mansur777/test-jenkins-pipeline:latest'
        sh 'docker push mansur777/test-jenkins-pipeline:latest'
      }
    }

  }
  environment {
    DOCKER_IMAGE = 'mansur777/test-jenkins-pipeline'
  }
}