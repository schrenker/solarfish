function fish_prompt
    # Constants
    set last_command_status $status
    set color_normal (set_color normal)
    set color_secondary (set_color normal)
    set color_user_default (set_color green)
    set color_user_root (set_color --bold red)
    set color_host_default (set_color yellow)
    set color_host_ssh (set_color red)
    set color_directory (set_color cyan)
    set color_status_success (set_color normal)
    set color_status_error (set_color red)
    set color_git_background magenta
    set color_git_detached red
    set color_git_accent cyan

    # Configuration
    if test -z "$theme_no_git_indicator"
        set -g theme_no_git_indicator no
    end
    if test -z "$theme_short_path"
        set -g theme_short_path no
    end

    # User
    if fish_is_root_user
        set color_user $color_user_root
    else
        set color_user $color_user_default
    end
    echo -ns $color_user "$USER" $color_normal $color_secondary "@"

    # Host
    if test -n "$SSH_TTY"
        set color_host $color_host_ssh
    else
        set color_host $color_host_default
    end
    echo -ns $color_host (hostname) $color_secondary " "

    # Directory
    if test "$theme_short_path" = yes
        set -g fish_prompt_pwd_dir_length 1
    else
        set -g fish_prompt_pwd_dir_length 0
    end
    echo -ns $color_directory (prompt_pwd)

    # Git status
    if not test "$theme_no_git_indicator" = yes
        set -g __fish_git_prompt_show_informative_status yes
        set -g __fish_git_prompt_showdirtystate yes
        set -g __fish_git_prompt_showuntrackedfiles yes
        set -g __fish_git_prompt_showupstream auto
        set -g __fish_git_prompt_showstashstate yes
        set -g __fish_git_prompt_showcolorhints yes

        set -g __fish_git_prompt_char_stateseparator " "
        set -g __fish_git_prompt_color $color_git_background
        set -g __fish_git_prompt_color_branch $color_git_background
        set -g __fish_git_prompt_color_branch_detached $color_git_detached

        set -g __fish_git_prompt_color_cleanstate $color_git_accent
        set -g __fish_git_prompt_color_dirtystate $color_git_accent
        set -g __fish_git_prompt_color_invalidstate $color_git_accent
        set -g __fish_git_prompt_color_stagedstate $color_git_accent
        set -g __fish_git_prompt_color_stashstate $color_git_accent
        set -g __fish_git_prompt_color_untrackedfiles $color_git_accent
        set -g __fish_git_prompt_color_upstream $color_git_accent

        set -g __fish_git_prompt_char_upstream_prefix " "
        set -g __fish_git_prompt_char_cleanstate ""
        set -g __fish_git_prompt_char_dirtystate "*"
        set -g __fish_git_prompt_char_invalidstate "#"
        set -g __fish_git_prompt_char_stagedstate "+"
        set -g __fish_git_prompt_char_untrackedfiles "%"
        set -g __fish_git_prompt_char_upstream_ahead "↑"
        set -g __fish_git_prompt_char_upstream_behind "↓"
        set -g __fish_git_prompt_char_upstream_diverged "⥄"
        set -g __fish_git_prompt_char_stashstate "⚑"

        fish_git_prompt
    end

    # Prompt
    if test $last_command_status -eq 0
        set color_status $color_status_success
    else
        set color_status $color_status_error
    end
    if fish_is_root_user
        set prompt "#"
    else
        set prompt "\$"
    end
    echo -nse "\n" $color_status $prompt $color_normal " "
end
