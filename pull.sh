#测试集群
server=(192.168.130.32 192.168.130.34 192.168.130.35)
#服务器用户
user="liurui"
#从测试集群拉取得到的执行日志本地路径
localLogDir="result"
#测试集群的执行路径
serverPath="~/txy_test/cluster-0.11.0-SNAPSHOT"

mkdir result
for ip in ${server[*]}
do
    rm -rf $localLogDir/$ip
    mkdir $localLogDir/$ip
    ssh $user@$ip "cd ${serverPath};tar -cvf logs.tar logs"
    scp -r $user@$ip:$serverPath/logs.tar $localLogDir/$ip/
    tar -xvf $localLogDir/$ip/logs.tar -C $localLogDir/$ip/
    rm $localLogDir/$ip/logs.tar 
done 