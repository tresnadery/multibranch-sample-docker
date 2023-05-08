pipeline{
	agent {
		dockerfile true
	}
	stages{
		stage('Run'){
			steps{
				sh 'docker run -d test-docker'
			}
		}
	}
}