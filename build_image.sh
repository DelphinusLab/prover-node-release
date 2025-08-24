# Check MD5 of K22 and K23 params against known MD5 values

K22_MD5="35bedd3a457dddb2e5c31d92be99831b"
K23_MD5="84c4c97c7e8002a90d291b26e93a5554"  # Replace with the actual MD5 value for K23
K22_FILE="K22.params"
K23_FILE="K23.params"
if [ -f "$K22_FILE" ]; then
    if [ "$(md5sum "$K22_FILE" | awk '{print $1}')" != "$K22_MD5" ]; then
        echo "Error: $K22_FILE has an incorrect MD5 checksum."
        exit 1
    fi
else
    echo "Error: $K22_FILE does not exist."
    exit 1
fi
if [ -f "$K23_FILE" ]; then
    if [ "$(md5sum "$K23_FILE" | awk '{print $1}')" != "$K23_MD5" ]; then
        echo "Error: $K23_FILE has an incorrect MD5 checksum."
        exit 1
    fi
else
    echo "Error: $K23_FILE does not exist."
    exit 1
fi

DOCKER_BUILDKIT=0 docker build --rm --network=host -t zkwasm/prover-node:latest .
