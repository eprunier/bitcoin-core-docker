# Bitcoin Core Docker

Build and run a Bitcoin core full node in a Docker container

## Build

    docker build -t bitcoin [--build-arg btc_version=0.16.0] [--build-arg cc_cores=4] .

- btc_version: Bitcoin core version (default 0.16.0)
- cc_cores: number of cores to use for compilation (default 1)

## Run

    docker run --name bitcoin [-d] -v /lots/of/space:/bitcoin[:z] -v ./config/fullnode.conf:/root/.bitcoin/bitcoin.conf[:z] bitcoin

## Use bitcoin-cli

The bitcoin container must be started.

    docker exec -it bitcoin bitcoin-cli getblockchaininfo
    docker exec -it bitcoin bitcoin-cli getmempoolinfo
    docker exec -it bitcoin bitcoin-cli getnetworkinfo
    docker exec -it bitcoin bitcoin-cli getwalletinfo
