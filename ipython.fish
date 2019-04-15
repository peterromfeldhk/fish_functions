function ipython
  nix-shell -p python37Packages.python-gnupg python37Packages.pygit2 python37Packages.paramiko python37Packages.psutil python37Packages.requests python37Packages.boto3 python37Packages.ipython --run "ipython $argv"
end
