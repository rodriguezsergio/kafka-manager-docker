FROM hseeberger/scala-sbt

MAINTAINER Clement Laforet <sheepkiller@cultdeadsheep.org>

ENV ZK_HOST localhost:2181
ENV KM_REVISION 2e5bb256f2035a81cc1a571b2e9612dd5916c474

RUN cd / && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /kafka-manager && \
    git checkout ${KM_REVISION} && \
    sbt clean dist && \
    unzip  -d / ./target/universal/kafka-manager-1.0-SNAPSHOT.zip

WORKDIR /kafka-manager-1.0-SNAPSHOT

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager"]
