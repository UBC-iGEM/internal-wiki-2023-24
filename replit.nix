{ pkgs }: {
  deps = [
    pkgs.man
    pkgs.graphviz
    pkgs.mdbook
    pkgs.mdbook-linkcheck
    pkgs.mdbook-graphviz
    pkgs.mdbook-toc
  ];
}