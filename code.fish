function code
  nix-shell -p \
    # go golint gocode \
    ripgrep \
    elixir \
    terraform terraform-providers.aws \
    nodejs-8_x \
    python37 python37Packages.autopep8 \
    # python36Packages.pylint \
    kubectl kubernetes-helm helmfile \
    --run "code $argv"
end

