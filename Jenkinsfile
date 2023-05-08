pipeline{
	agent any
	stages{
		stage('Build'){
			steps{
				sh 'docker build -t test-docker:latest .'
			}
		}
		stage("Run"){
			steps{
				sh 'docker run -p 1323:1323 -d test-docker'
			}
		}
	}
}