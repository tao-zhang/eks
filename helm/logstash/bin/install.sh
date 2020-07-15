#!/bin/bash

cd "$(dirname "$0")"
helm install logstash -n elk -f ../values.yaml --version 7.8.0 elastic/logstash
