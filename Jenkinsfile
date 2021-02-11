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
                echo "delivered"
                echo "${WORKSPACE}"
                sh 'sudo cp ${WORKSPACE}/target/*.jar /home/ec2-user/app1/simple-java-maven-app'
                sh 'sudo docker build . -t ${BUILD_NUMBER}'
                echo "${PWD}"
            }
        }
    }
}
