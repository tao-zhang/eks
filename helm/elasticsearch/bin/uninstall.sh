#!/bin/bash

cd "$(dirname "$0")"
helm uninstall elasticsearch -n elk
