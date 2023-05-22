pipeline{
	agent any
	stages{
		stage('Build'){
			steps{
				sh 'docker build -t test-docker:latest .'
				sh "docker tag test-docker:latest ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
		stage("Publish"){
			steps{
				sh "echo ${env.CI_REGISTRY_PASSWORD} | docker login -u ${env.CI_REGISTRY_USER} --password-stdin ${env.CI_REGISTRY}"
				sh "docker build -t ${env.CI_REGISTRY}/test-docker:latest ."
				sh "docker push ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
		stage("Deploy"){
			steps{
				sshagent(credentials: ['slave-ssh']) {
			      sh '''
			      [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
   					ssh-keyscan -t rsa,dsa 103.52.114.253 >> ~/.ssh/known_hosts
			      '''
			      sh "ssh dery-2@103.52.114.253 'echo ${env.CI_REGISTRY_PASSWORD} | docker login -u ${env.CI_REGISTRY_USER} --password-stdin ${env.CI_REGISTRY} || sudo docker pull ${env.CI_REGISTRY}/test-docker:latest || sudo docker run ${env.CI_REGISTRY}/test-docker:latest || sudo docker ps'"
			    }
			}
		}
	}
}