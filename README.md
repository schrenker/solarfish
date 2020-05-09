# Solarfish

[![Oh My Fish](https://img.shields.io/badge/Framework-Oh_My_Fish-blue.svg?style=flat)](https://github.com/oh-my-fish/oh-my-fish)
[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)

A simple, git-aware, two-line theme for [Oh My Fish][omf-link].

<p align="center">
<img src="./screenshot.png">
</p>

## Install

Make sure you have [Oh My Fish][omf-link] installed.

```
$ omf theme solarfish
```

## Features

- Easy, readable prompt
- Git commands at a glance
- A subtle timestamp hanging out off to the right. (configurable)
- Previous command status
- Special greeting prompt if `cowsay` is installed!

## Configuration

You can modify the prompt with the following configuration options.

Add any of the following lines to 
`~/.config/fish/config.fish`

```bash
# Display the timestamp in the prompt
set -g theme_show_time yes

# Use a short directory path name
set -g theme_short_path yes

# Display only the current folder name
set -g theme_current_folder_path yes
```

# License

[MIT][mit]

[mit]: http://opensource.org/licenses/MIT
[omf-link]: https://www.github.com/fish-shell/oh-my-fish
