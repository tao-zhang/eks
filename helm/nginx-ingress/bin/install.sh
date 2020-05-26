#!/bin/bash

#!/bin/bash

cd "$(dirname "$0")"
helm install nginx-ingress stable/nginx-ingress -n ingress -f ../values.yaml 
