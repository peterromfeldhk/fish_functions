function git-diff
  git diff-tree --no-commit-id --name-only -r $argv
end
