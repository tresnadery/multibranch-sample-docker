pipeline{
	agent {
		docker {
			image 'golang:latest'
		}
	}
	stages{
		stage('Testing'){
			steps{
				sh 'go version'
			}
		}
	}
}