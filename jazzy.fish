function jazzy
  nix-shell -I nixpkgs=https://api.github.com/repos/peterromfeldhk/nixpkgs/tarball/jazzy -p jazzy --run "jazzy $argv"
end
