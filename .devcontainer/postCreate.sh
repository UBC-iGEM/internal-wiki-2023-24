#!/bin/sh

sudo apt update
sudo apt -y install graphviz

cargo install mdbook-linkcheck
cargo install mdbook-toc
cargo install mdbook-graphviz