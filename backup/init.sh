#!/bin/sh

# This script creates folders required by other scripts
# and sets correct permissions for these folders and scripts
set -euf

DIR="$(dirname "$0")"
echo "$DIR"
. "$DIR/config.sh"

for folder in "$PIDS_FOLDER" "$LOGS_FOLDER" "$LOGS_FOLDER/scripts" ; do
  mkdir -p "$folder"
  chown $NGINX_USER:$NGINX_GROUP "$folder"
done

for file in "main_publish" "backup_publish" "main_publish_done" "backup_publish_done" ; do
  chown $NGINX_USER:$NGINX_GROUP "$DIR/$file.sh"
  chmod a+x "$DIR/$file.sh"
done

exit 0
