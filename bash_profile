# Bash Commands
# --------------------------------------------------
alias edit="nano ~/.bash_profile"
alias reload=". ~/.bash_profile && .clear"

# Projects
# -------------------------------------------------
alias code="cd ~/Code"
alias progression="cd ~/Code/Progression"

# Git Commands 
# ------------------------------------------------- 
alias gf="git flow"
alias gpush="git push --all && git push --tags && git checkout develop"
alias gs="git status"
alias gb="git branch"
alias commit="git commit -am"
alias commitm="git commit -m" 
alias nah="git reset --hard;git clean -df;"

# include homebrew PHP, global composer into $PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:/usr/local/sbin:~/.composer/vendor/bin:$PATH"

# Laravel
# -------------------------------------------------------
alias arty="php artisan"
alias envd="ENVIRONMENT=development"
alias refresh="ENVIRONMENT=development php artisan migrate:refresh && ENVIRONMENT=development php artisan db:seed"

# Brew
# -------------------------------------------------------
alias restartdb="brew services restart mariadb"
