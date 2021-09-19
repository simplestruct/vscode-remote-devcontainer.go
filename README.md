# vscode-remote-devcontainer.go

![example workflow](https://github.com/simplestruct/vscode-remote-devcontainer.go/actions/workflows/publish-image.yaml/badge.svg)

[:link: Download the image](https://github.com/simplestruct/vscode-remote-devcontainer.go/pkgs/container/vscode-remote-devcontainer.go)

This project uses Visual Studio Code Remote Containers extension to run the development environment in Docker container.

## Requirement

1. [Docker Desktop](https://docs.docker.com/docker-for-mac/install/) daemon running on your machine
2. install [`ms-vscode-remote.remote-containers`](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension

## To start

1. In VSCode, select command `Remote-Container: Reopen in Container`
2. Wait for the container to build
3. The command prompt in vscode's integrated terminal should start at `/workspaces/vscode-remote-devcontainer.go`

```sh
go run main.go
```

> Note: there is an "Analysis Tools Missing" issue from `gocode-gomod`. It is not needed since we use `gopls`. If it bugs you, press "install" button when vscode extension prompt from "Analysis Tools Missing".

## To publish image to Github Packages container registry

Create a new release via Github using a `vx.x.x` version pattern. Match `golang` image major and minor version and bump patch for any new releases that doesn't change `golang` image.

The docker image is build and push automatically to Github Packages (ghcr.io) when a version tag (`v*`) is created on the `main` branch. The git version tag is used for the docker image version tag.
