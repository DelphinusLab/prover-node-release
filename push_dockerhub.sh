
IMAGE_WITH_VERSION_TAG="zkwasm/prover-node:0.0.14"

# Check for a force parameter to force push the image and assign to environment variable

# Set login credentials for Docker Hub
docker login -u <username> -p <password>
# Push the docker image to dockerhub
# Check if the image exists on dockerhub, if it exists we should not push it again
docker manifest inspect $IMAGE_WITH_VERSION_TAG > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Image $IMAGE_WITH_VERSION_TAG already exists on Docker Hub. Skipping push."

    # If --force is not provided, exit the script
    if [ "$1" != "--force" ]; then
        exit 0
    fi
    echo "Force pushing the version $IMAGE_WITH_VERSION_TAG to Docker Hub."
fi

# Re-tag latest image to the latest tag
docker tag zkwasm/prover-node:latest $IMAGE_WITH_VERSION_TAG 

# Make sure to update the tag to be the latest version number
docker push zkwasm/prover-node:latest
docker push $IMAGE_WITH_VERSION_TAG