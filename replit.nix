{ pkgs }: {
  deps = [
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
    pkgs.graphviz
    pkgs.mdbook
    pkgs.mdbook-linkcheck
    pkgs.mdbook-graphviz
    pkgs.mdbook-toc
  ];
}