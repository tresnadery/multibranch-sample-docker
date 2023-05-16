pipeline{
	agent any
	stages{
		stage('Build'){
			steps{
				sh 'docker build -t test-docker:latest .'
				sh "docker tag test-docker:latest ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
		stage("Push Image"){
			steps{
				sh "echo ${env.CI_REGISTRY_PASSWORD} | docker login -u ${env.CI_REGISTRY_USER} --password-stdin ${env.CI_REGISTRY}"
				sh "docker push ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
		stage("Run Image"){
			steps{
				sh "docker run ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
	}
}