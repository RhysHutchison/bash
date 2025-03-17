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
alias femonorepo="cd $HOME/dev/src/github.com/deputyapp/fe-monorepo"
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
alias open="open -a \"Sublime Text\""
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
alias gp="git pull --all"
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
alias git.merge.main="git checkout main && git pull --all && git checkout - && git merge main"
alias git.fetch.pull="git fetch && git pull --all"
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

# --------------------------------------------------
# COMPILERS
# -------------------------------------------------
alias compile.portal="php -q $HOME/deputec/bin/utility/convert.php decaf dexml.coffee > dexml.xml;"
alias compile.serviceproxy.copy="sh $HOME/dev/src/github.com/deputyapp/services-proxy/dispatch/includes/decaf/build.sh pbcopy"
alias compile.serviceproxy.local="sh $HOME/dev/src/github.com/deputyapp/services-proxy/dispatch/includes/decaf/build.sh deputec_dispatch_helper \"Deputy Integrations Helper Script\" 1 business.dev.local.dpty.io 849799dafb9744b099ba66be96ce7db4"
alias updateportal="php update.php"
alias s3="cd ~/Library/Group\ Containers/G69SCX94XU.duck/Library/Application\ Support/duck/Volumes/AWS-S3"
alias compile.reseller.widget="aws s3 cp $HOME/dev/src/github.com/deputyapp/portal/reseller-widget/dist/signup.js s3://deputy-www-assets/s3assets/ --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers"

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

# --------------------------------------------------
# MySQL CLI Commands
# --------------------------------------------------
alias mysqllogin="mysql -u root -p"
# --------------------------------------------------
# MySQL CLI Commands
# --------------------------------------------------
alias ssh.cx.ec2.maccas="ssh -v -i ~/.ssh/mcdonalds_private_rsa ec2-user@ec2-54-79-30-165.ap-southeast-2.compute.amazonaws.com"
alias ssh.cx.sftp.elcus="ssh -v -i ~/.ssh/privkey.gpg deputy4elc@securemft-us-gm.elcompanies.com"
alias ssh.cx.ec2.main="ssh -v -i ~/.ssh/deputycxdev.pub ec2-user@ec2-54-79-30-165.ap-southeast-2.compute.amazonaws.com"

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

alias docker.down="docker.up.devbox && docker.up.dir && docker.up.webapp && docker.up.integrations"
alias docker.down="docker.down.devbox && docker.down.dir && docker.down.webapp && docker.down.integrations"
# --------------------------------------------------

# --------#
# GO-SVC  #
# --------#
alias docker.down.svc="gosvc && docker.down.integrations && docker.down.dir && docker.down.marketplace"
alias docker.jwt.dir="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_DIR_V1 --payload_user_id ef172da5-a546-43d8-8eb4-580a821039e9 --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf -d 24h"
alias docker.jwt.query="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_QUERY_V1 --oidc --svc-connect-endpoint https://api.usw2.test.dpty.io --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf --payload_business_user_id ef172da5-a546-43d8-8eb4-580a821039e9 -d 72h"
alias docker.jwt.metrics="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_METRICS_V1 --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf -d 24h"
alias docker.jwt.payrate="SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_PAYRATE_V1 -d 24h"
alias docker.jwt.award="gosvc && SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --aud SVC_AWARD_V1 --sub DEPUTY --duration 24h"
alias docker.jwt.webapp="gosvc && SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --aud DEPUTY --sub ONCE --duration 24h"
alias docker.jwt.test="gosvc && SECRETS_JWT_KEY=magic ./bin/genjwt --iss DEPUTY --sub DEPUTY --aud SVC_QUERY_V1 --oidc --svc-connect-endpoint https://api.usw2.test.dpty.io --payload_business_id eb66a539-2aba-4935-a250-753fe5e9e6bf --payload_business_user_id ef172da5-a546-43d8-8eb4-580a821039e9 -d 10072h"
# --------------------------------------------------

# -------------#
# GO-SVC AUDIT #
# -------------#
alias docker.up.audit="gosvc && TARGET=svc-audit mk compose.up.build"
alias docker.up.audit.aws="docker.aws.make && gosvc && TARGET=svc-audit mk aws.migrate.up"
# --------------------------------------------------

