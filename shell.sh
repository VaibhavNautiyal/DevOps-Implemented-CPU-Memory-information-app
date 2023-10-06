#!/bin/bash

# Define your Docker image name and Dockerfile location
IMAGE_NAME="myfinalapp_image"
DOCKERFILE_PATH="Dockerfile"

# Check if the Docker image exists
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
    # If the image doesn't exist, build it from the Dockerfile
    echo "Docker image '$IMAGE_NAME' not found. Building..."
    docker build -t $IMAGE_NAME -f $DOCKERFILE_PATH .
else
    echo "Docker image '$IMAGE_NAME' found."
fi

# Run a Docker container from the image
docker run -p 5000:5000 --name myapp-container $IMAGE_NAME

# Optionally, you can execute additional commands in the container here
# For example, run a shell inside the container:
# docker exec -it my-container /bin/bash
