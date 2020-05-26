#!/bin/bash

cd "$(dirname "$0")"
kubectl create secret tls greenbuild.com --namespace ingress --cert greenbuild.com.cert --key greenbuild.com.key
