#!/bin/bash

cd "$(dirname "$0")"
kubectl create secret tls greenbuild.io --namespace ingress --cert star.greenbuild.io.crt --key star.greenbuild.io.key
