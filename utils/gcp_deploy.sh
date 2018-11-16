#!/bin/bash

gcp_project=$1

cd $gcp_project
project_plan_path="../.tmp/$gcp_project/plan"

terraform apply -auto-approve < $project_plan_path
if [[ $? -eq 0 ]];then
	echo "Apply PASS"
else
	echo "Apply FAIL"
	exit 1
fi

echo "Listing hosts via Ansible GCP plugin"
ansible all -i main.gcp.yml --list-hosts
echo 'If hosts are new you probably have to wait till DNS records is set. 15 minutes should be enough'

echo 'Testing Ansible connection to hosts:'
ansible all -i main.gcp.yml -b -m ping

echo 'Launching Compose-based deploy'
ansible-playbook -e "project_name=$gcp_project" -i main.gcp.yml ../utils/gcp_compose_deploy.yml
