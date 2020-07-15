#!/bin/bash

cd "$(dirname "$0")"
helm install elasticsearch -n elk -f ../values.yaml --version 7.8.0 elastic/elasticsearch
