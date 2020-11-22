# Command line tools for spherical panoramas

## Build docker image

`docker build --tag panorama-tools:1.0 .`

## Run container based on built image and log in into bash

`docker run -ti -v /local/folder/with/panoramas:/panoramas panorama-tools:1.0 /bin/bash`

Substitue `/local/folder/with/panoramas` with your local working directory.

## Installed tools

- freepv with qtvr2img
- tools listed in https://metacpan.org/release/Panotools-Script
