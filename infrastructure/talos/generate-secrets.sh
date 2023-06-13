#!/usr/bin/env bash

# Generate new secrets for this cluster
talosctl gen secrets -o talsecret.sops.yaml --force
