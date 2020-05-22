#!/bin/bash

# Install metrics server, see https://docs.aws.amazon.com/eks/latest/userguide/metrics-server.html
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml