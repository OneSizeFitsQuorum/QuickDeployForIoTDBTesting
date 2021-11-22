source ./config.sh

for ip in ${server[*]}
do
    ssh $user@$ip "cd ${serverPath};bash sbin/stop-node.sh"
done 