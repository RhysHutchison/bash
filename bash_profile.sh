export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# --------------------------------------------------
# GO
# --------------------------------------------------
export GOROOT=/usr/local/go
export GOPATH=$HOME/dev
export PATH=$PATH:$GOROOT:$GOPATH/bin:/usr/local/lib/php/pear

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
alias websignup="cd $HOME/dev/src/github.com/deputyapp/web-signup"
alias gosvc="cd $HOME/dev/src/github.com/deputyapp/go-svc"
alias svcscripts="cd $HOME/dev/src/github.com/deputyapp/go-svc/cmd/svc-integrations/scripts"
alias opsinfra="cd $HOME/dev/src/github.com/deputyapp/ops-infrastructure/bin"
alias opsmetrics="cd $HOME/dev/src/github.com/deputyapp/ops-infrastructure/terraform/projects/platform/ecs-services/svc-metrics/es_lambda"
alias e2etests="cd $HOME/dev/src/github.com/deputyapp/test-e2e"

# --------------------------------------------------
# Custom CLI Functions (Show Current Git Branch)
# --------------------------------------------------
#[[ "$PWD" == $HOME ]] && devbox

function parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
PS1="$GREEN\u@machine$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

# alias okta="okta-aws aws_rhyshutchison sts get-caller-identity"
# alias assume-role="eval $(aws sts assume-role --role-arn arn:aws:iam::321171613860:role/engineering-cx-leads --role-session-name "aws_rhyshutchison" --profile aws_rhyshutchison | jq -r  '.Credentials | @sh "export AWS_SESSION_TOKEN=\(.SessionToken)\nexport AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey) "')"

# --------------------------------------------------
# General Functions
# --------------------------------------------------
alias edit="open $HOME/.bash_profile"
alias resetbluetooth="sudo rm -R /Library/Preferences/com.apple.Bluetooth.plist"
alias restartbluetooth="blueutil --power 0 && sleep 10 && blueutil --power 1"

# --------------------------------------------------
# Programs Shortcuts
# --------------------------------------------------
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias mergetool="/Applications/DiffMerge.app/Contents/MacOS/DiffMerge"
# --------------------------------------------------


# --------------------------------------------------
# Testing Suites
# --------------------------------------------------
alias selenium="cd ~/Selenium && java -jar selenium-server-standalone-2.53.1.jar"
alias phpunit="vendor/bin/phpunit"
alias docker.test.e2e.premium="e2etests && make test PROJECT=csvBulk"
alias docker.test.e2e.premium.debug="e2etests && make debug PROJECT=csvBulk"
alias docker.test.e2e.enterprise="e2etests && nvm use v14.21.2 && make test PROJECT=csvBulkEnterprise"
alias docker.test.e2e.enterprise.debug="e2etests && nvm use v14.21.2 && make debug PROJECT=csvBulkEnterprise"
alias docker.test.e2e.report="npx playwright show-report"
alias docker.test.integrations="gosvc && mk test.target TARGET=svc-integrations"
alias docker.test.integrations.e2e="gosvc && mk e2e-tests TARGET=svc-integrations"

# --------------------------------------------------
# Networking
# --------------------------------------------------
alias hosts="open /etc/hosts"
alias localdns="networksetup -setdnsservers Wi-Fi 127.0.0.1"
alias alfiedns="networksetup -setdnsservers Wi-Fi 127.0.0.1 192.168.50.1"
alias defaultdns="networksetup -setdnsservers Wi-Fi 192.168.50.1"
alias prodtestdns="networksetup -setdnsservers Wi-Fi 192.168.50.1 && networksetup -setdnsservers 'Deputy VPN' 1.2.3.4"
alias checkdns="cat /etc/resolv.conf | egrep -o 'nameserver [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk -F ' ' '{print \$2}'"

# --------------------------------------------------
# Bash Commands
# --------------------------------------------------
alias r="source ~/.bash_profile"

