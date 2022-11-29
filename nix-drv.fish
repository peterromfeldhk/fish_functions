function nix-drv
  nix-shell -p jq --run "nix show-derivation $argv | jq"
end
