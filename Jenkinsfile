pipeline{
	agent any
	stages{
		stage('Build'){
			steps{
				sh 'docker build -t test-docker:latest'
			}
		}
		stage("Run"){
			steps{
				sh 'docker run -d test-docker'
			}
		}
	}
}