function fish_greeting -d "What's up, fish?"
    set_color normal
    if cowsay test >/dev/null
        cowsay Welcome to fish, the friendly interactive shell
    else
        echo Welcome to fish, the friendly interactive shell\nType \'help\' for instructions on how to use fish
    end
end