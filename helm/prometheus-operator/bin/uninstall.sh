#!/bin/bash

cd "$(dirname "$0")"
helm uninstall prometheus-operator -n monitoring
