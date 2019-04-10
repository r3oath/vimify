export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="~/.composer/vendor/bin:$PATH"
export PATH="$PATH:/Applications/DevDesktop/tools"
export PATH="$PATH:/Users/tristan/Src/Flutter/Framework/bin"
export PATH="$PATH:/Users/tristan/bin"
export PATH="$PATH:~/Library/Python/2.7/bin"

prompt_git() {
    local s='';
    local branchName='';
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then
            git update-index --really-refresh -q &>/dev/null;
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+='+';
            fi;
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!';
            fi;
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;
        fi;
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";
        if [ -n "${s}" ]; then
            s="(${s})";
            echo -e "🌶  ${branchName} ${s}";
        else
            echo -e "🌶  ${branchName}";
        fi;
    else
        echo -e "☁️";
    fi;
}

PS1="\n\n\[$(tput setaf 3)\]\$(prompt_git)\n\[$(tput setaf 7)\]\w -> \[$(tput sgr0)\]"
export PS1;

alias gs="git status";
alias ga="git add";
alias gc="git commit -m";
alias gpush="git push";
alias gpull='git pull';
alias gss='git stash save';
alias gd="git diff";
alias gl="git log --oneline --graph";
alias gtrack="git log --follow -p --stat --";
alias gco="git checkout";
alias gm="git merge";
alias gwipe="git checkout -- .; git clean -d -f";
alias gsync="git pull source develop --rebase";
alias r="source ~/.bash_profile";
alias l="ls -laGF";
alias ..="cd ..";
alias search="find . -type f -print0 | xargs -0 grep -l";
alias nr="npm run";
alias na="npm add";
alias nu="npm uninstall";

if [ -f ~/.zap ]; then
    source ~/.zap
fi

export NVM_DIR="/Users/tristan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tristan/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/tristan/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tristan/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/tristan/Downloads/google-cloud-sdk/completion.bash.inc'; fi
