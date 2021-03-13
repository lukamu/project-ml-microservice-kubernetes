#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=lukamu/ml-microservice
imagename="ml-microservice"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run microservice --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
podname=$(kubectl get pods --no-headers -o custom-columns=":metadata.name")
kubectl port-forward $podname 8000:80
kubectl logs $podname
