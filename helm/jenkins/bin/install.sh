#!/bin/bash

cd "$(dirname "$0")"
helm install jenkins stable/jenkins -n jenkins -f ../values.yaml 
