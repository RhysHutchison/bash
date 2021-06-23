export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# --------------------------------------------------
# go
# --------------------------------------------------
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/dev
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/usr/local/lib/php/pear

# --------------------------------------------------
# Projects
# --------------------------------------------------
alias sites="cd $HOME/dev/src/github.com/deputyapp"
alias testapi="cd $HOME/dev/src/github.com/deputyapp/test-api"
alias packman="cd $HOME/dev/src/github.com/deputyapp/cx-packman"
alias servicesproxy="cd $HOME/dev/src/github.com/deputyapp/services-proxy"
alias scripts="cd $HOME/dev/src/github.com/deputyapp/customer-scripts"
alias payroll="cd $HOME/dev/src/github.com/deputyapp/deputy-payroll-export-scripts"
alias portal="cd $HOME/dev/src/github.com/deputyapp/portal"
alias devbox="cd $HOME/dev/src/github.com/deputyapp/devbox"
alias webapp="cd $HOME/dev/src/github.com/deputyapp/deputy-webapp"
alias webapplicationdirectory="cd $HOME/dev/src/github.com/deputyapp/web-application-directory"
alias websignup="cd $HOME/dev/src/github.com/deputyapp/web-signup"
alias gosvc="cd $HOME/dev/src/github.com/deputyapp/go-svc"
alias svcscripts="cd $HOME/dev/src/github.com/deputyapp/go-svc/cmd/svc-integrations/scripts"

# --------------------------------------------------
# Custom CLI Functions (Show Current Git Branch)
# --------------------------------------------------
[[ "$PWD" == $HOME ]] && devbox

function parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
PS1="$GREEN\u@machine$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "


# export PHPBREW_SET_PROMPT=1
# export PHPBREW_RC_ENABLE=1
# [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# # --------------------------------------------------
# # Okta Authentication + AWS CLI
# # --------------------------------------------------
# if [[ -f "$HOME/.okta/bash_functions" ]]; then
#     . "$HOME/.okta/bash_functions"
# fi
# if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
#     PATH="$HOME/.okta/bin:$PATH"
# fi

# alias okta="okta-aws aws_rhyshutchison sts get-caller-identity"
# alias assume-role="eval $(aws sts assume-role --role-arn arn:aws:iam::321171613860:role/engineering-cx-leads --role-session-name "aws_rhyshutchison" --profile aws_rhyshutchison | jq -r  '.Credentials | @sh "export AWS_SESSION_TOKEN=\(.SessionToken)\nexport AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey) "')"

# --------------------------------------------------
# General Functions
# --------------------------------------------------
alias edit="open ~/.bash_profile"
alias resetbluetooth="sudo rm -R /Library/Preferences/com.apple.Bluetooth.plist"
alias restartbluetooth="blueutil --power 0 && sleep 10 && blueutil --power 1"

# --------------------------------------------------
# Programs Shortcuts
# --------------------------------------------------
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias mergetool="/Applications/DiffMerge.app/Contents/MacOS/DiffMerge"

# --------------------------------------------------
# File Shortcuts
# --------------------------------------------------
alias cheater="cd ~/Documents && open deputyCheatSheet"
alias issues="cd ~/Documents && open functionIssues"

# --------------------------------------------------
# Testing Suits
# --------------------------------------------------
alias selenium="cd ~/Selenium && java -jar selenium-server-standalone-2.53.1.jar"
alias phpunit="vendor/bin/phpunit"

# --------------------------------------------------
# Networking
# --------------------------------------------------
alias hosts="open /etc/hosts"
alias localdns="networksetup -setdnsservers Wi-Fi 127.0.0.1 192.168.50.1"
alias defaultdns="networksetup -setdnsservers Wi-Fi 192.168.50.1"
alias prodtestdns="networksetup -setdnsservers Wi-Fi 192.168.50.1 && networksetup -setdnsservers 'Deputy VPN' 1.2.3.4"
alias checkdns="cat /etc/resolv.conf | grep -o \"[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\""

