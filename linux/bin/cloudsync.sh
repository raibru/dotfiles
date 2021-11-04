#!/usr/bin/bash
#
#

src_path=$1
dest_path=$2
dry_run=$3
remote_path="ProjectsOneDrive:Backup/Projects.Legulas"
remote_bak_path="$remote_path/$dest_path-$(date +%F_%W_%a)"
rclone_sync="rclone sync $dry_run --transfers=20 --checkers=20 -Pv"
rclone_lsd="rclone lsd"
rclone_prune="rclone prune"

bak_max_size=7

echo "One Drive Cloud Backup"
echo "Start remote backup ..."
echo "--- source: $src_path"
echo "--- remote: $remote_path"
echo "--- backup: $remote_bak_path"

dest_bak_list=$($rclone_lsd $remote_path 2> /dev/null |grep $dest_path)
bak_cnt=$(echo "$dest_bak_list" |wc -l)
echo "--- current backup $dest_path count: $bak_cnt"

if [[ bak_cnt -ge bak_max_size ]]; then
  latest_bak=$(echo "$dest_bak_list" |sort -k 2 |grep $dest_path |head -n1 |tr -s " " " " |cut -d" " -f6)
  echo "--- prune latest remote backup: $latest_bak"
  prune_path="ProjectsOneDrive:Backup/Projects.Legulas/$latest_bak"
  echo "$rclone_prune -Pv $prune_path"
  echo "... prune done"
fi

#rclone sync --transfers=20 --checkers=20 -Pv $(srcDir) ProjectsOneDrive:Backup/Projects.Legulas/pktdump-2021-11-04_44_Thu && rclone lsd ProjectsOneDrive:Backup/Projects.Legulas |grep pktdump
echo "--- sync to remote backup: $latest_bak"
echo "--- $rclone_sync $src_path $remote_bak_path"
$rclone_sync $src_path $remote_bak_path 2> /dev/null \
  && $rclone_lsd $remote_path 2> /dev/null |grep $dest_path| sort -k 2
echo "... sync done"