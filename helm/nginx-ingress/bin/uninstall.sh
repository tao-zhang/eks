#!/bin/bash

#!/bin/bash

cd "$(dirname "$0")"
helm uninstall nginx-ingress -n ingress
