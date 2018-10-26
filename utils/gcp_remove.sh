#!/bin/bash

gcp_project=$1

cd $gcp_project
project_plan_path="../.tmp/$gcp_project/plan"

terraform destroy -auto-approve
if [[ $? -eq 0 ]];then
	echo "Apply PASS"
else
	echo "Apply FAIL"
	exit 1
fi
