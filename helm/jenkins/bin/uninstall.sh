#!/bin/bash

cd "$(dirname "$0")"
helm uninstall jenkins -n jenkins
