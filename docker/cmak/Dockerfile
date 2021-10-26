FROM ubuntu:18.04

LABEL author="hanyoon" email="mit2011@naver.com"
LABEL version="0.1"

ARG CMAK_VERSION=3.0.0.5
ARG SCALA_VERSION=2.13.6
ARG SBT_VERSION=1.5.5

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y openjdk-11-jre-headless \
        curl \
        wget \
        unzip \
        gnupg2

# scala install 
RUN wget -q https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb -O scala.deb && \
    dpkg -i scala.deb && \
    rm scala.deb 

# sbt install
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && \
    echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && \
    curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && \
    apt-get update -y && \
    apt-get install sbt -y


# cmak install
WORKDIR /opt
RUN mkdir src && \
    wget https://github.com/yahoo/CMAK/archive/$CMAK_VERSION.tar.gz -O ./cmak.tar.gz && \
    tar -xzvf cmak.tar.gz --strip 1 -C src && \
    rm cmak.tar.gz && \
    cd src && \
    sbt clean dist && \
    cd /opt && \
    unzip ./src/target/universal/cmak-$CMAK_VERSION.zip -d . && \
    rm -rf src && \
    ln -s /opt/cmak-$CMAK_VERSION /opt/cmak && \
    ln -s /opt/cmak-$CMAK_VERSION/conf /etc/cmak


EXPOSE 9000
ENTRYPOINT /opt/cmak/bin/cmak -Dconfig.file=/etc/cmak/application.conf -Dhttp.port=9000
