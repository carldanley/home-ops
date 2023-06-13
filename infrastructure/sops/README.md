# sops

## Getting Started

### Generate some keys

- `mkdir -p ~/.config/sops/age`
- `age-keygen -o ~/.config/sops/age/keys.txt`

### Setup Environment Variables

- `export SOPS_AGE_KEY_FILE=$XDG_CONFIG_HOME/sops/age/keys.txt`

### Encrypt a file

- `sops -e -i myfile.yaml`

### Decrypt a file

- `sops -d -i myfile.yaml`
