function dot
  nix-shell -p graphviz --run "dot $argv"
end
