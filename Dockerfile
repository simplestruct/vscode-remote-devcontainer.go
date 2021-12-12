# image for golang development environment
# to use with vscode remote-container with go tools installed

FROM golang:1.17.5

# install zsh and oh-my-zsh
RUN apt-get update \
    && apt-get install -y zsh \
    && sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    # clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install go tools use by golang.go extension
RUN go get \
    # to run "debug test"
    github.com/go-delve/delve/cmd/dlv@v1.7.3 \
    # to run "Go: Add import"
    github.com/uudashr/gopkgs/v2/cmd/gopkgs@v2.1.2 \
    github.com/josharian/impl@v1.1.0 \
    github.com/davidrjenni/reftools/cmd/fillstruct@latest \
    github.com/ramya-rao-a/go-outline@latest

# gopls updates very frequently separate for faster build
RUN go get golang.org/x/tools/gopls@v0.7.3
