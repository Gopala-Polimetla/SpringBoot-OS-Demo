FROM 
RUN microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y java-11-openjdk-devel \
    && microdnf clean all \
    && rpm -q java-11-openjdk-devel
ENV JAVA_HOME=/usr/lib/jvm/jre-11 \
    PATH=/usr/lib/jvm/jre-11/bin:$PATH \
    JAVA_OPTIONS="-XX:+UseContainerSupport"
RUN microdnf update && microdnf clean all
WORKDIR /usr/src/app
COPY ["/build/libs/SpringBootDemo-0.0.1-SNAPSHOT.jar","/usr/src/app/OpenShiftDemo.jar"]
EXPOSE 8080
RUN groupadd -g 1042 workloadgroup && useradd -u 1042 -g 1042 -d /home/workloaduser workloaduser
RUN chown -R workloaduser:workloadgroup /usr/src/app/
USER 1042
ENTRYPOINT ["java","-jar","/usr/src/app/OpenShiftDemo.jar"]
