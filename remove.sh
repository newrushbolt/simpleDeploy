#!/bin/bash

. utils/lib.sh
. projects.sh

prepare_tmp_dir

for project in $gcp_projects_list; do
	prepare_gcp_vars $project
	echo -e "\nDestroing GCP project:\t\t$gcp_projects_list"
	test_result="$(utils/gcp_remove.sh $project|tee -a ".tmp/$project/gcp_remove.log")"
	if [[ $? -eq 0 ]];then
		echo_green "PASS"
	else
		echo_red "FAIL"
		exit 1
	fi
done

exit 0
