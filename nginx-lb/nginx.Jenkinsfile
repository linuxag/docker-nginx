pipeline{
    agent{ 
        label "worker1"
    }
    stages{
        stage("Dockerfile"){
            steps{
                sh '''
                echo "newbielinux" > index.html
                cat index.html
                echo 'FROM nginx
            COPY index.html /usr/share/nginx/html' > nginx.Dockerfile
                cat nginx.Dockerfile
                ls -ltrh
                '''
            }
        }
        stage("build"){
            steps{
            sh '''
            ls -ltrh
            cat nginx.Dockerfile
            docker build -t newnginx -f nginx.Dockerfile
            '''
            }
        }
        stage("run"){
            steps{
            sh '''
            
            docker rm -f newnginx | exit 0
            docker run -d --name newnginx -p 80:80 newnginx
            docker ps
            '''
        }   
    }
            
    }
}