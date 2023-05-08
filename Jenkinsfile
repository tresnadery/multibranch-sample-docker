pipeline{
	agent {
		docker {
			image 'yeasy/simple-web:latest'
		}
	}
	stages{
		stage('Running'){
			steps{
				sh 'docker run --rm -it -p 80:80 yeasy/simple-web:latest'
			}
		}
	}
}