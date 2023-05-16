pipeline{
	agent any
	stages{
		stage('Build'){
			steps{
				sh 'docker build -t test-docker:latest .'
			}
		}
		stage("Deploy"){
			steps{
				sh "echo ${env.CI_REGISTRY_PASSWORD} | docker login -u ${env.CI_REGISTRY_USER} --password-stdin ${env.CI_REGISTRY}"
				sh "docker build -t test-docker:latest ."
				sh "docker push test-docker:latest"
			}
		}
	}
}