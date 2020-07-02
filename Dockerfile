# Runner container
FROM registry.cn-hangzhou.aliyuncs.com/aliware2018/debian-jdk8:latest

COPY mesh-provider/target/mesh-provider-1.0-SNAPSHOT.jar /root/dists/mesh-provider.jar
COPY mesh-consumer/target/mesh-consumer-1.0-SNAPSHOT.jar /root/dists/mesh-consumer.jar
COPY mesh-agent/target/mesh-agent-1.0-SNAPSHOT.jar /root/dists/mesh-agent.jar

COPY docker-entrypoint.sh /usr/local/bin
COPY start-agent.sh /usr/local/bin

RUN set -ex \
 && chmod a+x /usr/local/bin/start-agent.sh \
 && mkdir -p /root/logs

# 只需暴露 consumer 服务的端口
EXPOSE 8087

ENTRYPOINT ["docker-entrypoint.sh"]
