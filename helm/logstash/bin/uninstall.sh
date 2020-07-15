#!/bin/bash

cd "$(dirname "$0")"
helm uninstall logstash -n elk
