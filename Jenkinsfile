pipeline {
    agent any
    
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            
        }
        stage('Deliver') {
            steps {
                // echo "delivered"
                // echo "${WORKSPACE}"
                sh sudo 'aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com'
                sh 'sudo cp ${WORKSPACE}/target/*.jar /home/ec2-user/app1/simple-java-maven-app'
                sh 'sudo cp ${WORKSPACE}/target/*.jar .'
                
                echo Building the Docker image...          
                sh 'sudo docker build -t $IMAGE_REPO_NAME:$IMAGE_TAG .'
                sh 'sudo docker tag $IMAGE_REPO_NAME:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG'
                
                
                sh 'sudo docker build . -t ${BUILD_NUMBER}'
                
                sh 'sudo docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:$IMAGE_TAG'
                
                echo "${PWD}"
            }
        }
    }
}