# --------------#
# GO-SVC AWARDS #
# --------------#
alias docker.reset.award.aws="gosvc && docker.down.award.aws && docker.up.award.aws"
alias docker.up.award="gosvc && TARGET=svc-award AUTH_ENABLED=true mk compose.up.build"
alias docker.up.award.aws="docker.aws.make && gosvc && TARGET=svc-award mk aws.migrate.up"
alias docker.down.award="gosvc && TARGET=svc-award docker-compose down"
alias docker.down.award.aws="gosvc && TARGET=svc-award mk aws.migrate.down"
# --------------------------------------------------

# ------------------#
# GO-SVC COMPLIANCE #
# ------------------#
alias docker.reset.compliance.aws="gosvc && docker.down.compliance.aws && docker.up.compliance.aws"
alias docker.up.compliance="gosvc && TARGET=svc-compliance AUTH_ENABLED=1 mk compose.up.build"
alias docker.up.compliance.aws="gosvc && TARGET=svc-compliance mk aws.migrate.up"
alias docker.down.compliance="TARGET=svc-compliance docker-composer down"
alias docker.down.compliance.aws="TARGET=svc-compliance mk aws.migrate.down"
# --------------------------------------------------

# -------------------#
# GO-SVC Connect #
# -------------------#
alias docker.up.connect="gosvc && TARGET=svc-connect AUTH_ENABLED=0 mk compose.up.build-detached"
alias docker.up.connect.auth="gosvc && TARGET=svc-connect AUTH_ENABLED=1 mk compose.up.build-detached"
alias docker.up.connect.aws="docker.aws.make && gosvc && TARGET=svc-connect mk aws.migrate.up"
alias docker.down.connect.aws="gosvc && TARGET=svc-connect mk aws.migrate.down"
alias docker.reset.connect.aws="docker.down.connect.aws && docker.up.connect.aws"
# --------------------------------------------------

# -------#
# Devbox #
# -------#
alias docker.reset.devbox="devbox && make stop && make clean && rm -rf $HOME/dev/src/github.com/deputyapp/devbox/data/localstack"
alias docker.aws.make="devbox && make aws"
alias docker.up.devbox="devbox && make upbd"
alias docker.down.devbox="devbox && docker-compose down"
alias docker.down.datadog="devbox && make datadog.down && cd -"
# --------------------------------------------------

# -----------------#
# GO-SVC Directory #
# -----------------#
alias docker.up.dir="gosvc && TARGET=svc-dir mk compose.up.build"
alias docker.up.dir.detached="gosvc && TARGET=svc-dir mk compose.up.build-detached"
alias docker.down.dir="gosvc && TARGET=svc-dir docker-compose down"
alias docker.up.dir.aws="docker.aws.make && gosvc && TARGET=svc-dir mk aws.migrate.up"
alias docker.down.dir.aws="gosvc && TARGET=svc-dir mk aws.migrate.down"
alias docker.reset.dir.aws="docker.down.dir.aws && docker.up.dir.aws"
alias docker.seed.dir.tenant="curl --location --request POST 'http://api.local.dpty.io/sys/dir/v1/tenants' --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhcGkuZGVwdXR5LmNvbS9zeXMvZGlyL3YxIiwiZHAuYmlkIjoiZWI2NmE1MzktMmFiYS00OTM1LWEyNTAtNzUzZmU1ZTllNmJmIiwiZHAudWlkIjoiZWYxNzJkYTUtYTU0Ni00M2Q4LThlYjQtNTgwYTgyMTAzOWU5IiwiZXhwIjoxNjMxMjI4Mzc5LCJpYXQiOjE2MzExNDE5NzksImlzcyI6ImRlcHV0eS5jb20iLCJqdGkiOiIxeHNSbnNPRTRPTW5RSFREN0FpUHJDV3RLVDUiLCJuYmYiOjE2MzExNDE5NzksInN1YiI6ImRlcHV0eS5jb20ifQ.ordh9SPuLy2_h7ggw8ujBUZHldrWEusah4lxcTnFLdQ' --header 'Content-Type: application/json' --data-raw '{\"data\": {    \"id\":\"eb66a539-2aba-4935-a250-753fe5e9e6bf\",\"hostname\":\"business.dev.local.dpty.io\",\"additionalHostname\":\"business.dev.local.dpty.io\",\"portfolioName\":\"Deputy Development 1\",\"countryCode\":\"AU\",\"countryId\": 13,\"region\":\"usw2\",\"creator\":\"-2\",\"status\":\"ACTIVE\",\"edition\":11,\"enabled\":true,\"channel\":\"DIRECT\",\"billingSuppressed\":false,\"trialEndedAt\":null,\"conversionDate\": null,\"dbHost\":\"svc.db.local.dpty.io\",\"dbName\":\"deputec_dev\",\"dbUser\":\"\",\"redisTenantCluster\":\"redis-tenant.local.deputec.com:17000\",\"elasticsearchHost\":\"\",\"subscriptionMetadata\": {},\"createdAt\":\"2019-05-22T15:34:47Z\",\"modifiedAt\":\"2023-06-05T12:29:37Z\",\"externalId\":\"\"}}'"
alias docker.seed.dir.tenant.archer="curl --location --request POST 'http://api.local.dpty.io/sys/dir/v1/tenants' --header 'Content-Type: application/json' --data-raw '{\"data\": {\"id\": \"eb66a539-2aba-4935-a250-753fe5e9e6bf\",\"hostname\": \"business.dev.local.dpty.io\",\"countryId\": 13,\"countryCode\": \"AU\",\"dbHost\": \"testdb.deputec.com\",\"dbName\": \"deputec_b1234\",\"additionalHostname\": \"business.dev.local.dpty.io\",\"createdAt\": \"2019-11-28T03:57:20Z\",\"redisTenantCluster\": \"redis-tenant.local.deputec.com:17000\",\"creator\": \"rimba\",\"channel\": \"EMBED_XERO\",\"externalId\": \"local-dev-enviroment\",\"region\": \"apse2\",\"portfolioName\": \"Deputy Development\",\"edition\": 9}}'"
# --------------------------------------------------

