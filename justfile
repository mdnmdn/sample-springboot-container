set-sdk:
  sdk use java 21.0.3-amzn 

run:
   ./mvnw spring-boot:run 

docker-build:
   #./mvnw spring-boot:build-image
   docker build . -t hdassistant-backend
   
docker-run:
   docker run --rm -ti -p 8085:8080 --name hdassistant-backend-run  hdassistant-backend:latest

