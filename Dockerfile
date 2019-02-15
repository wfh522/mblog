FROM maven:3.5.4-jdk-8
MAINTAINER mtons

WORKDIR /app
ADD . /build

ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/{TZ} /etc/localtime && echo "{TZ}" > /etc/timezone

RUN cd /build && mvn package -Dmaven.test.skip=true -Ph2 \
    && cp -f target/mblog-latest.jar /app && rm -rf /build/*

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/mblog-latest.jar"]