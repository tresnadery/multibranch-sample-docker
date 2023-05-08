pipeline{
	agent {
		docker {
			image 'golang:latest'
		}
	}
	stages{
		stage('Running'){
			steps{
				sh 'go run main.go'
			}
		}
	}
}