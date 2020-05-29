#!/bin/bash

cd "$(dirname "$0")"
helm upgrade jenkins stable/jenkins -n jenkins -f ../values.yaml 
