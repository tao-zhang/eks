#!/bin/bash


# Helm charts

../helm/nginx-ingress/bin/uninstall.sh

../helm/jenkins/bin/uninstall.sh

../helm/prometheus-operator/bin/uninstall.sh

../helm/elasticsearch/bin/uninstall.sh

../helm/kibana/bin/uninstall.sh

../helm/logstash/bin/uninstall.sh

# Terraform

terraform destroy --auto-approve
