function jq
  nix-shell -p yq --run "yq $argv"
end
