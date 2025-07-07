# Check MD5 of K22 and K23 params against known MD5 values

K22_MD5="d41d8cd98f00b204e9800998ecf8427e"
K23_MD5="d41d8cd98f00b204e9800998ecf8427e"
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

DOCKER_BUILDKIT=0 docker build --rm --network=host -t rhaoio/prover-node-dev:latest .
