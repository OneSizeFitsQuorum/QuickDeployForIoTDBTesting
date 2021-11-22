#测试集群
server=(172.20.70.66 172.20.70.67 172.20.70.68)
#分布式集群的 SEED_NODES 参数
seeds="172.20.70.66:9003,172.20.70.67:9003,172.20.70.68:9003"
#服务器用户
user="cluster"
#服务器测试路径
serverDir="~/txy"
#打包的文件名
snapshotName="iotdb-cluster-0.13.0-SNAPSHOT"
#本地 cluster 模块 maven 打包路径
snapshotPath="/Users/txy/Study/iotdb/cluster/target/${snapshotName}"
#测试集群的执行路径
serverPath="${serverDir}/${snapshotName}"
#从测试集群拉取得到的执行日志本地路径
localLogDir="result"
#更改 iotdb-cluster.properties 中的属性，用|隔开，格式为 key=value，即 key 为参数名称，value 为值的方式替代对应文件中的参数
clusterConfig="seed_nodes=${seeds}|default_replica_num=1"
#更改 iotdb-engine.properties 中的属性，用|隔开，格式为 key=value，即 key 为参数名称，value 为值的方式替代对应文件中的参数
engineConfig=""
#是否后台启动集群
execute=true
