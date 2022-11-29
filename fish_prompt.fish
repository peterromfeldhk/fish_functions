function fish_prompt
  set -l last_command_status $status
  set -l cwd
  set -l kube_context

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  if type -q kubectl
    set kube_context (command kubectl config current-context 2>/dev/null)
  end

  set -l nix      "[nix]"
  set -l fish     "⋊>"
  set -l ahead    "↑"
  set -l behind   "↓"
  set -l diverged "⥄ "
  set -l dirty    "⨯"
  set -l none     "◦"

  set -l normal_color     (set_color normal)
  set -l nix_color        (set_color green)
  set -l kube_color       (set_color magenta)
  set -l success_color    (set_color cyan)
  set -l error_color      (set_color red --bold)
  set -l directory_color  (set_color brown)
  set -l repository_color (set_color green)

  if test -n "$IN_NIX_SHELL"
    echo -n -s $nix_color $nix
  end

  if test -n "$kube_context"
    echo -n -s $kube_color "[$kube_context]"
  end

  if test (id -u) -eq 0
    echo -n -s $error_color "#" $normal_color
  end

  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color
  else
    echo -n -s $error_color $fish $normal_color
  end

  if git_is_repo
    if test "$theme_short_path" = 'yes'
      set root_folder (command git rev-parse --show-toplevel 2>/dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

    echo -n -s " " $directory_color $cwd $normal_color
    echo -n -s " on " $repository_color (git_branch_name) $normal_color " "

    if git_is_touched
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end
  else
    echo -n -s " " $directory_color $cwd $normal_color
  end

  echo -n -s " "
end