# --------------------------------------------------
# Bash Commands
# --------------------------------------------------
alias reload="source ~/.bash_profile"

# --------------------------------------------------
# Git Commands
# -------------------------------------------------
alias gf="git flow"
alias gp="git push --all && git push --tags"
alias gs="git status"
alias gb="git branch"
alias updatefeaturebranch="git checkout develop && git pull --all && git checkout - && git merge develop"
alias commit="git commit -am"
alias commitm="git commit -m"
alias gau="git add $(git ls-files -o —exclude-standard)"
alias nah="git reset --hard;git clean -df;"
alias git.pull="devbox && pwd && git checkout master && git pull --all && webapp && pwd && git checkout master && git pull --all && servicesproxy && pwd && git checkout develop && git pull --all && gosvc && pwd && git checkout master && git pull --all && webapplicationdirectory && pwd && git checkout master && git pull --all"
alias pushupstream="git push --set-upstream origin"
# --------------------------------------------------

alias compileserviceproxy="sh $HOME/dev/src/github.com/deputyapp/services-proxy/dispatch/includes/decaf/build.sh local business.dev.local.dpty.io"
#alias compileserviceproxy="sh $HOME/dev/src/github.com/deputyapp/services-proxy/dispatch/includes/decaf/build.sh pbcopy"
alias compileportal="php -q $HOME/dev/src/github.com/deputyapp/portal/convert.php decaf dexml.coffee > dexml.xml;"
alias updateportal="php update.php"
alias s3="cd ~/Library/Group\ Containers/G69SCX94XU.duck/Library/Application\ Support/duck/Volumes/AWS-S3"
alias uploadwidget="aws s3 cp $HOME/dev/src/github.com/deputyapp/portal/reseller-widget/dist/signup.js s3://deputy-www-assets/s3assets/ --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers"

# --------------------------------------------------
# Zip Project Files
# --------------------------------------------------
alias zipfileproxy="zip -r -X 'file-proxy-handler.zip' * "
alias zippgp="zip -r -X '/Users/rhyshutchison/Desktop/deputy-pgp.zip' *"
alias zipGoogle="rm /Users/`whoami`/Desktop/deputy-google.zip; cd /Users/`whoami`/dev/src/github.com/deputyapp/customer-scripts/lambda/google-api; zip -r /Users/`whoami`/Desktop/deputy-google.zip * -x *.md *.coffee; cd $HOME/dev/src/github.com/deputyapp/customer-scripts"
alias zipcontest="zip -r ../contest2017.zip *"
alias zipFTP="rm /Users/`whoami`/Desktop/deputy-sftp.zip; cd /Users/`whoami`/Sites/customer-scripts/lambda/sftp; zip -r /Users/`whoami`/Desktop/deputy-sftp.zip *; cd $HOME/dev/src/github.com/deputyapp/customer-scripts/lambda/sftp"
alias zipMcdonaldsStore="cd /Users/`whoami`/dev/src/github.com/deputyapp/cx-customer-services/mcdonalds/lambda/cx-mcdonalds-store; rm cx-mcdonalds-store.zip; zip -r -X cx-mcdonalds-store.zip *"
alias zipMcdonaldsInstance="cd /Users/`whoami`/dev/src/github.com/deputyapp/cx-customer-services/mcdonalds/lambda/cx-mcdonalds-instance; rm cx-mcdonalds-instance.zip; zip -r -X cx-mcdonalds-instance.zip *"
alias zipEsteePayroll="cd /Users/`whoami`/dev/src/github.com/deputyapp/cx-customer-services/estee-lauder/lambda/cx-estee-lauder-automated-payroll; rm cx-estee-lauder-automated-payroll.zip; zip -r -X cx-estee-lauder-automated-payroll.zip *"
alias uploadMcdonaldsStore="cd /Users/`whoami`/dev/src/github.com/deputyapp/cx-customer-services/mcdonalds/lambda/cx-mcdonalds-store && aws lambda update-function-code --function-name cx-mcdonalds-store --zip-file fileb://cx-mcdonalds-store.zip"
alias uploadMcdonaldsInstance="cd /Users/`whoami`/dev/src/github.com/deputyapp/cx-customer-services/mcdonalds/lambda/cx-mcdonalds-instance && aws lambda update-function-code --function-name cx-mcdonalds-instance --zip-file fileb://cx-mcdonalds-instance.zip"
alias uploadEsteePayroll="cd /Users/`whoami`/dev/src/github.com/deputyapp/cx-customer-services/estee-lauder/lambda/cx-estee-lauder-automated-payroll && aws lambda update-function-code --function-name cx-estee-lauder-automated-payroll --zip-file fileb://cx-estee-lauder-automated-payroll.zip"
# --------------------------------------------------
# Service-Proxy
# --------------------------------------------------
alias proxyerrors="open /opt/local/apache2/logs/error_log"
alias proxyaccess="open /opt/local/apache2/logs/access_log"
# --------------------------------------------------
# MySQL CLI Commands
# --------------------------------------------------
alias mysqllogin="mysql -u root -p"
# --------------------------------------------------
# MySQL CLI Commands
# --------------------------------------------------
alias sshcxec2="ssh -i ~/.ssh/id_rsa ec2-user@ec2-54-79-30-165.ap-southeast-2.compute.amazonaws.com"

