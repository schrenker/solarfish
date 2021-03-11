<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### theme-solarfish

> A simple, git-aware, two-line theme for [Oh My Fish][omf-link]. Based off of [simple-ass-prompt](https://github.com/lfiolhais/theme-simple-ass-prompt) and the canonical bash prompt

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.0.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

<p align="center">
<img src="https://i.imgur.com/CxG9s8q.png">
</p>

## Install

```fish
$ omf install solarfish
```

## Features

- Easy to read 2-line prompt, based on the canonical bash prompt
- Git status icons:
  - dirty "\*"
  - staged "+"
  - ahead "↑"
  - behind "↓"
  - diverged "⥄ "
- Previous command status (prompt turns red on error)

## Configuration

Add any of the following lines to
`~/.config/fish/config.fish`

```fish
# Displays the timestamp in the prompt
set -g theme_show_time yes

# Uses a short directory path name
set -g theme_short_path yes

# Displays only the current folder name
set -g theme_current_folder_path yes

# Disable the git indicator
# (May improve performance for large git repositories)
set -g theme_no_git_indicator
```

# License

[MIT][mit] © [thesilican][author]

[mit]: https://opensource.org/licenses/MIT
[author]: https://github.com/thesilican
[omf-link]: https://www.github.com/oh-my-fish/oh-my-fish
[license-badge]: https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
