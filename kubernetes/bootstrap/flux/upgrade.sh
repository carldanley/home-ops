#!/usr/bin/env bash

# check the conflicts first before running this command
#   - if the conflicts are regarding the "manager"'s k8s resources, run the command below
kubectl apply --server-side -f https://github.com/fluxcd/flux2/releases/latest/download/install.yaml --force-conflicts