# --------------------------------------------------
# Docker CLI Functions
# --------------------------------------------------
function docker_launch_devbox() {
	askYesNo "Start Devbox Docker Container?: " true
	if [[ "$ANSWER" = true ]]; then
		devbox && docker-compose pull && docker-compose up --build -d
	fi
}

function docker_launch_webapp() {
	askYesNo "Start Webapp Docker Container?: " true
	if [[ "$ANSWER" = true ]]; then
		webapp && docker-compose pull && make upbdi
	fi

	askYesNo "Update Webapp Composer?: " false
	if [[ "$ANSWER" = true ]]; then
		webapp && make install
	fi
}

function docker_launch_servicesproxy() {
	askYesNo "Start Services-Proxy Docker Container?: " false
	if [[ "$ANSWER" = true ]]; then
		servicesproxy && docker-compose up --build -d -i
	fi

	askYesNo "Update Services-Proxy Composer?: " false
	if [[ "$ANSWER" = true ]]; then
		docker exec services-proxy_service_proxy_1 php composer.phar install
	fi
}

function docker_launch_gosvc() {
	askYesNo "Start SVC Marketplace Docker Container?: " true
	if [[ "$ANSWER" = true ]]; then
		gosvc && make docker.pull && TARGET=svc-marketplace mk compose.upbd
	fi
	askYesNo "Start SVC Integrations Docker Container?: " true
	if [[ "$ANSWER" = true ]]; then
		gosvc && TARGET=svc-integrations AUTH_ENABLED=true mk compose.upbd
	fi
	askYesNo "Start OpenAPI Docker Container?: " false
	if [[ "$ANSWER" = true ]]; then
		gosvc && mk openapi.up
	fi
}

function docker_launch_websignup() {
	askYesNo "Start Web Signup Docker Container?: " false
	if [[ "$ANSWER" = true ]]; then
		 websignup && docker-compose up -d
	fi
}

function docker_launch_webapplicationdirectory() {
	askYesNo "Start Web Application Directory Docker Container?: " false
	if [[ "$ANSWER" = true ]]; then
		webapplicationdirectory && docker-compose up -d
	fi
}

function docker_launcher_openapi() {
	askYesNo "Start OpenAPI Docker Container?: " false
	if [[ "$ANSWER" = true ]]; then
		gosvc && mk openapi.up
	fi
}

function askYesNo {
    QUESTION=$1
    DEFAULT=$2
    if [ "$DEFAULT" = true ]; then
            OPTIONS="[Y/n]"
            DEFAULT="Y"
        else
            OPTIONS="[y/N]"
            DEFAULT="N"
    fi
    read -p "$QUESTION $OPTIONS " -n 1 -s -r INPUT
    INPUT=${INPUT:-${DEFAULT}}
    echo ${INPUT}
    if [[ "$INPUT" =~ ^[yY]$ ]]; then
        ANSWER=true
    else
        ANSWER=false
    fi
}

