FROM openjdk:11-jre-slim
WORKDIR /usr/src/app
COPY ["/build/libs/SpringBootDemo-0.0.1-SNAPSHOT.jar","/usr/src/app/OpenShiftDemo.jar"]
EXPOSE 8080
RUN groupadd -g 1042 workloadgroup && useradd -u 1042 -g 1042 -d /home/workloaduser workloaduser
RUN chown -R workloaduser:workloadgroup /usr/src/app/
USER 1042
ENTRYPOINT ["java","-jar","/usr/src/app/OpenShiftDemo.jar"]
