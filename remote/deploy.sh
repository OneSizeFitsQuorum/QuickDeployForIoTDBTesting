source ./config.sh

if [ "$1" != "np" ]; then
    cp -rf $snapshotPath/lib .
    for ip in ${server[*]}
    do
        ssh $user@$ip "rm -rf ${serverPath}/lib"
        scp -r lib $user@$ip:$serverPath/
    done 
    rm -rf lib
fi

if $execute; then
    for ip in ${server[*]}
    do
        ssh $user@$ip "cd ${serverDir}/${snapshotName};rm -rf logs;rm -rf data;rm -rf ~/data;mkdir logs;nohup sh sbin/start-node.sh printgc >logs/nohup.out 2>&1 &"
    done 
fi