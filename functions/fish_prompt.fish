function fish_prompt
    # Constants
    set -l last_command_status $status
    set -l prompt_default "\$"
    set -l prompt_root "#"
    set -l git_dirty "*"
    set -l git_staged "+"
    set -l git_ahead "↑"
    set -l git_behind "↓"
    set -l git_diverged "⥄"

    # Color Constants
    set -l color_normal (set_color normal)
    set -l color_secondary (set_color brblue)
    set -l color_user_default (set_color red)
    set -l color_user_root (set_color --bold red)
    set -l color_host_default (set_color yellow)
    set -l color_host_ssh (set_color --bold red)
    set -l color_directory (set_color green)
    set -l color_status_success (set_color normal)
    set -l color_status_error (set_color red)

    # Configuration
    if test -z "$theme_no_git_indicator"
        set -g theme_no_git_indicator no
    end
    if test -z "$theme_short_path"
        set -g theme_short_path no
    end

    # User
    set -l color_user
    if fish_is_root_user
        set color_user $color_user_root
    else
        set color_user $color_user_default
    end
    echo -ns $color_user (whoami) $color_secondary "@" $color_normal

    # Host
    set -l color_host
    if test -n "$SSH_CLIENT"
        set color_host $color_host_ssh
    else
        set color_host $color_host_default
    end
    echo -ns $color_host (hostname) $color_secondary ":" $color_normal

    # Directory
    if test "$theme_short_path" = yes
        set -g fish_prompt_pwd_dir_length 1
    else
        set -g fish_prompt_pwd_dir_length 0
    end
    echo -ns $color_directory (prompt_pwd) $color_normal

    # Git repository
    if not test "$theme_no_git_indicator" = yes
        set -g __fish_git_prompt_show_informative_status yes
        set -g __fish_git_prompt_showdirtystate yes
        set -g __fish_git_prompt_showuntrackedfiles yes
        set -g __fish_git_prompt_showupstream auto
        set -g __fish_git_prompt_showstashstate yes
        set -g __fish_git_prompt_showcolorhints yes

        set -g __fish_git_prompt_char_stateseparator " "
        set -g __fish_git_prompt_color magenta
        set -g __fish_git_prompt_color_branch magenta
        set -g __fish_git_prompt_color_branch_detached red

        set -g __fish_git_prompt_color_cleanstate cyan
        set -g __fish_git_prompt_color_dirtystate cyan
        set -g __fish_git_prompt_color_invalidstate cyan
        set -g __fish_git_prompt_color_stagedstate cyan
        set -g __fish_git_prompt_color_stashstate cyan
        set -g __fish_git_prompt_color_untrackedfiles cyan
        set -g __fish_git_prompt_color_upstream cyan

        set -g __fish_git_prompt_char_upstream_prefix " "
        set -g __fish_git_prompt_char_cleanstate ""
        set -g __fish_git_prompt_char_dirtystate "*"
        set -g __fish_git_prompt_char_invalidstate "#"
        set -g __fish_git_prompt_char_stagedstate "+"
        set -g __fish_git_prompt_char_untrackedfiles "%"
        set -g __fish_git_prompt_char_upstream_ahead "↑"
        set -g __fish_git_prompt_char_upstream_behind "↓"
        set -g __fish_git_prompt_char_upstream_diverged "⥄"

        fish_git_prompt
    end

    # Prompt
    set -l color_status
    if test $last_command_status -eq 0
        set color_status $color_status_success
    else
        set color_status $color_status_error
    end
    set -l prompt
    if fish_is_root_user
        set prompt $prompt_root
    else
        set prompt $prompt_default
    end
    echo -ns -e "\n" $color_status $prompt $color_normal " "
end
