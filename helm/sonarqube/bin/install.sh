#!/bin/bash

cd "$(dirname "$0")"
helm install sonarqube oteemocharts/sonarqube -n sonar -f ../values.yaml 
