pipeline{
    agent { label "worker1" }
    stages{
        /*stage("git-checkout"){
            steps{
                sh '''
                git clone https://github.com/newbielinux1/docker-nginx.git
                '''
            }
        }*/
        stage("docker-build"){
            steps{
                sh '''
                docker build -t mynginx nginx.Dockerfile .
                
                docker images | grep nginx
                
                '''
            }
        }
        stage("docker-push"){
            steps{
                sh '''
                echo "docker push"
                '''
            }
        }
        stage("docker-run"){
            steps{
                sh '''
                docker rm -f mynginx | exit 0
                docker --name mynginx run -d -p 8888:80 mynginx
                '''
            }
        }
        
    }
}