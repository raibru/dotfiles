#!/usr/bin/bash
#
#

src_path=$1
dest_path=$2
remote_path="ProjectsOneDrive:Backup/Projects.WS016"
remote_bak_path="$remote_path/$dest_path-$(date +%F_%W_%a)"
rclone_sync_dry="rclone sync --dry-run --transfers=20 --checkers=20 -Pv"
rclone_sync="rclone sync --transfers=20 --checkers=20 -Pv"
rclone_lsd="rclone lsd"
rclone_purge="rclone purge"

bak_max_size=7

echo "One Drive Cloud Backup"
echo "Start remote backup ..."
echo "--- source: $src_path"
echo "--- remote: $remote_path"
echo "--- backup: $remote_bak_path"

echo "--- check sync to remote backup: $latest_bak"
echo "--- $rclone_sync_dry $src_path $remote_bak_path"
$rclone_sync_dry $src_path $remote_bak_path 2> /dev/null \
  && $rclone_lsd $remote_path 2> /dev/null |grep $dest_path| sort -k 2

dest_bak_list=$($rclone_lsd $remote_path 3> /dev/null |grep $dest_path)
bak_cnt=$(echo "$dest_bak_list" |wc -l)
latest_bak=$(echo "$dest_bak_list" |sort -k 2 |grep $dest_path |head -n1 |tr -s " " " " |cut -d" " -f6)

echo "--- current backup $dest_path count: $bak_cnt from max count: $bak_max_size"
if [[ bak_cnt -ge back_max_size ]]; then
  echo "--- will purge latest remote backup: $latest_bak"
fi
echo "run purge/backup ? (n/y): [n]"
read sync_answer

if [[ "$sync_answer" != "y" ]]; then
  exit 0
fi

if [[ bak_cnt -ge bak_max_size ]]; then
  purge_path="$remote_path/$latest_bak"
  echo "$rclone_purge -Pv $purge_path"
  $rclone_purge -Pv $purge_path
  echo "... purge done"
fi

#rclone sync --transfers=20 --checkers=20 -Pv $(srcDir) ProjectsOneDrive:Backup/Projects.Legulas/pktdump-2021-11-04_44_Thu && rclone lsd ProjectsOneDrive:Backup/Projects.Legulas |grep pktdump
echo "--- backup to remote: $latest_bak"
echo "--- $rclone_sync $src_path $remote_bak_path"
$rclone_sync $src_path $remote_bak_path 2> /dev/null \
  && $rclone_lsd $remote_path 2> /dev/null |grep $dest_path| sort -k 2
echo "... backup done"

