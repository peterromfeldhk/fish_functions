function subl
  nix-shell -p \
    # go golint gocode \
    elixir \
    terraform-full \
    nodejs-8_x \
    ansible ansible-lint \
    --run "subl $argv"
end
