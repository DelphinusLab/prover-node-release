
IMAGE_WITH_VERSION_TAG="rhaoio/prover-node-dev:0.0.14"

# Set login credentials for Docker Hub
docker login -u <username> -p <password>
# Push the docker image to dockerhub
# Check if the image exists on dockerhub, if it exists we should not push it again
docker manifest inspect $IMAGE_WITH_VERSION_TAG > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Image $IMAGE_WITH_VERSION_TAG already exists on Docker Hub. Skipping push."
    exit 0
fi

# Re-tag latest image to the latest tag
docker tag rhaoio/prover-node-dev:latest $IMAGE_WITH_VERSION_TAG 

# Make sure to update the tag to be the latest version number
docker push rhaoio/prover-node-dev:latest