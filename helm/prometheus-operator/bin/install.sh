#!/bin/bash

cd "$(dirname "$0")"
helm install prometheus-operator stable/prometheus-operator -n monitoring -f ../values.yaml
