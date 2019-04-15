function pass
  nix-shell -I nixpkgs=https://github.com/nixos/nixpkgs/archive/84be644f87493ab5bc874580c1d45d7635d6547f.tar.gz -p pass --run "pass $argv"
end
