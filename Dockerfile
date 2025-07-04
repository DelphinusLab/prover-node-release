FROM nvidia/cuda:12.2.0-devel-ubuntu22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
# Install required packages and setup ssh access
RUN useradd -rm -d /home/zkwasm -s /bin/bash -g root -G sudo -u 1001 zkwasm \
    && echo 'zkwasm:zkwasm' | chpasswd \
    && echo 'zkwasm ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

# Switch to the zkwasm user for subsequent commands
USER zkwasm

WORKDIR /home/zkwasm

RUN mkdir prover-node-release

# Copy the tarball into the container
COPY prover_node_Ubuntu2204.tar.gz /home/zkwasm/prover-node-release

WORKDIR /home/zkwasm/prover-node-release
# Unpack tarball
RUN tar -xzvf prover_node_Ubuntu2204.tar.gz

# Create prover log folder
RUN mkdir logs && \
    mkdir logs/prover

# Command overriden by docker-compose
CMD ["true"]
