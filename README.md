## 用途
本 repo 的作用是给集群版 IoTDB 在容器管理化之前的部署测试提供方便。

## 环境
* 本机可免密登陆参数中的所有测试服务器，可参考此[博客](https://blog.csdn.net/jeikerxiao/article/details/84105529)配置免密登陆
* Python3

## 使用

### 主要功能
* 将 snapshot 包的一些对应参数修改并传输给所有测试服务器同时后台启动分布式集群。
* 将远程的各个包执行过程中的 log 全部打包拉到本地。
* kill 掉所有测试服务器端的分布式集群进程。

### 使用姿势
首先设置 config 脚本的参数。比如 iotdb 的打包路径，服务器 ip，服务器用户等等。

接着进入 iotdb 的 repo 目录用 maven 编译 cluster。
```
mvn clean package -pl cluster -am -Dmaven.test.skip=true
```
然后运行 `sh deploy.sh` 一键部署启动，默认会向远程推包，此外也可以通过 `sh deploy.sh np` 来取消推包只启动集群（建立在远程已有包的前提下）。

运行过程中可以使用 `sh pull.sh` 一键拉取各个节点的日志到本地分析调试。

最后用 `sh kill.sh` 一键 kill 掉测试服务器上的分布式进程释放资源。
