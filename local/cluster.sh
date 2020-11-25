source ./config.sh

#删除所有数据并重新拷贝
rm -rf $snapshotPath/data $snapshotPath/logs
rm -rf ${snapshotPath}1 ${snapshotPath}2 
cp -rf $snapshotPath ${snapshotPath}1
cp -rf $snapshotPath ${snapshotPath}2

system=`uname  -a`
mac="Darwin"

if [[ $system =~ $mac ]];then
    #处理 jmx port 冲突
    sed -i '' 's/JMX_PORT="31999"/JMX_PORT="32000"/g' ${snapshotPath}1/conf/cluster-env.sh
    sed -i '' 's/JMX_PORT=31999/JMX_PORT=32000/g' ${snapshotPath}1/conf/cluster-env.bat
    sed -i '' 's/JMX_PORT="31999"/JMX_PORT="32001"/g' ${snapshotPath}2/conf/cluster-env.sh
    sed -i '' 's/JMX_PORT=31999/JMX_PORT=32001/g' ${snapshotPath}2/conf/cluster-env.bat

    #处理 cluster port 冲突
    sed -i '' 's/internal_meta_port=9003/internal_meta_port=9005/g' ${snapshotPath}1/conf/iotdb-cluster.properties
    sed -i '' 's/internal_data_port=40010/internal_data_port=40012/g' ${snapshotPath}1/conf/iotdb-cluster.properties
    sed -i '' 's/cluster_rpc_port=55560/cluster_rpc_port=55561/g' ${snapshotPath}1/conf/iotdb-cluster.properties

    sed -i '' 's/internal_meta_port=9003/internal_meta_port=9007/g' ${snapshotPath}2/conf/iotdb-cluster.properties
    sed -i '' 's/internal_data_port=40010/internal_data_port=40014/g' ${snapshotPath}2/conf/iotdb-cluster.properties
    sed -i '' 's/cluster_rpc_port=55560/cluster_rpc_port=55562/g' ${snapshotPath}2/conf/iotdb-cluster.properties

    #处理 standalone port 冲突
    sed -i '' 's/metrics_port=8181/metrics_port=8182/g' ${snapshotPath}1/conf/iotdb-engine.properties
    sed -i '' 's/rpc_port=6667/rpc_port=6668/g' ${snapshotPath}1/conf/iotdb-engine.properties

    sed -i '' 's/metrics_port=8181/metrics_port=8183/g' ${snapshotPath}2/conf/iotdb-engine.properties
    sed -i '' 's/rpc_port=6667/rpc_port=6669/g' ${snapshotPath}2/conf/iotdb-engine.properties
else
    #处理 jmx port 冲突
    sed -i 's/JMX_PORT="31999"/JMX_PORT="32000"/g' ${snapshotPath}1/conf/cluster-env.sh
    sed -i 's/JMX_PORT=31999/JMX_PORT=32000/g' ${snapshotPath}1/conf/cluster-env.bat
    sed -i 's/JMX_PORT="31999"/JMX_PORT="32001"/g' ${snapshotPath}2/conf/cluster-env.sh
    sed -i 's/JMX_PORT=31999/JMX_PORT=32001/g' ${snapshotPath}2/conf/cluster-env.bat

    #处理 cluster port 冲突
    sed -i 's/internal_meta_port=9003/internal_meta_port=9005/g' ${snapshotPath}1/conf/iotdb-cluster.properties
    sed -i 's/internal_data_port=40010/internal_data_port=40012/g' ${snapshotPath}1/conf/iotdb-cluster.properties
    sed -i 's/cluster_rpc_port=55560/cluster_rpc_port=55561/g' ${snapshotPath}1/conf/iotdb-cluster.properties

    sed -i 's/internal_meta_port=9003/internal_meta_port=9007/g' ${snapshotPath}2/conf/iotdb-cluster.properties
    sed -i 's/internal_data_port=40010/internal_data_port=40014/g' ${snapshotPath}2/conf/iotdb-cluster.properties
    sed -i 's/cluster_rpc_port=55560/cluster_rpc_port=55562/g' ${snapshotPath}2/conf/iotdb-cluster.properties

    #处理 standalone port 冲突
    sed -i 's/metrics_port=8181/metrics_port=8182/g' ${snapshotPath}1/conf/iotdb-engine.properties
    sed -i 's/rpc_port=6667/rpc_port=6668/g' ${snapshotPath}1/conf/iotdb-engine.properties

    sed -i 's/metrics_port=8181/metrics_port=8183/g' ${snapshotPath}2/conf/iotdb-engine.properties
    sed -i 's/rpc_port=6667/rpc_port=6669/g' ${snapshotPath}2/conf/iotdb-engine.properties
fi