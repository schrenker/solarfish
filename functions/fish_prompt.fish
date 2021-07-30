function fish_prompt
  # Constants
  set -l last_command_status  $status
  set -l default_prompt       "\$" 
  set -l root_prompt          "#"
  set -l git_dirty            "*"
  set -l git_staged           "+"
  set -l git_ahead            "↑"
  set -l git_behind           "↓"
  set -l git_diverged         "⥄"

  # Color Constants
  set -l normal_color           (set_color normal)
  set -l secondary_color        (set_color brcyan)

  set -l default_user_color     (set_color red)
  set -l root_user_color        (set_color --bold red)

  set -l ssh_host_color         (set_color --bold red)
  set -l default_host_color     (set_color yellow)

  set -l directory_color        (set_color green)
  set -l repository_color       (set_color magenta)
  set -l repository_icon_color  (set_color cyan)
  set -l time_color             (set_color blue)
  set -l success_color          (set_color normal)
  set -l error_color            (set_color red)

  # Set theme config default values
  if test -z "$theme_show_time"
    set -g theme_show_time no
  end
  if test -z "$theme_short_path"
    set -g theme_short_path no
  end
  if test -z "$theme_current_folder_path"
    set -g theme_current_folder_path no
  end
  if test -z "$theme_no_git_indicator"
    set -g theme_no_git_indicator no
  end

  # Time
  if test "$theme_show_time" = "yes"
    echo -ns $time_color "[" (date +%H:%M:%S) "]" $normal_color " "
  end

  # User
  if fish_is_root_user
    echo -ns $root_user_color (whoami) $normal_color
  else
    echo -ns $default_user_color (whoami) $normal_color
  end

  echo -ns $secondary_color "@" $normal_color

  # Host
  if test "$SSH_TTY"
    echo -ns $ssh_host_color (hostname) $normal_color
  else
    echo -ns $default_host_color (hostname) $normal_color
  end

  echo -ns $secondary_color ":" $normal_color

  # Directory
  if test "$theme_current_folder_path" = "yes"
    echo -ns $directory_color (basename (pwd)) $normal_color
  else
    if test "$theme_short_path" = "yes"
      set -U fish_prompt_pwd_dir_length 1
    else
      set -U fish_prompt_pwd_dir_length 0
    end
    echo -ns $directory_color (prompt_pwd) $normal_color
  end

  # Git repository
  if not test "$theme_no_git_indicator" = "yes"; and git_is_repo
    echo -ns $repository_color " (" (git_branch_name) $normal_color
    set -l git_untracked (git_untracked)
    if git_is_dirty; or test "$git_untracked"
      echo -ns " " $repository_icon_color $git_dirty $normal_color
    else if git_is_staged
      echo -ns " " $repository_icon_color $git_staged $normal_color
    else
      echo -ns $repository_icon_color
      echo -ns (git_ahead " $git_ahead" " $git_behind" " $git_diverged" "")
      echo -ns $normal_color
    end
    echo -ns $repository_color ")" $normal_color
  end

  # Prompt
  echo -ns -e "\n"
  if test $last_command_status -eq 0
    echo -ns $normal_color
  else
    echo -ns $error_color
  end
  if fish_is_root_user
    echo -ns -e $root_prompt " " $normal_color
  else
    echo -ns -e $default_prompt " " $normal_color
  end
end