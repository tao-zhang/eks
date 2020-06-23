#!/bin/bash

cd "$(dirname "$0")"
helm upgrade prometheus-operator stable/prometheus-operator -n monitoring -f ../values.yaml 