# -------------#
# XERO EMBED   #
# -------------#
alias archer.seed.partnerUserId="curl --location --request POST 'https://business.dev.local.dpty.io/api/management/v2/employees' --header 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJleHAiOjE3MjU0MDQwOTEsImlhdCI6MTcyNTQwMzc5MSwibmJmIjoxNzI1NDAzNzg2LCJqdGkiOiIybGEySjNzSlR2b242SzBUaUpXZ2E0SjZXQ3MiLCJpc3MiOiJkZXB1dHkuY29tIiwiYXVkIjoiZGVwdXR5LmNvbSIsInN1YiI6ImFub255bW91cyIsImRwLmJ1aWQiOiIxIiwiZHAuYmlkIjoiZWI2NmE1MzktMmFiYS00OTM1LWEyNTAtNzUzZmU1ZTllNmJmIiwiZHAuYmxpZCI6IjEiLCJkcC5laWQiOjEsImRwLnVpZCI6ImVmMTcyZGE1LWE1NDYtNDNkOC04ZWI0LTU4MGE4MjEwMzllOSIsImRwLnJlZyI6ImRldiIsImRwLnJlZ3MiOiJ1c3cyIiwiZHAuYXBpaCI6ImFwaS5sb2NhbC5kcHR5LmlvIiwiZHAucHUiOmZhbHNlLCJkcC5hZHZ1IjpmYWxzZSwiZHAuYmNobiI6ImJ1c2luZXNzLmRldi5sb2NhbC5kcHR5LmlvIiwiZHAuc2IiOmZhbHNlfQ.I8NiTptkuBLGZWz7eHtyUVlT6hHQnHW27qYTA3PHmG3V8YNE4QsdG8jpfuyDzgwK6_HJqXy8WWHMmiTGePSehw' --header 'Content-Type: application/json' --data-raw '{\"data\":{\"firstName\":\"Deputy\",\"lastName\":\"Integrations\",\"position\":\"System Administrator\",\"role\":{\"id\":\"1\"},\"primaryLocation\":{\"id\":\"1\"},\"contact\":{\"email1\":\"platform.integrations@deputy.com\"},\"user\":{\"partnerUserId\":\"XE-2753e895d91b4d61807d68ddfa165d87\"}}}'"

# -------------#
# GO-SVC HELLO #
# -------------#
alias docker.up.hello="gosvc && TARGET=svc-hello APP_BACKGROUND_WORKER_ENABLED=1 mk compose.up.build"
alias docker.down.hello="gosvc && docker stop svc-hello_app_1"
# --------------------------------------------------

# ------------#
# GO-SVC HIRE #
# ------------#
alias docker.up.hire="gosvc && TARGET=svc-hire mk compose.up.build"
alias docker.up.hire.aws="gosvc && TARGET=svc-hire mk aws.migrate.up"
alias docker.down.hire.aws="gosvc && TARGET=svc-hire mk aws.migrate.down"
alias docker.reset.hire.aws="docker.down.hire.aws && docker.up.hire.aws"
# --------------------------------------------------

