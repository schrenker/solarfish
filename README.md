# solarfish

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.7.0-007EC7.svg)](https://fishshell.com)

A git-aware two-line [fish shell](https://fishshell.com) theme. Inspired by [simple-ass-prompt](https://github.com/lfiolhais/theme-simple-ass-prompt) and the default bash prompt.

<p align="center">
<img src="https://i.imgur.com/Ij2DTOh.png" alt="shell theme screenshot">
</p>

## Features

- Two-line prompt
- Git status icons: dirty `*`, staged `+`, ahead `↑`, behind `↓`, diverged `⥄`
- Previous command status (prompt turns red on error)
- Root user indicator (username turns red when running as root)
- Remote host indicator (hostname turns red when running under a ssh connection)
- Kubectl context:namespace indicator after first use of kubectl in given shell session. Reacts to following commands/aliases:
  - kubectl
  - k
  - kg
  - kd
  - kubectx
  - kx
  - kubens
  - kns

## Install

Using [fisher](https://github.com/jorgebucaran/fisher):

```
fisher install schrenker/solarfish
```

Using [oh my fish](https://www.github.com/oh-my-fish/oh-my-fish):

```
omf install schrenker/solarfish
```

## Configuration

Add any of the following lines to `~/.config/fish/config.fish`

```bash
# Display a shortened directory path
set -g theme_short_path yes

# Disable the git indicator
set -g theme_no_git_indicator yes

# Disable kubectl indicator
set -g theme_no_kubectl_indicator yes
```
