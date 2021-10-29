source ./config.sh

#删除所有数据并重新拷贝
rm -rf $snapshotPath/data $snapshotPath/logs
rm -rf ${snapshotPath}1 ${snapshotPath}2 ${snapshotPath}3
cp -rf $snapshotPath ${snapshotPath}1
cp -rf $snapshotPath ${snapshotPath}2
cp -rf $snapshotPath ${snapshotPath}3

##统一 seeds_node 
sed -i -e 's/^seed_nodes=127.0.0.1:9003$/seed_nodes=127.0.0.1:9003,127.0.0.1:9005,127.0.0.1:9007/g' ${snapshotPath}/conf/iotdb-cluster.properties
sed -i -e 's/^seed_nodes=127.0.0.1:9003$/seed_nodes=127.0.0.1:9003,127.0.0.1:9005,127.0.0.1:9007/g' ${snapshotPath}1/conf/iotdb-cluster.properties
sed -i -e 's/^seed_nodes=127.0.0.1:9003$/seed_nodes=127.0.0.1:9003,127.0.0.1:9005,127.0.0.1:9007/g' ${snapshotPath}2/conf/iotdb-cluster.properties
sed -i -e 's/^seed_nodes=127.0.0.1:9003$/seed_nodes=127.0.0.1:9003,127.0.0.1:9005,127.0.0.1:9007/g' ${snapshotPath}3/conf/iotdb-cluster.properties

##打开 open_server_rpc_port 
sed -i -e 's/^open_server_rpc_port=false$/open_server_rpc_port=true/g' ${snapshotPath}/conf/iotdb-cluster.properties
sed -i -e 's/^open_server_rpc_port=false$/open_server_rpc_port=true/g' ${snapshotPath}1/conf/iotdb-cluster.properties
sed -i -e 's/^open_server_rpc_port=false$/open_server_rpc_port=true/g' ${snapshotPath}2/conf/iotdb-cluster.properties
sed -i -e 's/^open_server_rpc_port=false$/open_server_rpc_port=true/g' ${snapshotPath}3/conf/iotdb-cluster.properties

#统一副本数
sed -i -e 's/^default_replica_num=3$/default_replica_num=1/g' ${snapshotPath}/conf/iotdb-cluster.properties
sed -i -e 's/^default_replica_num=3$/default_replica_num=1/g' ${snapshotPath}1/conf/iotdb-cluster.properties
sed -i -e 's/^default_replica_num=3$/default_replica_num=1/g' ${snapshotPath}2/conf/iotdb-cluster.properties
sed -i -e 's/^default_replica_num=3$/default_replica_num=1/g' ${snapshotPath}3/conf/iotdb-cluster.properties

##处理 cluster_info_public_port 冲突 
sed -i -e 's/#cluster_info_public_port=6567/cluster_info_public_port=6567/g' ${snapshotPath}/conf/iotdb-cluster.properties
sed -i -e 's/#cluster_info_public_port=6567/cluster_info_public_port=6567/g' ${snapshotPath}1/conf/iotdb-cluster.properties
sed -i -e 's/#cluster_info_public_port=6567/cluster_info_public_port=6567/g' ${snapshotPath}2/conf/iotdb-cluster.properties
sed -i -e 's/#cluster_info_public_port=6567/cluster_info_public_port=6567/g' ${snapshotPath}3/conf/iotdb-cluster.properties
sed -i -e 's/cluster_info_public_port=6567/cluster_info_public_port=6568/g' ${snapshotPath}1/conf/iotdb-cluster.properties
sed -i -e 's/cluster_info_public_port=6567/cluster_info_public_port=6569/g' ${snapshotPath}2/conf/iotdb-cluster.properties
sed -i -e 's/cluster_info_public_port=6567/cluster_info_public_port=6570/g' ${snapshotPath}3/conf/iotdb-cluster.properties

#处理 jmx port 冲突
sed -i -e 's/JMX_PORT="31999"/JMX_PORT="32000"/g' ${snapshotPath}1/conf/iotdb-env.sh
sed -i -e 's/JMX_PORT=31999/JMX_PORT=32000/g' ${snapshotPath}1/conf/iotdb-env.bat
sed -i -e 's/JMX_PORT="31999"/JMX_PORT="32001"/g' ${snapshotPath}2/conf/iotdb-env.sh
sed -i -e 's/JMX_PORT=31999/JMX_PORT=32001/g' ${snapshotPath}2/conf/iotdb-env.bat
sed -i -e 's/JMX_PORT="31999"/JMX_PORT="32002"/g' ${snapshotPath}3/conf/iotdb-env.sh
sed -i -e 's/JMX_PORT=31999/JMX_PORT=32002/g' ${snapshotPath}3/conf/iotdb-env.bat

#处理 cluster port 冲突
sed -i -e 's/internal_meta_port=9003/internal_meta_port=9005/g' ${snapshotPath}1/conf/iotdb-cluster.properties
sed -i -e 's/internal_data_port=40010/internal_data_port=40012/g' ${snapshotPath}1/conf/iotdb-cluster.properties

sed -i -e 's/internal_meta_port=9003/internal_meta_port=9007/g' ${snapshotPath}2/conf/iotdb-cluster.properties
sed -i -e 's/internal_data_port=40010/internal_data_port=40014/g' ${snapshotPath}2/conf/iotdb-cluster.properties

sed -i -e 's/internal_meta_port=9003/internal_meta_port=9009/g' ${snapshotPath}3/conf/iotdb-cluster.properties
sed -i -e 's/internal_data_port=40010/internal_data_port=40016/g' ${snapshotPath}3/conf/iotdb-cluster.properties

#处理 standalone port 冲突
sed -i -e 's/rpc_port=6667/rpc_port=6669/g' ${snapshotPath}1/conf/iotdb-engine.properties
sed -i -e 's/rpc_port=6667/rpc_port=6671/g' ${snapshotPath}2/conf/iotdb-engine.properties
sed -i -e 's/rpc_port=6667/rpc_port=6673/g' ${snapshotPath}3/conf/iotdb-engine.properties