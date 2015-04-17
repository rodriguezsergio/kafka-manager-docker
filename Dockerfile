FROM hseeberger/scala-sbt

MAINTAINER Clement Laforet <sheepkiller@cultdeadsheep.org>

ENV ZK_HOST localhost:2181
ENV KM_REVISION 1102016c4c31eb33d4dd7690e25e72ec8b04d1ea

RUN cd / && \
    git clone https://github.com/yahoo/kafka-manager && \
    cd /kafka-manager && \
    git checkout ${KM_REVISION} && \
    sbt clean dist

RUN unzip  -d / /kafka-manager/target/universal/kafka-manager-1.2.0.zip

WORKDIR /kafka-manager-1.2.0

EXPOSE 9000
ENTRYPOINT ["./bin/kafka-manager"]
