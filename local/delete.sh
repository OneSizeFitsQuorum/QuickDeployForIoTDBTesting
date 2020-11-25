source ./config.sh

#删除所有数据
rm -rf $snapshotPath/data $snapshotPath/logs
rm -rf ${snapshotPath}1/data ${snapshotPath}1/logs
rm -rf ${snapshotPath}2/data ${snapshotPath}2/logs