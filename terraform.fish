function terraform
  nix-shell -p terraform terraform-providers.aws terraform-providers.random --run "terraform $argv"
end
