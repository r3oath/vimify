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
                s+='+';
            fi;

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;

        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";

        [ -n "${s}" ] && s=" |> [${s}]";

        echo -e " |>  ${branchName}${s}";
    else
        return;
    fi;
}

PS1="\n\n=λ (\W)";
PS1+="\$(prompt_git \" on \") -> ";
export PS1;

alias tls="tmux ls";
alias ta="tmux a -t";
alias tn="tmux new -s"
alias e="nvim";
alias gs="git status";
alias ga="git add";
alias gc="git commit -m";

if [ -f ~/.zap ]; then
    source ~/.zap
fi

export NVM_DIR="/Users/tstrathearn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"
. /anaconda3/etc/profile.d/conda.sh
