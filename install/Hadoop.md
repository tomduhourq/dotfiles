### Hadoop install
Hadoop uses ssh to access its nodes in a safe way.
Using passwordless keys is a very bad practice, but to perform
a single node implementation this should suffice.
``` 
$ ssh-keygen -t rsa -P ''
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
$ wget http://apache.dattatec.com/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
$ tar xfz hadoop-2.6.0.tar.gz
$ sudo mv hadoop-2.6.0 /usr/local/hadoop
``` 

### ~/.bashrc or ~/.zshrc
``` 
#HADOOP VARIABLES START
export HADOOP_INSTALL=/usr/local/hadoop
export PATH=$PATH:$HADOOP_INSTALL/bin
export PATH=$PATH:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
#HADOOP VARIABLES END 
``` 
Next files are under ```HADOOP_COMMON_HOME/etc/hadoop``` 
### hadoop-env.sh
Check if this file contains the definition of ```JAVA_HOME```

### core-site.xml 
``` xml
<configuration>
    <property>
        <name>fs.default.name</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>
``` 
### yarn-site.xml
``` xml
<configuration>
    <property>
    	<name>yarn.nodemanager.aux-services</name>
	    <value>mapreduce_shuffle</value>
    </property>
    <property>
    	<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
	    <value>org.apache.hadoop.mapred.ShuffleHandler</value>
    </property>
</configuration>
``` 
### mapred-site.xml
``` $ sudo cp /usr/local/hadoop/etc/hadoop/mapred-site.xml.template /usr/local/hadoop/etc/hadoop/mapred-site.xml``` 
``` xml
<configuration>
    <property>
    	<name>mapreduce.framework.name</name>
    	<value>yarn</value>
    </property>
</configuration>
``` 
### hdfs-site.xml
This file should be configured for each utilized host in the cluster, its function is to specify the **namenode** and **datanode** directories.
``` 
$ sudo mkdir -p /usr/local/hadoop_store/hdfs/{namenode,datanode} && sudo chown -cR user /usr/local/hadoop_store/hdfs/{namenode,datanode}
```
``` xml
<configuration>
    <property>
	    <name>dfs.replication</name>
	    <value>1</value>
    </property>
    <property>
	    <name>dfs.namenode.name.dir</name>
	    <value>file:/usr/local/hadoop_store/hdfs/namenode</value>
    </property>
    <property>
    	<name>dfs.datanode.data.dir</name>
    	<value>file:/usr/local/hadoop_store/hdfs/datanode</value>
    </property>
</configuration>
```
### Format HDFS and start
```
$ hdfs namenode -format
$ start-dfs.sh
```

