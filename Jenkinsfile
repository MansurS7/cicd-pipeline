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
        sh 'echo "DOCKER_USERNAME: $DOCKER_USERNAME"; echo "DOCKER_PASSWORD: $DOCKER_PASSWORD"'
        sh 'echo "dckr_pat_q_ypG2te-Ddr2-SjiT1gZDd_bzA" | docker login -u "mansur777" --password-stdin'
        sh 'docker tag myimagetest:latest mansur777/myimagetest:latest'
        sh 'docker push mansur777/myimagetest:latest'
      }
    }

  }
  environment {
    DOCKER_IMAGE = 'mansur777/myimagetest'
  }
}
