PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="~/.composer/vendor/bin:$PATH"

prompt_git() {
    local s='';
    local branchName='';

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null;

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                #s+='+';
                s+=' Commit ';
            fi;

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                #s+='!';
                s+=' Unstaged ';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                #s+='?';
                s+=' New ';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                #s+='$';
                s+=' Stashed ';
            fi;

        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";

        if [ -n "${s}" ]; then 
            s=" {. ${s}.}";
            echo -e "\033[0;33m ${branchName}${s}\n";
        else
            s=" {.  Clean .}";
            echo -e "\033[0;37m ${branchName}${s}\n";
        fi;
    else
        echo -e "\033[0;37mﴨ Vanilla";
    fi;
}

PS1="\n\n\$(prompt_git)\n\033[0;35m\w -> \033[0m";
export PS1;

alias tls="tmux ls";
alias ta="tmux a -t";
alias tn="tmux new -s"
alias tk="tmux kill-server";
alias e="nvim";
alias gs="git status";
alias ga="git add";
alias gc="git commit -m";
alias gp='git push origin $(git branch | cut -c3-)';
alias gd="git diff";
alias gl="git log --oneline --graph";
alias r="source ~/.bash_profile";
alias l="ls -laGF";

if [ -f ~/.zap ]; then
    source ~/.zap
fi

export NVM_DIR="/Users/tstrathearn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
