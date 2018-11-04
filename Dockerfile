FROM maven:3.6.0-jdk-12-alpine

ADD server /tmp/server
WORKDIR /tmp/server
RUN mvn clean package -DskipTests=true -q

FROM node:8-alpine
add client /tmp/client
WORKDIR /tmp/client
RUN npm install
RUN npm run-script build

FROM openjdk:12-alpine
COPY --from=0 /tmp/server/target/paperbots.jar /opt/paperbots/app/paperbots.jar
COPY --from=1 /tmp/client/site /opt/paperbots/site

ADD docker/entrypoint.sh /opt/entrypoint.sh
ADD docker/config.json /etc/paperbots/config.json

ENTRYPOINT ["/opt/entrypoint.sh"]
