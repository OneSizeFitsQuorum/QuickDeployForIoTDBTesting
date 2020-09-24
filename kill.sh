source ./config.sh

for ip in ${server[*]}
do
    ssh $user@$ip "netstat -lantp | grep -i 9003 | head -n 1 | awk -F/ '{print \$1}' | awk '{print \$7}' | xargs kill -9"
done 