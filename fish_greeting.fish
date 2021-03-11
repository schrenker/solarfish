function fish_greeting -d "What's up, fish?"
    set_color normal
    if test -n (echo (command -v cowsay))
        cowsay "Welcome to fish, the friendly interactive shell"
    else
        echo $fish_greeting
    end
end