#!/bin/bash

cp kubeconfig_gbeks ~/.kube/config

# Install metrics server, see https://docs.aws.amazon.com/eks/latest/userguide/metrics-server.html
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml

# Helm charts

../helm/nginx-ingress/bin/create-ns.sh
../helm/nginx-ingress/cert/create-secret.sh
../helm/nginx-ingress/bin/install.sh


../helm/jenkins/bin/create-ns.sh
kubectl create -f ../helm/jenkins/k8s-credentials-provider
../helm/jenkins/bin/install.sh

../helm/prometheus-operator/bin/create-ns.sh
../helm/prometheus-operator/bin/install.sh
