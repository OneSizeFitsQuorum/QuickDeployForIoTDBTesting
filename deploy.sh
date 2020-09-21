#测试集群
server=(192.168.130.33 192.168.130.34 192.168.130.35)
#分布式集群的SEED_NODES参数
seeds="192.168.130.33:9003:40010:55560,192.168.130.34:9003:40010:55560,192.168.130.35:9003:40010:55560"
#打包的文件名
snapshotName="cluster-0.11.0-SNAPSHOT"
#本地的集群maven打包路径
snapshotPath="/Users/txy/Study/incubator-iotdb/cluster/target/${snapshotName}"
#服务器新建的文件夹名称
serverDir="txy_test"
#服务器用户
user="liurui"
#更改iotdb-cluster.properties中的属性，用|隔开，格式为key=value，即key为参数名称，value为值的方式替代对应文件中的参数
clusterConfig="seed_nodes=${seeds}|is_enable_raft_log_persistence=false"
#更改iotdb-engine.properties中的属性，用|隔开，格式为key=value，即key为参数名称，value为值的方式替代对应文件中的参数
engineConfig=""
#是否后台启动集群
execute=true

cp -rf $snapshotPath .
for ip in ${server[*]}
do
    python3 update.py $snapshotName/conf/iotdb-cluster.properties "cluster_rpc_ip=${ip}|${clusterConfig}"
    python3 update.py $snapshotName/conf/iotdb-engine.properties $engineConfig
    tar -cvf $snapshotName.tar $snapshotName
    ssh $user@$ip "rm -rf ${serverDir};mkdir ${serverDir};"
    scp -r $snapshotName.tar $user@$ip:~/$serverDir
    ssh $user@$ip "cd ${serverDir};tar -xvf ${snapshotName}.tar;rm ${snapshotName}.tar;"
    rm $snapshotName.tar
done 
rm -rf $snapshotName

if $execute; then
    for ip in ${server[*]}
    do
        ssh $user@$ip "cd ${serverDir}/${snapshotName};mkdir logs;nohup sh sbin/start-node.sh printgc >logs/nohup.out 2>&1 &"
    done 
fi