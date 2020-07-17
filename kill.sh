#测试集群
server=(192.168.130.32 192.168.130.34 192.168.130.35)
#服务器用户
user="liurui"

for ip in ${server[*]}
do
    ssh $user@$ip "netstat -lantp | grep -i 9003 | head -n 1 | awk -F/ '{print \$1}' | awk '{print \$7}' | xargs kill -9"
done 