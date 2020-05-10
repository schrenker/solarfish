function __set_props --description 'Set default config props'
  if test -z "$theme_show_time"
    set -g theme_show_time no
  end
  if test -z "$theme_short_path"
    set -g theme_short_path no
  end
  if test -z "$theme_current_folder_path"
    set -g theme_current_folder_path no
  end
end

function fish_prompt
  # Constants
  set -l last_command_status $status
  set -l default_prompt "\$" 
  set -l root_prompt    "#"
  set -l ahead          "↑"
  set -l behind         "↓"
  set -l diverged       "⥄ "
  set -l dirty          "*"

  # Set theme config default values
  __set_props

  # Color Constants
  set -l normal_color     (set_color normal)
  set -l secondary_color (set_color brcyan)  

  set -l default_user_color (set_color red)
  set -l root_user_color (set_color --bold red)
  
  set -l ssh_host_color (set_color --bold red)
  set -l default_host_color (set_color yellow)
  
  set -l directory_color  (set_color green)
  set -l repository_color (set_color magenta)
  set -l repository_icon_color (set_color cyan)
  set -l time_color       (set_color blue)
  set -l success_color    (set_color normal)
  set -l error_color      (set_color red)

  # Time
  if test $theme_show_time = 'yes'
    echo -ns  $time_color "[" (date +%H:%M:%S) "]" $normal_color " "
  end

  # User
  if test $USER = 'root'
    echo -ns $root_user_color (whoami) $normal_color
  else
    echo -ns $default_user_color (whoami) $normal_color
  end

  echo -ns $secondary_color "@" $normal_color

  # Host
  if test $SSH_TTY
    echo -ns $ssh_host_color (hostname) $normal_color
  else
    echo -ns $default_host_color (hostname) $normal_color
  end

  # Directory
  echo -ns $secondary_color ":" $normal_color

  if test $theme_short_path = 'yes'
    set -U fish_prompt_pwd_dir_length 1
  else
    set -U fish_prompt_pwd_dir_length 0
  end
  if test $theme_current_folder_path = 'yes'
    echo -ns $directory_color (basename (pwd)) $normal_color
  else
    echo -ns $directory_color (prompt_pwd) $normal_color
  end

  # Git repository
  if git_is_repo
    echo -ns $repository_color " (" (git_branch_name) $normal_color

    if git_is_touched
      echo -ns " " $repository_icon_color $dirty $normal_color
    else
      set -l git_status_icon (git_ahead $ahead $behind $diverged "")
      if test -n $git_status_icon
        echo -ns " " $repository_icon_color $git_status_icon $normal_color
      end
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
  
  if test $USER = 'root'
    echo -ns -e $root_prompt " " $normal_color
  else
    echo -ns -e $default_prompt " " $normal_color
  end
end