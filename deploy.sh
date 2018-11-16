#!/bin/bash

. utils/lib.sh
. projects.sh

prepare_tmp_dir

for project in $gcp_projects_list; do
	prepare_gcp_vars $project
	echo -e "\nRunning tests for GCP project:\t\t$gcp_projects_list"
	test_result="$(utils/gcp_common_test.sh $project|tee -a ".tmp/$project/gcp_common_test.log")"
	if [[ $? -eq 0 ]];then
		echo_green "PASS"
	else
		echo_red "FAIL"
		exit 1
	fi
done

for project in $gcp_projects_list; do
	prepare_gcp_vars $project
	echo -e "\nDeploing GCP project:\t\t$gcp_projects_list"
	deploy_result="$(utils/gcp_deploy.sh $project|tee -a ".tmp/$project/gcp_deploy.log")"
	if [[ $? -eq 0 ]];then
		echo_green "SUCCESSED"
	else
		echo_red "FAILED"
		exit 1
	fi
done

exit 0
