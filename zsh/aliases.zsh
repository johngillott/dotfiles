#!/bin/sh

# 1 - git
alias grmbr="git branch --merged | egrep --invert-match '(^\*|master|main|dev)' | xargs git branch -d"
alias gmv="git mv"
alias gdiff="git diff --no-index --"

# 2 - docker
# quick access to docker cli
alias d='docker'
# quick access to docker-compose cli
alias dc='docker-compose'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
# list all images
alias dim='docker images'
# quickly list all containres
alias dps='docker ps'
# including stopped containers
alias dpsa='docker ps -a'
# force removal
alias drm='docker rm -f'
# clean up dangling resources
alias dprune='docker system prune --volumes'

# 3 - kubectl
alias k='kubectl'
# get all contexts 
alias kgx='kubectl config get-contexts'
# quickly switch context
alias ksx='kubectl config set-context'
# remove an existing context
alias kdx='kubectl config delete-context'
# modify default namespace for a context
alias kns='kubectl config set-context --current --namespace'
# execute command (interactive with tty)
alias kex='kubectl exec -it'
# check authorization 
alias kani='kubectl auth can-i'

# 4 - gcloud nandos-api-platform
SECRET_PROD="/Users/john.gillott/dev/.secrets/prod-platform-provisioning.json"
SECRET_DEV="/Users/john.gillott/dev/.secrets/dev-platform-provisioning.json"

alias prod='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_PROD' \
 && gcloud config set account platform-provisioning-prod@nandos-api-platform-production.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform-production && gcloud auth activate-service-account --key-file '$SECRET_PROD' \
 && if [ $(dig +short A -4 api.nandos.services) = "34.89.31.15" ]; then gcloud container clusters get-credentials prod-blue --region europe-west2; else gcloud container clusters get-credentials prod-green --region europe-west2; fi'

alias preprod='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_DEV' \
 && gcloud config set account platform-provisioning@nandos-api-platform.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform && gcloud auth activate-service-account --key-file '$SECRET_DEV' \
 && if [ $(dig +short A -4 api.preprod.nandos.services) = \"35.246.26.213\" ]; then gcloud container clusters get-credentials dev-preprod-blue --region europe-west2; else gcloud container clusters get-credentials dev-preprod-green --region europe-west2; fi'

alias dev='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_DEV' \
 && gcloud config set account platform-provisioning@nandos-api-platform.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform && gcloud auth activate-service-account --key-file '$SECRET_DEV' \
 && if [ $(dig +short A -4 api.dev.nandos.services) = "35.235.54.199" ]; then gcloud container clusters get-credentials dev-preview-blue --region europe-west2; else gcloud container clusters get-credentials dev-preview-green --region europe-west2; fi'

alias dev-tooling='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_DEV' \
 && gcloud config set account platform-provisioning@nandos-api-platform.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform && gcloud auth activate-service-account --key-file '$SECRET_DEV' \
 && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-tooling, dev-tooling-blue, dev-tooling-green)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'

alias prod-blue='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_PROD' \
 && gcloud config set account platform-provisioning-prod@nandos-api-platform-production.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform-production && gcloud auth activate-service-account --key-file '$SECRET_PROD' \
 && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(prod-blue)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'

alias prod-green='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_PROD' 
 && gcloud config set account platform-provisioning-prod@nandos-api-platform-production.iam.gserviceaccount.com 
 && gcloud config set project nandos-api-platform-production && gcloud auth activate-service-account --key-file '$SECRET_PROD' \
 && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(prod-green)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'

alias preprod-blue='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_DEV' \
 && gcloud config set account platform-provisioning@nandos-api-platform.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform && gcloud auth activate-service-account --key-file '$SECRET_DEV' \
 && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-preprod-blue)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'

alias preprod-green='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_DEV' \
 && gcloud config set account platform-provisioning@nandos-api-platform.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform && gcloud auth activate-service-account --key-file '$SECRET_DEV' \
 && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-preprod-green)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'

alias dev-blue='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_DEV' \
 && gcloud config set account platform-provisioning@nandos-api-platform.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform && gcloud auth activate-service-account --key-file '$SECRET_DEV' \
 && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-preview-blue)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'

alias dev-green='export GOOGLE_APPLICATION_CREDENTIALS='$SECRET_DEV' \
 && gcloud config set account platform-provisioning@nandos-api-platform.iam.gserviceaccount.com \
 && gcloud config set project nandos-api-platform && gcloud auth activate-service-account --key-file '$SECRET_DEV' \
 && gcloud container clusters get-credentials $(gcloud container clusters list --filter="name:(dev-preview-green)" --limit=1 --format="value(selfLink.scope())") --region europe-west2'

alias argocd-ui='kubectl -n argocd port-forward svc/argocd-server 8080:80'