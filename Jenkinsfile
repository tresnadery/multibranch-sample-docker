pipeline{
	agent{
		label "docker"
	}
	stages{
		stage('hello'){
			steps{
				echo "hello"
				sh "docker --version"
			}
		}
	}
}