# ------------#
# GO-SVC HR #
# ------------#
alias docker.up.hr="gosvc && TARGET=svc-hr mk compose.up.build"
alias docker.up.hr.aws="gosvc && TARGET=svc-hr mk aws.migrate.up"
alias docker.down.hr.aws="gosvc && TARGET=svc-hr mk aws.migrate.down"
alias docker.reset.hr.aws="docker.down.hr.aws && docker.up.hr.aws"
# --------------------------------------------------

# --------------------#
# GO-SVC Integrations #
# --------------------#
alias docker.up.integrations="gosvc && TARGET=svc-integrations APP_BACKGROUND_WORKER_ENABLED=1 AUTH_ENABLED=true mk compose.up.build"
alias docker.up.integrations.detached="gosvc && TARGET=svc-integrations APP_BACKGROUND_WORKER_ENABLED=1 AUTH_ENABLED=true mk compose.up.build-detached"
alias docker.down.integrations="gosvc && TARGET=svc-integrations docker-compose down"
alias docker.up.integrations.aws="docker.aws.make && gosvc && TARGET=svc-integrations mk aws.migrate.up"
alias docker.up.integrations.aws.testing="docker.aws.make && gosvc && TARGET=svc-integrations mk aws.migrate.up ENVIRONMENT=testing"
alias docker.down.integrations.aws="gosvc && TARGET=svc-integrations mk aws.migrate.down"
alias docker.down.integrations.aws.testing="gosvc && TARGET=svc-integrations mk aws.migrate.down ENVIRONMENT=testing"
alias docker.reset.integrations.aws="docker.down.integrations.aws && docker.up.integrations.aws"
alias docker.up.integrations.openapi="gosvc && TARGET=svc-integrations scripts/mk compose.up.build"
# --------------------------------------------------

# -------------#
# GO-SVC LEAVE #
# -------------#
alias docker.up.leave="gosvc && TARGET=svc-leave mk compose.up.build"
alias docker.up.leave.detached="gosvc && TARGET=svc-leave mk compose.up.build-detached"
alias docker.up.leave.aws="docker.aws.make && gosvc && TARGET=svc-leave mk aws.migrate.up"
alias docker.down.leave.aws="docker.aws.make && gosvc && TARGET=svc-leave mk aws.migrate.down"
alias docker.reset.leave.aws="docker.down.leave.aws && docker.up.leave.aws"
alias docker.seed.leave="gosvc && TARGET=svc-leave mk aws.seed.local"
# --------------------------------------------------

# --------#
# Logging #
# --------#
alias docker.logs.webapp="tail -f $HOME/dev/src/github.com/deputyapp/deputy-webapp/_docker/logs/php/php.log"
alias docker.logs.backgroundjobs="tail -f $HOME/dev/src/github.com/deputyapp/deputy-webapp/_docker/logs/deputy-bg-worker/php.log"
alias docker.logs.servicesproxy="tail -f $HOME/dev/src/github.com/deputyapp/services-proxy/_docker/logs/php/php.log"
alias docker.errors.servicesproxy="tail -f $HOME/dev/src/github.com/deputyapp/services-proxy/_docker/logs/httpd/error_log"
alias docker.aws.listtables="aws dynamodb list-tables --debug  --endpoint-url http://aws.local.dpty.io:4566"
# --------------------------------------------------

# -------------------#
# GO-SVC Marketplace #
# -------------------#
alias docker.up.marketplace="gosvc && TARGET=svc-marketplace mk compose.up.build"
alias docker.up.marketplace.detached="gosvc && TARGET=svc-marketplace mk compose.up.build-detached"
alias docker.up.marketplace.auth="gosvc && TARGET=svc-marketplace AUTH_ENABLED=1 mk compose.up.build"
alias docker.up.marketplace.auth.detached="gosvc && TARGET=svc-marketplace AUTH_ENABLED=1 mk compose.up.build-detached"
alias docker.down.marketplace="gosvc && TARGET=svc-marketplace docker-compose down"
alias docker.up.marketplace.aws="docker.aws.make && gosvc && TARGET=svc-marketplace mk aws.migrate.up"
alias docker.down.marketplace.aws="gosvc && TARGET=svc-marketplace mk aws.migrate.down"
alias docker.reset.marketplace.aws="docker.down.marketplace.aws && docker.up.marketplace.aws"
alias docker.seed.marketplace="gosvc && TARGET=svc-marketplace && go run cmd/svc-marketplace/data/seeds/main.go"
# --------------------------------------------------

