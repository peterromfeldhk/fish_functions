function ansible-playbook
  nix-shell -p ansible --run "ansible-playbook $argv"
end
