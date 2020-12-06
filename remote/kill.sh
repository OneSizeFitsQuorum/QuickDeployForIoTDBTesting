source ./config.sh

for ip in ${server[*]}
do
    ssh $user@$ip "cd ${serverDir}/${snapshotName};sh sbin/stop-node.sh"
done 