#!/bin/sh

sudo apt update
sudo apt -y install graphviz
sudo apt -y install pandoc

cargo install mdbook-linkcheck
cargo install mdbook-toc
cargo install mdbook-graphviz
