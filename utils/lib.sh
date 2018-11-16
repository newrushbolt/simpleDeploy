#!/bin/bash

CLR_GRN='\033[0;32m'
CLR_RED='\033[0;31m'
CLR_NC='\033[0m'

set -o pipefail

function echo_red {
	echo -e "$CLR_RED$1$CLR_NC"
}

function echo_green {
	echo -e "$CLR_GRN$1$CLR_NC"
}

function prepare_gcp_vars {
	export TF_VAR_DEPLOY_PROJECT_NAME=$1
	export TF_VAR_DEPLOY_PROJECT_HEAD="$(git log -1 --no-decorate|head -1|awk '{print $2}')"
}

function prepare_tmp_dir {
	if ! [[ -d '.tmp' ]];then
		rm -fr .tmp > /dev/null 2>&1
		mkdir .tmp
	fi
}
