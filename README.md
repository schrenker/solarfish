# solarfish
[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.6.4-007EC7.svg)](https://fishshell.com)

A git-aware two-line [fish shell](https://fishshell.com) theme. Based off of [simple-ass-prompt](https://github.com/lfiolhais/theme-simple-ass-prompt) and the default bash prompt.

<p align="center">
<img src="https://i.imgur.com/601hz24.png" alt="shell theme screenshot">
</p>

## Install

Using [fisher](https://github.com/jorgebucaran/fisher):
```
fisher install thesilican/solarfish
```

Using [oh my fish](https://www.github.com/oh-my-fish/oh-my-fish):

```
omf install solarfish
```

## Features

- Easy to read 2-line prompt, based on the canonical bash prompt
- Git status icons:
  - dirty "\*"
  - staged "+"
  - ahead "↑"
  - behind "↓"
  - diverged "⥄ "
- Previous command status (prompt turns red with non-zero status)

## Configuration

Add any of the following lines to `~/.config/fish/config.fish`

```bash
# Display a shortened directory path
set -g theme_short_path yes

# Disable the git indicator
set -g theme_no_git_indicator yes
```

# License

[MIT](https://opensource.org/licenses/MIT) © [thesilican](https://github.com/thesilican)
