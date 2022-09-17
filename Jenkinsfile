pipeline{
    agent any
    environment{
        IMAGE_NAME="mar97/php-project:1.0"
    }
    stages{
        stage("deployment"){
            steps{
                script{
                     echo "========deploy to ec2========"
                //sshagent
                def bashCmd="bash ./server-cmd.sh ${IMAGE_NAME}"
                def ec2Instance="ec2-user@3.133.105.71"
                sshagent(credentials: ['ec2-docker-server']) {
                  sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${bashCmd}"
                }
            }
        }
            
            post{
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
