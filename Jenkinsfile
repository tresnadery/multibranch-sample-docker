pipeline{
	agent{
		label "linux"
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