# --------------------------------------------------
# Git Commands
# -------------------------------------------------
alias gf="git flow"
alias gp="git push --all && git push --tags"
alias gs="git status"
alias gb="git branch"
alias git.branch.clean='git fetch -p && git branch -vv | awk "/: gone]/{print \$1}" | xargs git branch -D'
alias git.revert.last="git reset --soft HEAD~1"
alias updatefeaturebranch="git checkout develop && git pull --all && git checkout - && git merge develop"
alias commit="git commit -am"
alias commitm="git commit -m"
alias gau="git add $(git ls-files -o —exclude-standard)"
alias nah="git reset --hard;git clean -df;"
alias git.pull="devbox && pwd && git checkout main && git pull --all && webapp && pwd && git checkout main && git pull --all && servicesproxy && pwd && git checkout main && git pull --all && gosvc && pwd && git checkout main && git pull --all && pwd && git checkout main && git pull --all && payroll && pwd && git checkout main && git pull --all"
alias pushupstream="git push --set-upstream origin"
# --------------------------------------------------

#alias compileserviceproxy="sh $HOME/dev/src/github.com/deputyapp/services-proxy/dispatch/includes/decaf/build.sh deputec_dispatch_helper \"Deputy Integrations Helper Script\" 1 business.dev.local.dpty.io 849799dafb9744b099ba66be96ce7db4"
alias compileserviceproxy="sh $HOME/dev/src/github.com/deputyapp/services-proxy/dispatch/includes/decaf/build.sh pbcopy"
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
alias zipSquareSandboxSeeder="rm $HOME/Desktop/square-sandbox-seeder.zip; cd $HOME/dev/src/github.com/deputyapp/square-sandbox-sales-generator/; zip -r $HOME/Desktop/square-sandbox-seeder.zip *"
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
alias sshcxec2="ssh -v -i ~/.ssh/mcdonalds_private_rsa ec2-user@ec2-54-79-30-165.ap-southeast-2.compute.amazonaws.com"
alias ssh.ELC.US="ssh -v -i ~/.ssh/privkey.gpg deputy4elc@securemft-us-gm.elcompanies.com"

