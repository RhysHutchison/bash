# include homebrew PHP, global composer into $PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:/usr/local/bin:/usr/local/mysql/bin:~/.composer/vendor/bin:$PATH"
export EDITOR="subl -w"

# Programs Shortcuts
# --------------------------------------------------------------------------
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias mergetool="/Applications/DiffMerge.app/Contents/MacOS/DiffMerge"
# --------------------------------------------------------------------------

# File Shortcuts
# --------------------------------------------------------------------------
alias cheater="cd ~/Documents && open deputyCheatSheet"
alias issues="cd ~/Documents && open functionIssues"
# --------------------------------------------------------------------------

# Testing Suits
# --------------------------------------------------------------------------
alias selenium="cd ~/Selenium && java -jar selenium-server-standalone-2.53.1.jar"
alias phpunit="vendor/bin/phpunit"
# --------------------------------------------------------------------------

# Networking 
# --------------------------------------------------------------------------
alias hosts="open /etc/hosts"
# --------------------------------------------------------------------------

# Bash Commands
# --------------------------------------------------
alias reload="source ~/.bash_profile && clear && echo Bash Profile Reloaded/Cleared......."
# --------------------------------------------------

# Projects
# -------------------------------------------------
alias edit="open ~/.bash_profile"
alias sites="cd ~/Sites"
alias services="cd ~/Sites/services-proxy"
alias scripts="cd ~/Sites/customer-scripts"
alias payroll="cd ~/Sites/deputy-payroll-export-scripts"
alias portal="cd ~/Sites/portal"

# --------------------------------------------------

# Git Commands 
# ------------------------------------------------- 
alias gf="git flow"
alias gp="git push --all && git push --tags"
alias gs="git status"
alias gb="git branch"
alias commit="git commit -am"
alias commitm="git commit -m" 
alias nah="git reset --hard;git clean -df;"
# --------------------------------------------------

alias compile="sh ~/Sites/services-proxy/dispatch/includes/decaf/build.sh sql maximus"

alias refresh="ENVIRONMENT=development php artisan migrate:refresh && ENVIRONMENT=development php artisan db:seed"

# Brew
# -------------------------------------------------------
alias restartdb="brew services restart mariadb"
