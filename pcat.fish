function pcat
  nix-shell -p python3Packages.pygments --run "pygmentize $argv"
end
