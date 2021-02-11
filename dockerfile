FROM java:8
WORKDIR /home/ec2-user/app1/appartifact

ADD my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "nasapicture-0.0.1-SNAPSHOT.war"]
