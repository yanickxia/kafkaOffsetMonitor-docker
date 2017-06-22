FROM java

LABEL maintainer "yann.xia@daocloud.io"

ADD https://github.com/quantifind/KafkaOffsetMonitor/releases/download/v0.2.1/KafkaOffsetMonitor-assembly-0.2.1.jar  \
/usr/src/myapp/KafkaOffsetMonitor-assembly-0.2.1.jar 

WORKDIR /usr/src/myapp/

ENTRYPOINT java -cp KafkaOffsetMonitor-assembly-0.2.1.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb  --offsetStorage kafka --zk zookeeper01:2181,zookeeper02:2181,zookeeper03:2181 --port 8080  --refresh 10.seconds --retain 2.days
