FROM anapsix/alpine-java:8_jdk_nashorn

# Define environment variables.
ENV MULE_HOME=/opt/mule  \
    MAVEN_VERSION=3.8.3 \
    MAVEN_HOME=/opt/maven \
    TZ=Asia/Kolkata 

ENV PATH=$MAVEN_HOME/bin:$PATH

RUN mkdir /opt/apache-maven-${MAVEN_VERSION}  && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /fuga 

RUN mkdir /opt/apache-maven-${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION} && \
    ln -s /opt/apache-maven-${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} 

COPY apache-maven-${MAVEN_VERSION}-bin.tar.gz /fuga/

RUN echo ${TZ} > /etc/timezone

RUN cd /fuga && \ 
  tar xvzf ./apache-maven-${MAVEN_VERSION}-bin.tar.gz 

#RUN  mv /hoge/apache-maven-${MAVEN_VERSION} /opt/maven

# Define mount points.
#VOLUME ["${MULE_HOME}/logs", "${MULE_HOME}/conf", "${MULE_HOME}/apps", "${MULE_HOME}/domains"]

# Define working directory.
#WORKDIR ${MULE_HOME}

# Default http port
EXPOSE 8081