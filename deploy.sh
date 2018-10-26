#!/bin/bash

. utils/color.sh
. projects.sh

for project in $gcp_projects_list; do
	echo -e "\nRunning tests for GCP project:\t\t$gcp_projects_list"
	test_result="$(utils/gcp_common_test.sh $project)" 
	if [[ $? -eq 0 ]];then
		echo_green "PASS"
	else
		echo_red "FAIL"
		exit 1
	fi
done

for project in $gcp_projects_list; do
	echo -e "\nDeploing GCP project:\t\t$gcp_projects_list"
	utils/gcp_deploy.sh $project
	if [[ $? -eq 0 ]];then
		echo_green "SUCCESSED"
	else
		echo_red "FAILED"
		exit 1
	fi
done

exit 0
