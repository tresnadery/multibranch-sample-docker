pipeline{
	agent any
	stages{
		stage("Test SSH"){
			steps{
				sshagent(credentials: ['slave-ssh']) {
			      sh '''
			      [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
   					ssh-keyscan -t rsa,dsa 103.52.114.253 >> ~/.ssh/known_hosts
			         ssh dery-2@103.52.114.253
			      '''
			    }
			}
		}
		stage('Build'){
			steps{
				sh 'docker build -t test-docker:latest .'
				sh "docker tag test-docker:latest ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
		stage("Push Image"){
			steps{
				sh "echo ${env.CI_REGISTRY_PASSWORD} | docker login -u ${env.CI_REGISTRY_USER} --password-stdin ${env.CI_REGISTRY}"
				sh "docker build -t ${env.CI_REGISTRY}/test-docker:latest ."
				sh "docker push ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
		stage("Run Image"){
			steps{
				sh "ssh dery-2@103.52.114.253 | sudo docker pull ${env.CI_REGISTRY}/test-docker:latest"
			}
		}
	}
}