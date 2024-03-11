#!/bin/sh

sudo apt update
sudo apt -y install graphviz
sudo apt-get -y install pandoc

cargo install mdbook-linkcheck
cargo install mdbook-toc
cargo install mdbook-graphviz
cargo install mdbook-bibfile-referencing
