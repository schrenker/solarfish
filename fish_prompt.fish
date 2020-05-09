# List of options:
# 
# set -g theme_display_time yes/no
# set -g theme_short_dir yes/no

function set_props -d 'Set default prop values'
  if -z "$theme_show_time"
    set -g theme_show_time no
  end
  if -z "$theme_short_path"
    set -g theme_short_path no
  end
  if -z "$theme_current_folder_path"
    set -g theme_current_folder_path no
  end
end

function prompt_long_pwd -d 'Print the current working directory'
  # From https://stackoverflow.com/questions/866989/fish-interactive-shell-full-path/37337624
  echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
end

function fish_prompt
  set_props

  set -l last_command_status $status

  set -l default_prompt "\$" 
  set -l root_prompt    "#"
  set -l ahead          "↑"
  set -l behind         "↓"
  set -l diverged       "⥄ "
  set -l dirty          "⨯"
  set -l none           "◦"

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color $fish_pager_color_progress 2> /dev/null; or set_color cyan)
  set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)
  set -l directory_color  (set_color green)
  set -l repository_color (set_color magenta)
  set -l time_color       (set_color blue) 

  set -l default_user_color (set_color red)
  set -l root_user_color (set_color --bold red)

  set -l ssh_host_color (set_color --bold red)
  set -l default_host_color (set_color yellow)

  # Time
  if test $theme_show_time = 'yes'
    echo -n -s  $time_color "[" (date +%H:%M) "]" $normal_color " "
  end

  # User
  if test $USER = 'root'
    echo -n -s $root_user_color (whoami) $normal_color
  else
    echo -n -s $default_user_color (whoami) $normal_color
  end

  # Host
  if test $SSH_TTY
    echo -n -s " at " $ssh_host_color (hostname) $normal_color
  else
    echo -n -s " at " $default_host_color (hostname) $normal_color
  end

  # Directory
  if test $theme_short_path = 'yes'
    set -U fish_prompt_pwd_dir_length 1
  else
    set -U fish_prompt_pwd_dir_length 0
  end
  if test $theme_current_folder_path = 'yes'
    echo -n -s " in " $directory_color (basename (pwd)) $normal_color
  else
    echo -n -s " in " $directory_color (prompt_pwd) $normal_color
  end

  # Git repository
  if git_is_repo
    echo -n -s " on " $repository_color (git_branch_name) $normal_color " "

    if git_is_touched
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end
  end

  # Prompt
  echo -n -s -e "\n"
  if test $last_command_status -eq 0
    echo -n -s $normal_color
  else
    echo -n -s $error_color
  end
  
  if test $USER = 'root'
    echo -n -s -e $root_prompt " " $normal_color
  else
    echo -n -s -e $default_prompt " " $normal_color
  end
end
