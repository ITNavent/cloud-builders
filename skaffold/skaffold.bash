#!/bin/bash
set -e

# Invoke kubectl.bash to process CLOUDSDK_* environment variables and make a
# call to the cluster to verify connectivity.
/builder/helm.bash version

gcloud auth configure-docker

ls -ltra

echo "Running: skaffold $@"
skaffold "$@"
