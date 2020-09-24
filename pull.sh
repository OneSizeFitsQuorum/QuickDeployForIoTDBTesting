source ./config.sh

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