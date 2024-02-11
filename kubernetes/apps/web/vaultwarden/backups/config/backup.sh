#!/bin/sh

# Backup Script
# Note: this closely follows the information found here:
# https://github.com/dani-garcia/vaultwarden/wiki/Backing-up-your-vault

# setup a few variables
BACKUP_TIME_STR=$(date '+%Y%m%d-%H%M')
echo "BACKUP TIME: $BACKUP_TIME_STR"

# make sure we have sqlite3 installed
apk update
apk add sqlite curl tzdata

# download minio client binary
curl https://dl.min.io/client/mc/release/linux-amd64/mc --create-dirs -o $HOME/minio-binaries/mc
chmod +x $HOME/minio-binaries/mc
export PATH=$PATH:$HOME/minio-binaries/

# setup alias
mc alias set backup $MINIO_S3_URL $AWS_SECRET_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY

# test alias for connectivity
mc admin info backup

# setup the backup folder
mkdir -p /backup

# backup sqlite3 database
sqlite3 /vaultwarden-data/db.sqlite3 "VACUUM INTO '/backup/db-${BACKUP_TIME_STR}.sqlite3'"

# backup attachments and sends
cp -r /vaultwarden-data/attachments/ /backup/
cp -r /vaultwarden-data/sends/ /backup/

# backup RSA keys (used for JWTs - logged in users)
cp /vaultwarden-data/rsa_key.der /backup/
cp /vaultwarden-data/rsa_key.pem /backup/
cp /vaultwarden-data/rsa_key.pub.der /backup/
cp /vaultwarden-data/rsa_key.pub.pem /backup/

# show the contents of the directory for logging purposes
ls -la /backup/

# tarball backup directory
tar -czvf $HOME/backup-$BACKUP_TIME_STR.tar.gz /backup

# ship the tarball to s3 backup
mc cp $HOME/backup-$BACKUP_TIME_STR.tar.gz backup/vaultwarden-backups/