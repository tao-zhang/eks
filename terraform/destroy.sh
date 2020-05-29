#!/bin/bash


# Helm charts

../helm/nginx-ingress/bin/uninstall.sh

../helm/jenkins/bin/uninstall.sh

# Terraform

terraform destroy --auto-approve
