FROM apache/nifi:latest

#LABEL site="https://nifi.apache.org"

#RUN java -Dcom.cun.net.ssl.checkRevocation=false

USER root
RUN apt update && apt install -y vim 
COPY s1cacert.pem /opt/java/openjdk/lib/security/s1cacert.pem
RUN keytool -import -noprompt -v -trustcacerts -alias server1c -file /opt/java/openjdk/lib/security/s1cacert.pem -keystore /opt/java/openjdk/lib/security/cacerts -keypass changeit -storepass changeit