#!/bin/bash

cd "$(dirname "$0")"
helm upgrade sonarqube oteemocharts/sonarqube -n sonar -f ../values.yaml 
