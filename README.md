# DevEnv

## Requirements

[gh](https://github.com/cli/cli#installation), [install on linux and BSD](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

`(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y`

[Vundle.vim](https://github.com/VundleVim/Vundle.vim), `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

## Setup
run `./setup.sh`

## Source rc file
To use .zshrc on `macOS(UNIX)`, add below statements to `~/.zshrc`
`source ~/DevEnv/rc/sh/.dev_env_updates_rc`
`source ~/DevEnv/rc/sh/.zshrc_mac`

To use .bashrc on `linux(cygwin, Ubuntu, CentOS and etc...)`, add below statements to `~/.bashrc`
`source ~/DevEnv/rc/sh/.dev_env_updates_rc`
`source ~/DevEnv/rc/sh/.bashrc_linux`
