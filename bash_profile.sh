#!/usr/bin/env bash
export PATH="/opt/local/apache2/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/mysql57/bin:/usr/local/sbin:/Applications/DiffMerge.app/Contents/MacOS:$PATH"
export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/"

# git - show the repo version at the prompt
function parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@machine$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "


alias edit="open ~/.bash_profile"

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
alias zipcontest="zip -r ../contest2017.zip *"
# --------------------------------------------------
# Projects
# -------------------------------------------------
alias sites="cd ~/Sites"
alias servicesproxy="cd ~/Sites/services-proxy"
alias scripts="cd ~/Sites/customer-scripts"
alias payroll="cd ~/Sites/deputy-payroll-export-scripts"
alias portal="cd ~/Sites/portal"
alias zuora="cd ~/Sites/zuora-bad-debt"
alias widget="cd ~/Sites/portal/reseller-widget"
alias stitch="cd ~/Sites/tap-deputy"
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
alias pushupstream="git push --set-upstream origin"
alias au="git add \$(git ls-files -o --exclude-standard)"
# --------------------------------------------------
alias compileserviceproxy="sh ~/Sites/services-proxy/dispatch/includes/decaf/build.sh sql maximus"
alias compileportal="php -q ~/deputec/bin/utility/convert.php decaf dexml.coffee > dexml.xml; grunt; php update.php"
alias updateportal="php update.php"
alias s3="cd ~/Library/Group\ Containers/G69SCX94XU.duck/Library/Application\ Support/duck/Volumes/AWS-S3"
alias uploadwidget="aws s3 cp ~/Sites/portal/reseller-widget/dist/signup.js s3://deputy-www-assets/s3assets/ --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers"

# --------------------------------------------------
# Service-Proxy
# -------------------------------------------------
alias proxyerrors="open /opt/local/apache2/logs/error_log"
alias proxyaccess="open /opt/local/apache2/logs/access_log"

# --------------------------------------------------
# Stitch Data CLI Commands
# -------------------------------------------------
alias targetstitch="python3 tap-deputy.py -s state.json -c config.json | target-stitch -c config.json"
alias tapdeputy="python3 tap-deputy.py -s state.json -c config.json"

# --------------------------------------------------
# Apache2.4 Commands
# -------------------------------------------------
alias apachevhosts="open /opt/local/apache2/conf/extra/httpd-vhosts.conf"
alias apachessl="open /opt/local/apache2/conf/extra/httpd-ssl.conf"
alias apacheconf="open /opt/local/apache2/conf/httpd.conf"
alias apacherestart="sudo /opt/local/apache2/bin/apachectl -k graceful && echo ...Apache2 Gracefully Restarted..."
alias apachestart="sudo /opt/local/apache2/bin/apachectl -k start && echo ...Apache2 Started..."
alias apachestop="sudo /opt/local/apache2/bin/apachectl -k stop && echo ...Apache2 Stopped..."

# --------------------------------------------------
# MySQL CLI Commands
# -------------------------------------------------
alias mysqllogin="mysql -u root -p"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"