# ---------------#
# GO-SVC METRICS #
# ---------------#
alias docker.reset.metrics.aws="gosvc && docker.down.metrics.aws && docker.up.metrics.aws"
alias docker.reset.metrics.seed="gosvc && docker.down.metrics.aws && docker.up.metrics.aws && docker.up.metrics.seed"
alias docker.up.metrics="gosvc && TARGET=svc-metrics mk compose.up.build"
alias docker.up.metrics.lambda="opsmetrics && make lambda.build && make lambda.create"
alias docker.up.metrics.aws="gosvc && TARGET=svc-metrics mk aws.migrate.up"
alias docker.seed.metrics="docker.aws.make && gosvc && TARGET=svc-metrics mk aws.seed"
alias docker.down.metrics="gosvc && TARGET=svc-metrics docker-compose down"
alias docker.down.metrics.aws="gosvc && TARGET=svc-metrics mk aws.migrate.down"
alias docker.down.metrics.lambda="opsmetrics && make lambda.delete"
# --------------------------------------------------

# --------------------#
# GO-SVC NOTIFICATION #
# --------------------#
alias docker.up.notification="gosvc && TARGET=svc-notification NOTIFICATION_SERVICE_MODE=dev mk compose.up.build-detached"
alias docker.up.notification.aws="gosvc && TARGET=svc-notification mk aws.migrate.up"
alias docker.down.notification.aws="gosvc && TARGET=svc-notification mk aws.migrate.down"
alias docker.reset.notification.aws="docker.down.notification.aws && docker.up.notification.aws"
# --------------------------------------------------

# ---------#
# OKTA 2FA #
# ---------#
alias docker.sso='AWS_PROFILE=okta-sso aws sso login'
alias docker.login.integrations="AWS_PROFILE=okta-prod-integration aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.us-west-2.amazonaws.com"
alias docker.login="AWS_PROFILE=okta-mgt-basic aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.us-west-2.amazonaws.com"
alias docker.login.apse1="AWS_PROFILE=okta-mgt-basic aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.ap-southeast-1.amazonaws.com"
alias docker.login.cx="AWS_PROFILE=okta-cx-rw aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 358559522285.dkr.ecr.us-west-2.amazonaws.com"
# --------------------------------------------------

# ---------------#
# GO-SVC PAYRATE #
# ---------------#
alias docker.reset.payrate.aws="gosvc && docker.down.payrate.aws && docker.up.payrate.aws"
alias docker.up.payrate="gosvc && TARGET=svc-payrate mk compose.up.build"
alias docker.up.payrate.aws="gosvc && TARGET=svc-payrate mk aws.migrate.up"
alias docker.up.payrate.openapi="gosvc && TARGET=svc-payrate scripts/mk compose.up.build"
alias docker.seed.payrate="gosvc && go run cmd/svc-payrate/dev/seed/main.go all"
alias docker.seed.payrate.flsa="gosvc && go run cmd/svc-payrate/dev/seed/main.go flsa"
alias docker.seed.payrate.fwwnyc="gosvc && go run cmd/svc-payrate/dev/seed/main.go fww-nyc"
alias docker.seed.payrate.fwwla="gosvc && go run cmd/svc-payrate/dev/seed/main.go fww-la"
alias docker.seed.payrate.fwwseattle="gosvc && go run cmd/svc-payrate/dev/seed/main.go fww-seattle"
alias docker.seed.payrate.ctsf="gosvc && go run cmd/svc-payrate/dev/seed/main.go ctsf"
alias docker.down.payrate="gosvc && TARGET=svc-payrate docker-composer down"
alias docker.down.payrate.aws="gosvc && TARGET=svc-payrate mk aws.migrate.down"
# --------------------------------------------------


# -----------------#
# GO-SVC TIMESHEET #
# -----------------#
alias docker.reset.timesheet.aws="gosvc && docker.down.timesheet.aws && docker.up.timesheet.aws"
alias docker.up.timesheet="TARGET=svc-timesheet mk compose.up.build"
alias docker.up.timesheet.aws="gosvc && TARGET=svc-timesheet mk aws.migrate.up"
alias docker.down.timesheet="gosvc && TARGET=svc-timesheet docker-composer down"
alias docker.down.timesheet.aws="gosvc && TARGET=svc-timesheet mk aws.migrate.up"
alias docker.up.timesheet.ngrok="$HOME/dev/src/github.com/deputyapp/go-svc/scripts/run_ngrok"

