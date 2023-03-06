#!/bin/bash
set +ex

cd $HOME

echo '
 ██████╗ ██╗ █████╗ ███╗   ██╗███╗   ██╗██╗    ███╗   ███╗ █████╗ ███████╗███████╗██╗              ██╗   ██╗███╗   ██╗██╗██╗  ██╗    ███████╗███████╗████████╗██╗   ██╗██████╗ 
██╔════╝ ██║██╔══██╗████╗  ██║████╗  ██║██║    ████╗ ████║██╔══██╗██╔════╝██╔════╝██║              ██║   ██║████╗  ██║██║╚██╗██╔╝    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
██║  ███╗██║███████║██╔██╗ ██║██╔██╗ ██║██║    ██╔████╔██║███████║███████╗███████╗██║    █████╗    ██║   ██║██╔██╗ ██║██║ ╚███╔╝     ███████╗█████╗     ██║   ██║   ██║██████╔╝
██║   ██║██║██╔══██║██║╚██╗██║██║╚██╗██║██║    ██║╚██╔╝██║██╔══██║╚════██║╚════██║██║    ╚════╝    ██║   ██║██║╚██╗██║██║ ██╔██╗     ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
╚██████╔╝██║██║  ██║██║ ╚████║██║ ╚████║██║    ██║ ╚═╝ ██║██║  ██║███████║███████║██║              ╚██████╔╝██║ ╚████║██║██╔╝ ██╗    ███████║███████╗   ██║   ╚██████╔╝██║     
 ╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝               ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     
                                                                                                                                                                               '


# ## Download this repo and de-compress at dotfiles
curl -L https://github.com/giannimassi/setupunix/archive/main.tar.gz | tar zxf -

# ## Install Brew (works both on macos and linux)
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


## Run these two commands in your terminal to add Homebrew to your PATH:
#(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/gianni/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# Install dependencies for each OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get install build-essential
elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Nothing to do on Macos"
        # Mac OSX
fi

# Install everything!
brew tap jtyr/repo # needed for gbt
brew install gcc tmux stow direnv zsh gbt git tldr
brew install --cask visual-studio-code

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install golang
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm 1.20.1


# Install rust and packages built with rust
brew install rust
cargo install git-absorb