# --------------------------------------------------
# Docker CLI Functions
# --------------------------------------------------
function docker_launch_devbox() {
	askYesNo "Start Devbox Docker Container?: " true
	if [[ "$ANSWER" = true ]]; then
		echo "hello world"
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

#"git log --oneline --merges --first-parent 25b5113573bd26c8e40a38d827b8409a412de8c5..ec4bbe77cbcdaa813377f14e1a1698bc1f66f7bc --pretty='format:%h %d %s (%an)' | grep -i 'ints-'"
alias git.extract="get_sha_extracts"

function get_sha_extracts() {
	DEFAULT="ints-"

	read -p "Enter your key to extract [$DEFAULT]:" -r KEY
	KEY=${KEY:-${DEFAULT}}
	read -p "What's the previous SHA? " -r SHA1
	read -p "What's the latest SHA? " -r SHA2

	# OUTPUT="git log --oneline --merges --first-parent ${SHA1}..${SHA2} --pretty='format:%h %d %s (%an)' | grep -i '${KEY}'"
	git log --oneline --merges --first-parent ${SHA1}..${SHA2} --pretty="format:%h %d %s (%an)" | grep -i "${KEY}"
}

# --------------------------------------------------
# Docker CLI Commands
# --------------------------------------------------
alias docker.restart="pkill -f docker && open /Applications/Docker.app"
alias docker.stop="docker stop \$(docker ps --format '{{.Names}}' -a -q)"
alias docker.network="docker network create deputy"
alias docker.pull="webapp && make pull"
alias docker.info="docker system df"
alias docker.nuke="docker system prune -a -f --volumes"
alias docker.info.containers="docker ps --format '{{.ID}} {{.Names}}'"
alias docker.prune.images="docker image prune --filter 'until=24h'"
alias docker.prune.volumes="docker system prune -a --volumes"
alias docker.prune.containers="docker container prune"

alias docker.down="docker.down.devbox && docker.down.webapp && docker.down.servicesproxy && docker.down.marketplace && docker.down.integrations && docker.down.backstage && docker.down.dir"
# --------------------------------------------------

# --------#
# GO-SVC  #
# --------#
alias docker.down.svc="gosvc && docker.down.integrations && docker.down.dir && docker.down.backstage && docker.down.marketplace"
alias docker.jwt.dir="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_DIR_V1 --payload_user_id ef172da5-a546-43d8-8eb4-580a821039e9 --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf -d 24h"
alias docker.jwt.query="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_QUERY_V1 --oidc --svc-connect-endpoint https://api.usw2.test.dpty.io --payload_user_id ef172da5-a546-43d8-8eb4-580a821039e9 --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf -d 72h"
alias docker.jwt.metrics="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_METRICS_V1 --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf -d 24h"
alias docker.jwt.payrate="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_PAYRATE_V1 -d 24h"
alias docker.jwt.award="gosvc && SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --aud SVC_AWARD_V1 --sub DEPUTY --duration 24h"
alias docker.jwt.test="gosvc && SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_QUERY_V1 --oidc --svc-connect-endpoint https://api.usw2.test.dpty.io --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf --payload_business_user_id ef172da5-a546-43d8-8eb4-580a821039e9 -d 10072h"
# --------------------------------------------------

# --------------------#
# GO-SVC Integrations #
# --------------------#
alias docker.up.integrations="gosvc && TARGET=svc-integrations APP_BACKGROUND_WORKER_ENABLED=1 APP_REST_DEBUG=false AUTH_ENABLED=true mk compose.up.build"
alias docker.up.integrations.debug="gosvc && TARGET=svc-integrations APP_BACKGROUND_WORKER_ENABLED=1 APP_REST_DEBUG=true AUTH_ENABLED=true mk compose.up.build"
alias docker.down.integrations="gosvc && TARGET=svc-integrations docker-compose down"
alias docker.up.integrations.aws="docker.aws.make && gosvc && TARGET=svc-integrations mk aws.migrate.up"
alias docker.down.integrations.aws="gosvc && TARGET=svc-integrations mk aws.migrate.down"
alias docker.reset.integrations.aws="docker.down.integrations.aws && docker.up.integrations.aws"
alias docker.up.integrations.openapi="gosvc && TARGET=svc-integrations scripts/mk compose.up.build"
# --------------------------------------------------

# -------------------#
# GO-SVC Connect #
# -------------------#
alias docker.up.connect="gosvc && TARGET=svc-connect mk compose.up.build"
alias docker.up.connect.aws="docker.aws.make && gosvc && TARGET=svc-connect mk aws.migrate.up"
alias docker.down.connect.aws="gosvc && TARGET=svc-connect mk aws.migrate.down"
alias docker.reset.connect.aws="docker.down.connect.aws && docker.up.connect.aws"

# -------------------#
# GO-SVC Marketplace #
# -------------------#
alias docker.up.marketplace="gosvc && TARGET=svc-marketplace mk compose.up.build"
alias docker.down.marketplace="gosvc && TARGET=svc-marketplace docker-compose down"
alias docker.up.marketplace.aws="docker.aws.make && gosvc && TARGET=svc-marketplace mk aws.migrate.up"
alias docker.down.marketplace.aws="gosvc && TARGET=svc-marketplace mk aws.migrate.down"
alias docker.reset.marketplace.aws="docker.down.marketplace.aws && docker.up.marketplace.aws"
# --------------------------------------------------

# -----------------#
# GO-SVC Directory #
# -----------------#
alias docker.up.dir="gosvc && TARGET=svc-dir mk compose.up.build"
alias docker.down.dir="gosvc && TARGET=svc-dir docker-compose down"
alias docker.up.dir.tenant="curl --location --request POST 'http://api.local.dpty.io/sys/dir/v1/tenants' --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhcGkuZGVwdXR5LmNvbS9zeXMvZGlyL3YxIiwiZHAuYmlkIjoiZWI2NmE1MzktMmFiYS00OTM1LWEyNTAtNzUzZmU1ZTllNmJmIiwiZHAudWlkIjoiZWYxNzJkYTUtYTU0Ni00M2Q4LThlYjQtNTgwYTgyMTAzOWU5IiwiZXhwIjoxNjMxMjI4Mzc5LCJpYXQiOjE2MzExNDE5NzksImlzcyI6ImRlcHV0eS5jb20iLCJqdGkiOiIxeHNSbnNPRTRPTW5RSFREN0FpUHJDV3RLVDUiLCJuYmYiOjE2MzExNDE5NzksInN1YiI6ImRlcHV0eS5jb20ifQ.ordh9SPuLy2_h7ggw8ujBUZHldrWEusah4lxcTnFLdQ' --header 'Content-Type: application/json' --data-raw '{\"data\": {    \"id\":\"eb66a539-2aba-4935-a250-753fe5e9e6bf\",\"hostname\":\"business.dev.local.dpty.io\",\"countryId\":13,\"countryCode\":\"AU\",\"dbHost\":\"testdb.deputec.com\",\"dbName\":\"deputec_b1234\",\"additionalHostname\":\"business.dev.local.dpty.io\",\"createdAt\":\"2019-11-28T03:57:20Z\",\"redisTenantCluster\":\"redis-tenant.local.deputec.com:17000\",\"creator\":\"rimba\",\"channel\":\"DIRECT\",\"region\":\"apse2\",\"portfolioName\":\"ladida\",\"edition\":9}}'"

alias docker.up.dir.aws="docker.aws.make && gosvc && TARGET=svc-dir mk aws.migrate.up"
alias docker.down.dir.aws="gosvc && TARGET=svc-dir mk aws.migrate.down"
alias docker.reset.dir.aws="docker.down.dir.aws && docker.up.dir.aws"
# --------------------------------------------------

# -----------------#
# GO-SVC URL #
# -----------------#
alias docker.up.url="gosvc && TARGET=svc-url AUTH_ENABLED=1 mk compose.up.build"
alias docker.down.url="gosvc && docker stop svc-url_app_1"
alias docker.up.url.aws="gosvc && TARGET=svc-url mk mysql.migrate"
alias docker.down.url.aws="gosvc && TARGET=svc-url mk aws.migrate.down"
alias docker.reset.url.aws="docker.down.url.aws && docker.up.url.aws"

# -----------------#
# GO-SVC NOTIFICATION #
# -----------------#
alias docker.up.notification="gosvc && TARGET=svc-notification NOTIFICATION_SERVICE_MODE=dev mk compose.up.build"
alias docker.up.notification.aws="gosvc && TARGET=svc-notification mk aws.migrate.up"
alias docker.down.notification.aws="gosvc && TARGET=svc-notification mk aws.migrate.down"
alias docker.reset.notification.aws="docker.down.notification.aws && docker.up.notification.aws"

# ------------#
# GO-SVC HIRE #
# ------------#
alias docker.up.hire="gosvc && TARGET=svc-hire mk compose.up.build"
alias docker.up.hire.aws="gosvc && TARGET=svc-hire mk aws.migrate.up"
alias docker.down.hire.aws="gosvc && TARGET=svc-hire mk aws.migrate.down"
alias docker.reset.hire.aws="docker.down.hire.aws && docker.up.hire.aws"

# -------------#
# GO-SVC QUERY #
# -------------#
alias docker.up.query="gosvc && TARGET=svc-query APP_DEV_CONFIG_CLASSIC_MODE=false SECRETS_MYSQL_USERNAME=root SECRETS_MYSQL_PASSWORD=magic mk compose.up.build"
alias docker.up.query.ngrok="ngrok http 8888"

# -------------#
# GO-SVC HELLO #
# -------------#
alias docker.up.hello="gosvc && TARGET=svc-hello APP_BACKGROUND_WORKER_ENABLED=1 mk compose.up.build"
alias docker.down.hello="gosvc && docker stop svc-hello_app_1"
# --------------------------------------------------

# -------------#
# GO-SVC LEAVE #
# -------------#
alias docker.up.leave="gosvc && TARGET=svc-leave mk compose.up.build"
alias docker.up.leave.aws="docker.aws.make && gosvc && TARGET=svc-leave mk aws.migrate.up"

# --------------#
# GO-SVC AWARDS #
# --------------#
alias docker.reset.award.aws="gosvc && docker.down.award.aws && docker.up.award.aws"
alias docker.up.award="gosvc && TARGET=svc-award AUTH_ENABLED=true mk compose.up.build"
alias docker.up.award.aws="docker.aws.make && gosvc && TARGET=svc-award mk aws.migrate.up"
alias docker.down.award="gosvc && TARGET=svc-award docker-compose down"
alias docker.down.award.aws="gosvc && TARGET=svc-award mk aws.migrate.down"
# --------------------------------------------------

# ---------------#
# GO-SVC METRICS #
# ---------------#
alias docker.reset.metrics.aws="gosvc && docker.down.metrics.aws && docker.up.metrics.aws"
alias docker.reset.metrics.seed="gosvc && docker.down.metrics.aws && docker.up.metrics.aws && docker.up.metrics.seed"
alias docker.up.metrics="gosvc && TARGET=svc-metrics mk compose.up.build"
alias docker.up.metrics.lambda="opsmetrics && make lambda.build && make lambda.create"
alias docker.up.metrics.aws="gosvc && TARGET=svc-metrics mk aws.migrate.up"
alias docker.up.metrics.seed="docker.aws.make && gosvc && TARGET=svc-metrics mk aws.seed"
alias docker.down.metrics="gosvc && TARGET=svc-metrics docker-compose down"
alias docker.down.metrics.aws="gosvc && TARGET=svc-metrics mk aws.migrate.down"
alias docker.down.metrics.lambda="opsmetrics && make lambda.delete"
# --------------------------------------------------

# ---------------#
# GO-SVC PAYRATE #
# ---------------#
alias docker.reset.payrate.aws="gosvc && docker.down.payrate.aws && docker.up.payrate.aws"
alias docker.up.payrate="gosvc && TARGET=svc-payrate mk compose.up.build"
alias docker.up.payrate.aws="gosvc && TARGET=svc-payrate mk aws.migrate.up"
alias docker.up.payrate.openapi="gosvc && TARGET=svc-payrate scripts/mk compose.up.build"
alias docker.up.payrate.seed="docker.up.payrate.seed.flsa && docker.up.payrate.seed.fww"
alias docker.up.payrate.seed.flsa="gosvc && go run cmd/svc-payrate/dev/seed/main.go flsa"
alias docker.up.payrate.seed.fwwnyc="gosvc && go run cmd/svc-payrate/dev/seed/main.go fww-nyc"
alias docker.up.payrate.seed.fwwla="gosvc && go run cmd/svc-payrate/dev/seed/main.go fww-la"
alias docker.up.payrate.seed.fwwseattle="gosvc && go run cmd/svc-payrate/dev/seed/main.go fww-seattle"
alias docker.up.payrate.seed.ctsf="gosvc && go run cmd/svc-payrate/dev/seed/main.go ctsf"
alias docker.down.payrate="gosvc && TARGET=svc-payrate docker-composer down"
alias docker.down.payrate.aws="gosvc && TARGET=svc-payrate mk aws.migrate.down"

# ------------------#
# GO-SVC SHIFTEVENT #
# ------------------#
alias docker.reset.shiftevent.aws="gosvc && docker.down.shiftevent.aws && docker.up.shiftevent.aws"
alias docker.up.shiftevent="gosvc && TARGET=svc-shiftevent AUTH_ENABLED=1 mk compose.up.build"
alias docker.up.shiftevent.seed="gosvc && TARGET=svc-shiftevent mk aws.seed"
alias docker.down.shiftevent="gosvc && TARGET=svc-shiftevent docker-composer down"
alias docker.up.shiftevent.aws="TARGET=svc-shiftevent mk aws.migrate.up"
alias docker.down.shiftevent.aws="TARGET=svc-shiftevent mk aws.migrate.down"

# ------------------#
# GO-SVC COMPLIANCE #
# ------------------#
alias docker.reset.compliance.aws="gosvc && docker.down.compliance.aws && docker.up.compliance.aws"
alias docker.up.compliance="gosvc && TARGET=svc-compliance AUTH_ENABLED=1 mk compose.up.build"
alias docker.up.compliance.aws="gosvc && TARGET=svc-compliance mk aws.migrate.up"
alias docker.down.compliance="TARGET=svc-compliance docker-composer down"
alias docker.down.compliance.aws="TARGET=svc-compliance mk aws.migrate.down"

# ------------------#
# AWS Migrate Calls #
# ------------------#
alias docker.reset.aws="gosvc && docker.reset.dir.aws && docker.reset.integrations.aws && docker.reset.connect.aws && docker.reset.notification.aws"
alias docker.up.aws="gosvc && docker.up.dir.aws && docker.up.integrations.aws && docker.up.connect.aws && docker.up.dir.tenant && docker.up.notification.aws"
alias docker.down.aws="gosvc && docker.down.dir.aws && docker.down.integrations.aws && docker.down.connect.aws && docker.down.notification.aws && docker.down.metrics.aws"

# -------#
# Devbox #
# -------#
alias docker.reset.devbox="devbox && make stop && make clean && rm -rf $HOME/dev/src/github.com/deputyapp/devbox/data/localstack"
alias docker.aws.make="devbox && make aws"
alias docker.up.devbox="devbox && docker-compose pull && make upb"
alias docker.down.devbox="devbox && docker-compose down"
alias docker.down.datadog="devbox && make datadog.down && cd -"
# --------------------------------------------------

# -------#
# Webapp #
# -------#
alias docker.update.vault="webapp && make vault.pull"
alias docker.reset.nodemodules="sudo rm -rf frontend/vue/node_modules frontend/classic/node_modules frontend/vnext/node_modules node_modules"
#alias docker.up.webapp="docker-compose build --pull --no-cache && docker-compose -f docker-compose.yml -f docker-compose.integrations.yml up"
alias docker.up.webapp="make upb"
alias docker.down.webapp="webapp && docker-compose down"
alias docker.update.webapp.backend="webapp && make install.backend"
alias docker.update.webapp.frontend="webapp && make fe.install"
alias docker.bash.seed="webapp && make seed"
alias docker.bash.seed.trial="webapp && make seed.trial"
alias docker.bash.seed.enterprise="webapp && make seed.enterprise"
alias docker.bash.test="webapp && docker-compose -f docker-compose.yml exec deputy bin/composer.phar test:database"
alias docker.bash.webapp="webapp && docker-compose -f docker-compose.yml exec deputy bash"
# --------------------------------------------------

# ---------------#
# Services-Proxy #
# ---------------#
alias docker.up.servicesproxy="servicesproxy && docker-compose -f docker-compose.yml -f docker-compose.integrations.yml up --build"
alias docker.down.servicesproxy="servicesproxy && docker-compose down"
alias docker.update.servicesproxy="docker exec services-proxy_service_proxy_1 php composer.phar install"
# --------------------------------------------------

# -----------#
# Web Signup #
# -----------#
alias docker.up.websignup="websignup && docker-compose up -d"
alias docker.down.websignup="websignup && docker-compose down"
# --------------------------------------------------

# -----------------#
# Test Application #
# -----------------#
alias docker.up.testapp="svcscripts && INSTANCE=\"https://business.dev.local.dpty.io\" TOKEN=\"849799dafb9744b099ba66be96ce7db4\" go run testapp.go"
# --------------------------------------------------

# ---------#
# OKTA 2FA #
# ---------#
alias docker.sso='AWS_PROFILE=okta-sso aws sso login'
alias docker.login.integrations="AWS_PROFILE=okta-prod-integration aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.us-west-2.amazonaws.com"
alias docker.login="AWS_PROFILE=okta-mgt-basic aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.us-west-2.amazonaws.com"
alias docker.login.cx="AWS_PROFILE=okta-cx-rw aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.us-west-2.amazonaws.com"
# --------------------------------------------------

# ---------------#
# Docker Logging #
# ---------------#
alias docker.logs.webapp="tail -f $HOME/dev/src/github.com/deputyapp/deputy-webapp/_docker/logs/php/php.log"
alias docker.logs.servicesproxy="tail -f $HOME/dev/src/github.com/deputyapp/services-proxy/_docker/logs/php/php.log"
alias docker.errors.servicesproxy="tail -f $HOME/dev/src/github.com/deputyapp/services-proxy/_docker/logs/httpd/error_log"
alias docker.aws.listtables="aws dynamodb list-tables --debug  --endpoint-url http://aws.local.dpty.io:4566"
# --------------------------------------------------




eval "$(direnv hook bash)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/php@7.4/bin:/usr/local/opt/php@7.4/sbin:/usr/local/opt/mysql@5.7/bin:/usr/local/sbin:$PATH"
export PATH="$(brew --prefix php)/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