# --------------------------------------------------
# Docker CLI Commands
# --------------------------------------------------
alias docker.login="echo $(AWS_PROFILE=dpty aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.us-west-2.amazonaws.com)"
alias docker.bash.webapp="webapp && docker-compose -f docker-compose.yml exec deputy bash"
alias docker.bash.seed="webapp && make seed"
alias docker.bash.seed.trial="webapp && make seed.trial"
alias docker.bash.test="webapp && docker-compose -f docker-compose.yml exec deputy bin/composer.phar test:database"
alias docker.network="docker network create deputy"
alias datadog.down="cd ~/dev/src/github.com/deputyapp/devbox && make datadog.down && cd -"

alias docker.openapi.build="gosvc && TARGET=svc-integrations scripts/mk compose.up.build"

alias docker.aws.make="devbox && make aws"
alias docker.marketplace.up="docker.aws.make && gosvc && TARGET=svc-marketplace mk aws.migrate.up"
alias docker.marketplace.down="gosvc && TARGET=svc-marketplace mk aws.migrate.down"
alias docker.integrations.up="docker.aws.make && gosvc && TARGET=svc-integrations mk aws.migrate.up"
alias docker.integrations.down="gosvc && TARGET=svc-integrations mk aws.migrate.down"

alias docker.up="devbox && docker.containers.prune && docker image prune --filter 'until=24h' && docker.up.devbox && docker.up.webapp && docker.up.servicesproxy && docker.up.gosvc && docker.up.websignup && docker.up.webapplicationdirectory"
alias docker.up.devbox="devbox && docker.login && docker_launch_devbox"
alias docker.up.webapp="webapp && docker_launch_webapp"
alias docker.up.servicesproxy="servicesproxy && docker_launch_servicesproxy"
alias docker.up.gosvc="gosvc && docker_launch_gosvc"
alias docker.up.websignup="websignup && docker_launch_websignup"
alias docker.up.webapplicationdirectory="webapplicationdirectory && docker_launch_webapplicationdirectory"
alias docker.up.testapp="svcscripts && INSTANCE=\"https://business.dev.local.dpty.io\" TOKEN=\"849799dafb9744b099ba66be96ce7db4\" go run testapp.go"

alias docker.down="docker.down.devbox && docker.down.webapp && docker.down.servicesproxy && docker.down.marketplace && docker.down.integrations && docker.down.web-application-directory"
alias docker.down.devbox="devbox && docker-compose down"
alias docker.down.webapp="webapp && docker-compose down"
alias docker.down.marketplace="gosvc && TARGET=svc-marketplace docker-compose down"
alias docker.down.integrations="gosvc && TARGET=svc-integrations docker-compose down"
alias docker.down.servicesproxy="servicesproxy && docker-compose down"
alias docker.down.web-signup="websignup && docker-compose down"
alias docker.down.web-application-directory="webapplicationdirectory && docker-compose down"

alias docker.stop="docker stop \$(docker ps -a -q)"
alias docker.containers="docker ps --format '{{.ID}} {{.Names}}'"
alias docker.containers.prune="docker container prune"

# --------------------------------------------------
# Docker Logging
# --------------------------------------------------
alias docker.logs.webapp="tail -f $HOME/dev/src/github.com/deputyapp/deputy-webapp/_docker/logs/php/php.log"
alias docker.logs.servicesproxy="tail -f $HOME/dev/src/github.com/deputyapp/services-proxy/_docker/logs/php/php.log"
alias docker.errors.servicesproxy="tail -f $HOME/dev/src/github.com/deputyapp/services-proxy/_docker/logs/httpd/error_log"
alias docker.aws.listtables="aws dynamodb list-tables --debug  --endpoint-url http://aws.local.dpty.io:4566"

# --------------------------------------------------
eval "$(direnv hook bash)"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
