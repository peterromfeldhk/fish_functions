function pass
  nix-shell -I nixpkgs=https://github.com/nixos/nixpkgs/archive/37bdc088ef06194353c0ebe7643267e3881afeb8.tar.gz -p pass --run "pass $argv"
end
