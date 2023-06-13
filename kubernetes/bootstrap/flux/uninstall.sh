#!/usr/bin/env bash

# remove flux config
kubectl delete --kustomize ../../flux/config

# remove configmap
kubectl delete -f ../../flux/vars/cluster-settings.yaml

# install secrets
sops --decrypt ./secret-age-key.sops.yaml | kubectl delete -f -
sops --decrypt ./secret-github-deploy-key.sops.yaml | kubectl delete -f -
sops --decrypt ../../flux/vars/cluster-secrets.sops.yaml | kubectl delete -f -

# remove flux
kubectl delete --kustomize ./
