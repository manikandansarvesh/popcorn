FROM maven:3.8.1-openjdk-11

#WORKDIR /UserExample
#COPY pom.xml /UserExample
#COPY settings.xml /UserExample
#COPY src/test/java /UserExample/src/test/java
#RUN mvn -B -f /pom.xml prepare-package -DskipTests
#CMD ["/UserExample/maven_runner.sh"]


#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app

#COPY settings.xml /usr/share/maven/ref/
#COPY pom.xml /tmp/pom.xml

#COPY . /usr/src/app

#RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings.xml prepare-package -DskipTests

#CMD ["/usr/src/app/maven_runner.sh"]