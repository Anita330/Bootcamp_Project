#pull docker image from docker hub
docker pull stacksimplify/retail-store-sample-ui:1.0.0

# Run Docker Container
docker run --name <CONTAINER-NAME> -p <HOST_PORT>:<CONTAINER_PORT> -d <IMAGE_NAME>:<TAG>

# Example using Docker Hub image:
docker run --name myapp1 -p 8888:8080 -d stacksimplify/retail-store-sample-ui:1.0.0

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