# -------------#
# GO-SVC QUERY #
# -------------#
alias docker.up.query="gosvc && TARGET=svc-query mk compose.up.build"
alias docker.up.query.detached="gosvc && TARGET=svc-query mk compose.up.build-detached"
alias docker.up.query.ngrok="ngrok http --domain=ram-calm-rapidly.ngrok-free.app 8888"
# --------------------------------------------------

# ---------------#
# Services-Proxy #
# ---------------#
alias docker.up.servicesproxy="servicesproxy && docker-compose -f docker-compose.yml -f docker-compose.integrations.yml up --build"
alias docker.up.servicesproxy.detached="servicesproxy && docker-compose -f docker-compose.yml -f docker-compose.integrations.yml up --build -d"
alias docker.down.servicesproxy="servicesproxy && docker-compose down"
alias docker.update.servicesproxy="docker exec services-proxy-service_proxy-1 php composer.phar install"
alias proxyerrors="open /opt/local/apache2/logs/error_log"
alias proxyaccess="open /opt/local/apache2/logs/access_log"
# --------------------------------------------------

# -----------#
# Web Signup #
# -----------#
alias docker.up.websignup="websignup && docker-compose up -d"
alias docker.down.websignup="websignup && docker-compose down"
# --------------------------------------------------

# ------------------#
# GO-SVC SHIFTEVENT #
# ------------------#
alias docker.reset.shiftevent.aws="gosvc && docker.down.shiftevent.aws && docker.up.shiftevent.aws"
alias docker.up.shiftevent="gosvc && TARGET=svc-shiftevent AUTH_ENABLED=1 mk compose.up.build"
alias docker.up.shiftevent.seed="gosvc && TARGET=svc-shiftevent mk aws.seed"
alias docker.down.shiftevent="gosvc && TARGET=svc-shiftevent docker-composer down"
alias docker.up.shiftevent.aws="TARGET=svc-shiftevent mk aws.migrate.up"
alias docker.down.shiftevent.aws="TARGET=svc-shiftevent mk aws.migrate.down"
# --------------------------------------------------

# -----------------#
# Test Application #
# -----------------#
alias docker.up.testapp="svcscripts && INSTANCE=\"https://business.dev.local.dpty.io\" TOKEN=\"849799dafb9744b099ba66be96ce7db4\" go run testapp.go"
# --------------------------------------------------

# -----------------#
# GO-SVC URL #
# -----------------#
alias docker.up.url="gosvc && TARGET=svc-url AUTH_ENABLED=1 mk compose.up.build-detached"
alias docker.down.url="gosvc && docker stop svc-url_app_1"
alias docker.up.url.aws="gosvc && TARGET=svc-url mk mysql.migrate"
alias docker.down.url.aws="gosvc && TARGET=svc-url mk aws.migrate.down"
alias docker.reset.url.aws="docker.down.url.aws && docker.up.url.aws"
# --------------------------------------------------

# -------#
# Webapp #
# -------#
alias docker.update.vault="webapp && make vault.pull"
alias docker.reset.nodemodules="sudo rm -rf frontend/vue/node_modules frontend/classic/node_modules frontend/vnext/node_modules node_modules"
alias docker.up.webapp="make upbd"
alias docker.up.webapp.integrations="make upbdi"
alias docker.down.webapp="webapp && docker-compose down"
alias docker.update.webapp.backend="webapp && make install.backend"
alias docker.update.webapp.frontend="webapp && make fe.install"
alias docker.seed.webapp="webapp && make seed"
alias docker.seed.webapp.trial="webapp && make seed.trial"
alias docker.seed.webapp.enterprise="webapp && make seed.enterprise"
alias docker.bash.test="webapp && docker-compose -f docker-compose.yml exec deputy bin/composer.phar test:database"
alias docker.bash.webapp="webapp && docker-compose -f docker-compose.yml exec deputy bash"
alias docker.bash.devbox="webapp && docker-compose -f docker-compose.yml exec deputy bash"
# --------------------------------------------------

eval "$(direnv hook bash)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/php@7.3/bin:/opt/homebrew/opt/php@7.3/sbin:/usr/local/opt/mysql@5.7/bin:/usr/local/sbin:$PATH"
export PATH="$(brew --prefix php)/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
