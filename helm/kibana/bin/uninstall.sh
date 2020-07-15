#!/bin/bash

cd "$(dirname "$0")"
helm uninstall kibana -n elk
