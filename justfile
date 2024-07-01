set-sdk:
  sdk use java 21.0.3-amzn 

run:
   ./mvnw spring-boot:run 

test:
    ./mvnw test

surfire-test:
    ./mvnw surefire:test
			

docker-build:
   #./mvnw spring-boot:build-image
   docker build . -t hdassistant-backend
   
docker-run:
   docker run --rm -ti -p 8085:8080 --name hdassistant-backend-run  hdassistant-backend:latest


docker-test:
   docker run --rm -ti  --name hdassistant-backend-test \
      -v $(pwd):/app -w /app \
      amazoncorretto:21-al2-jdk bash /app/_devops/run-tests-container.sh

