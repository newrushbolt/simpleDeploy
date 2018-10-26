#!/bin/bash

gcp_project=$1

if [[ -z $gcp_project ]];then
	echo 'No project arg passed'
	exit 1
fi

if ! [[ -d $gcp_project ]];then
	echo 'No project folder found'
	exit 1
fi

tmp_path=".tmp/$gcp_project"
rm -fr $tmp_path > /dev/null 2>&1
mkdir -p $tmp_path > /dev/null 2>&1

cd $gcp_project

terraform init
if [[ $? -eq 0 ]];then
	echo "Init PASS"
else
	echo "Init FAIL"
	exit 1
fi

terraform plan -out "../$tmp_path/plan"
if [[ $? -eq 0 ]];then
	echo "Plan PASS"
else
	echo "Plan FAIL"
	exit 1
fi

