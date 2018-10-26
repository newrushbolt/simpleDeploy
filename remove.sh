#!/bin/bash

. utils/color.sh
. projects.sh

for project in $gcp_projects_list; do
	echo -e "\nDestroing GCP project:\t\t$gcp_projects_list"
	test_result="$(utils/gcp_remove.sh $project)" 
	if [[ $? -eq 0 ]];then
		echo_green "PASS"
	else
		echo_red "FAIL"
		exit 1
	fi
done

exit 0
