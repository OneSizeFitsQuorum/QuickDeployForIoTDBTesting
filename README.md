## 用途
本 repo 旨在容器化管理集群之前为分布式 IoTDB 伪分布式和分布式的部署测试提供方便。

## 功能介绍

### 伪分布式模式

#### 前提条件
* 打包 cluster 模块。
* 配置 local 目录下的 config 文件。

#### 使用方式
* 使用`sh cluster.sh`一键复制多个包并处理端口冲突，然后去对应的三个目录下分别开启 shell 运行 `sh sbin/start-node.sh` (Linux/MacOS) 或直接点击`start-node.bat` (Windows) 启动集群的一个节点，默认为 3 节点 2 副本的伪分布式集群。
* 使用`sh delete.sh`清除所有的数据文件和日志以支持数据清零重新启动。

注：启动时需要保证 9003-9008, 40010-40015, 55560-55562, 6667-6669, 8181-8183, 31999-32001 端口没有其他进程正在使用。

### 分布式模式

#### 前提条件
* 打包 cluster 模块。
* 配置 remote 目录下的 config 文件，比如 cluster 模块的打包路径，服务器 ip，服务器用户名，更改参数等等。
* 本机可免密登陆 config 文件服务器参数中定义的所有测试服务器，可参考此[博客](https://blog.csdn.net/jeikerxiao/article/details/84105529)配置免密登陆。
* Python3。

#### 使用方式

* 使用 `sh deploy.sh` 一键部署启动集群，默认会向远程推包，此外也可以通过 `sh deploy.sh np` 来取消推包只启动集群（建立在远程已有包的前提下）。
* 使用 `sh pull.sh` 一键拉取各个节点的日志到本地分析。
* 最后用 `sh kill.sh` 一键 kill 掉测试服务器上的分布式进程释放资源。

注：
在 iotdb 的主目录用 maven 编译 cluster 的命令：
```
mvn clean package -pl cluster -am -Dmaven.test.skip=true
```