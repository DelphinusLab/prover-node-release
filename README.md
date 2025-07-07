# Release Prover Node with Docker

## Building for Docker

1. Copy Param files `K22.params`, `K23.params` into root of this repo.

2. Run the following command to build the prover node Docker image:

```bash
bash build_image.sh
```

3. Push to Docker Hub:

```bash
bash push_dockerhub.sh
```

## Pushing to Docker Hub

To push the built prover node image to Docker Hub, run the following command:

```bash
docker push delphinuslab/prover-node:latest
```

## Running the Prover Node from TAR Archive

## Please do not use this repo directly for running prover node. Instead use the Docker repo: https://github.com/DelphinusLab/prover-node-docker

Unpack the archive by running `tar -xzvf prover_node_{UbuntuVersion}.tar` in the directory you wish to run the prover node from.

## Using TAR archive

### Config file

Ensure the `prover_config.json` file is modified with the correct configuration for the prover node.

Set the `server_url` to the URL of the REST server to fetch tasks from. Currently the server address is https://zkwasm-explorer.delphinuslab.com:8090

Set the `priv_key` to the private key of the prover node to be used for identification purposes.

For `whitelisted_users` field, add any user addresses that are allowed to submit tasks to the prover node.
An empty array will allow any user to submit tasks to the prover node.

Some monitoring parameters can be configured in the `system_warnings` field. The prover node will log a warning if any of the parameters exceed the configured warning level values after a Task is performed.

```
"system_warnings": {
    "disk_usage_warning_level": 80.0,
    "memory_usage_warning_level": 80.0,
    "gpu_memory_usage_warning_level": 80.0,
    "cpu_temp_warning_level": 75.0,
    "gpu_temp_warning_level": 75.0
  }
```

### Running the prover node

Start the prover node by running `bash start_prover.sh` after configuring the `prover_config.json` file.
