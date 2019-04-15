function jupyter
  nix-shell -p python36Packages.jupyter --run "jupyter $argv"
end
