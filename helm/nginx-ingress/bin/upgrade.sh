#!/bin/bash

cd "$(dirname "$0")"
helm upgrade nginx-ingress stable/nginx-ingress -n ingress -f ../values.yaml 