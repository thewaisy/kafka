FROM openjdk:11.0.12-jre-slim

LABEL author="hanyoon" email="mit2011@naver.com"

# arg
ARG SCALA_VERSION=2.13.6
ARG KAKFA_VERSION=2.8.1
ARG KAKFA_SCALA_VERSION=2.13

# env
ENV SCALA_HOME=/usr/local/scala

RUN apt-get upgrade -y && \
    apt-get update && \
    apt-get install -y curl vim wget software-properties-common \
        ssh net-tools ca-certificates jq


# install scala
RUN cd /tmp && \
    wget --no-verbose https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz && \
    tar xzf scala-${SCALA_VERSION}.tgz && \
    mkdir ${SCALA_HOME} && \
    rm /tmp/scala-${SCALA_VERSION}/bin/*.bat && \
    mv /tmp/scala-${SCALA_VERSION}/bin /tmp/scala-${SCALA_VERSION}/lib ${SCALA_HOME} && \
    ln -s ${SCALA_HOME}/bin/* /usr/bin/ && \
    rm -rf /tmp/* && \
    scala -version


# install kafka
RUN cd /opt && \
    wget https://archive.apache.org/dist/kafka/${KAKFA_VERSION}/kafka_${KAKFA_SCALA_VERSION}-${KAKFA_VERSION}.tgz && \
    tar xzf kafka_${KAKFA_SCALA_VERSION}-${KAKFA_VERSION}.tgz && \
    ln -s /opt/kafka_${KAKFA_SCALA_VERSION}-${KAKFA_VERSION} /kafka


EXPOSE 2181 9092

COPY ./sh/kafka_start.sh /
CMD ["/bin/bash", "/kafka_start.sh"]
