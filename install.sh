#!/bin/bash
SCRIPT_BASE="$( cd -P "$( dirname "$0" )" && pwd )"
export PATH=${PATH}:${SCRIPT_BASE}/bin

#UBER hacky way to generate a star banner
STAR_LINE="`python -c 'import os;columns = os.popen("stty size", "r").read().split()[-1];print "*" * int(columns)'`"

function log_message
{
    echo """${STAR_LINE}

    $1

${STAR_LINE}"""
}

log_message """


  /\\/|      _       _   ______ _ _
 |/\\/      | |     | | |  ____(_) |
         __| | ___ | |_| |__   _| | ___  ___
        / _\` |/ _ \\| __|  __| | | |/ _ \\/ __|
       | (_| | (_) | |_| |    | | |  __/\\__ \\
        \\__,_|\\___/ \\__|_|    |_|_|\\___||___/

"""

if [[ ! -d ${SCRIPT_BASE}/.git ]]; then
    log_message "Not in git repo, cloning.."
    git clone https://github.com/erikzaadi/dotFiles --recursive
    ${SCRIPT_BASE}/dotFiles/install.sh
    exit $?
else
    log_message "Updating dotFiles repo and submodules.."
    GIT_CMD_WITH_PATHS="git --git-dir=${SCRIPT_BASE}/.git --work-tree=${SCRIPT_BASE}"
    ${GIT_CMD_WITH_PATHS} pull origin master
    ${GIT_CMD_WITH_PATHS} submodule update --init
fi

if [[ ! -f ~/.envvars.rc ]]; then
    echo "export DOTFILESDIR=${SCRIPT_BASE}" > ~/.envvars.rc
else
    if [[ ! $(cat ~/.envvars.rc | grep DOTFILESDIR) ]]; then
        echo "export DOTFILESDIR=${SCRIPT_BASE}" >> ~/.envvars.rc
    else
        sed -i ~/.envvars.rc -e "s/export\sDOTFILESDIR=.*$/export DOTFILESDIR=${SCRIPT_BASE}/"
    fi
fi

function symlink_for_pattern()
{
    PATTERN=$1
    ORIGIN=$2
    TARGET=$3
    for symlink in `${SCRIPT_BASE}/bin/g_or_native find ${ORIGIN} -name "*${PATTERN}"`; do
        TARGET_SYMLINK=$(basename ${symlink})
        TARGET_SYMLINK=$(echo ${TARGET_SYMLINK} | ${SCRIPT_BASE}/bin/g_or_native sed -e "s/${PATTERN}//g")
        ln -sf ${symlink} ~/.${TARGET_SYMLINK}
    done
}

log_message "Symlinking OS agnostic links.."

symlink_for_pattern ".symlink" ${SCRIPT_BASE} ~/
if [[ "$(uname)" = "Darwin" ]]; then
    log_message "Symlinking Mac links.."
    symlink_for_pattern ".symlink-mac" ${SCRIPT_BASE} ~/
    log_message "Brewing ALL THE THINGS.."
    if [[ ! $(which brew) ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    for tap in $(cat ${SCRIPT_BASE}/mac/tap);do
        brew tap ${tap}
    done
#    for keg in $(cat ${SCRIPT_BASE}/mac/brew);do
#        brew install ${keg}
#    done
#    for cask in $(cat ${SCRIPT_BASE}/mac/cask);do
#        brew cask install ${cask}
#    done
    log_message "Setting custom OS-X Settings.."
    bash ${SCRIPT_BASE}/mac/osx-settings
    log_message "Installing python packages.."
    pip install -r ${SCRIPT_BASE}/python/requirements.txt-mac
    log_message "Installing iTerm2 solarized colorschemes.."
    open ${SCRIPT_BASE}/deps/solarized/iterm2-colors-solarized/Solarized\ Dark.itermcolors
    open ${SCRIPT_BASE}/deps/solarized/iterm2-colors-solarized/Solarized\ Light.itermcolors
else
    log_message "Installing Antibody for zsh (FTW)"
    curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s
    log_message "Symlinking Ubuntu links.."
    symlink_for_pattern ".symlink-ubuntu" ${SCRIPT_BASE} ~/
    log_message "apt-get ALL THE THINGS.."
    sudo apt-get update
    sudo apt-get install -y $(cat ${SCRIPT_BASE}/ubuntu/apt)
    sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y
    log_message "Installing python packages.."
    sudo pip install -r ${SCRIPT_BASE}/python/requirements.txt-ubuntu
fi


log_message "Setting zsh (FTW) as shell.."
ZSH=$(which zsh)
chsh -s ${ZSH}
sudo chsh -s ${ZSH}

if [[ ! -f ~/.nvm/nvm.sh ]];then
    log_message "Installing nvm and node v${LATEST_STABLE_NODE}"
    git clone https://github.com/creationix/nvm.git ~/.nvm
    source ~/.nvm/nvm.sh
    nvm install node
    nvm use node
    nvm alias default node
fi

#if [[ ! -f ~/.rvm/scripts/rvm ]]; then
#    log_message "Installing rvm"
#    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
#    curl -sSL https://get.rvm.io | bash -s stable --ruby
#    source ~/.rvm/scripts/rvm
#fi

log_message "Installing node packages.."
npm i -g $(cat ${SCRIPT_BASE}/packages/node)

#log_message "Installing ruby gems.."
#gem install $(cat ${SCRIPT_BASE}/packages/ruby)

if [[ ! -f ~/.gvm/scripts/gvm ]]; then
    log_message "Installing GVM"
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    source ~/.gvm/scripts/gvm
    gvm install 1.4 -B
    gvm install 1.7 -B
    gvm install 1.8 -B
    gvm use 1.8 --default
fi

log_message "Installing Vim Packages.."
vim -c 'qa!'
vim -c ':GoInstallBinaries'

log_message "Done, great success!!1"
