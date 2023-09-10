# Running the Prover Node from TAR Archive

Unpack the archive by running `tar -xvf prover_node.tar` in the directory you wish to run the prover node from.

## Using TAR archive

### ZKWasm CLI

Ensure ZKWasm CLI is setup in the ~/zkWasm directory.
The default location for the ZKWasm CLI is `~/zkWasm/target/release/delphinus-cli`

Otherwise modify the `start_prover.sh` script to point to the correct directory.

### Config file

Ensure the `prover_config.json` file is modified with the correct configuration for the prover node.

Set the `server_url` to the URL of the REST server to fetch tasks from. Currently the server address is https://zkwasm-explorer.delphinuslab.com:8090

Set the `priv_key` to the private key of the prover node to be used for `Deploy` tasks.

For `whitelisted_users` field, add any user addresses that are allowed to submit tasks to the prover node.
An empty array will allow any user to submit tasks to the prover node.

Set the `deployment_chain_list` to the list of chains available for deployment.

The endpoints currently provided are public RPC URL's, and are not recommended for use in production as they will get rate limited.

### Truffle Config

`npm install` within `workspace/deploy` directory to install dependencies for truffle deployments.

!IMPORTANT -> make sure the truffle-config.js file is modified with the correct chain details and provider information.
Similar to the config file, the endpoints currently provided are public RPC URL's, and are not recommended for use in production as they will get rate limited.
