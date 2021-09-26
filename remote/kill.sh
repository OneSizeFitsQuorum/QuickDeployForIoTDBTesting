source ./config.sh

for ip in ${server[*]}
do
    ssh $user@$ip "cd ${serverDir}/${snapshotName};bash sbin/stop-node.sh"
done 