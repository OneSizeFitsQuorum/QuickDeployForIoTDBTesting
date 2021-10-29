#测试集群
server=(192.168.130.31 192.168.130.32 192.168.130.33)
#分布式集群的 SEED_NODES 参数
seeds="192.168.130.31:9003,192.168.130.32:9003,192.168.130.33:9003"
#服务器用户
user="root"
#服务器新建的文件夹名称
serverDir="txy"
#打包的文件名
snapshotName="iotdb-cluster-0.12.3-SNAPSHOT"
#本地 cluster 模块 maven 打包路径
snapshotPath="/Users/txy/Study/iotdb/cluster/target/${snapshotName}"
#测试集群的执行路径
serverPath="~/${serverDir}/${snapshotName}"
#从测试集群拉取得到的执行日志本地路径
localLogDir="result"
#更改 iotdb-cluster.properties 中的属性，用|隔开，格式为 key=value，即 key 为参数名称，value 为值的方式替代对应文件中的参数
clusterConfig="seed_nodes=${seeds}|default_replica_num=1"
#更改 iotdb-engine.properties 中的属性，用|隔开，格式为 key=value，即 key 为参数名称，value 为值的方式替代对应文件中的参数
engineConfig=""
#是否后台启动集群
execute=true
