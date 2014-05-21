FROM		busybox
MAINTAINER 	ffouquet@kevoree.org
ENV			JAVA_HOME /usr/lib/jvm/java-se-8-ri-compact1
ENV			PATH $PATH:$JAVA_HOME/bin
ADD 		http://www.java.net/download/openjdk/jdk8/ri/openjdk_jre_ri-8-b129-compact1-linux-i586-06_feb_2014.tar.gz /usr/lib/jvm/
RUN			gunzip /usr/lib/jvm/openjdk_jre_ri-8-b129-compact1-linux-i586-06_feb_2014.tar.gz
RUN			tar -xf /usr/lib/jvm/openjdk_jre_ri-8-b129-compact1-linux-i586-06_feb_2014.tar -C /usr/lib/jvm
RUN			rm /usr/lib/jvm/openjdk_jre_ri-8-b129-compact1-linux-i586-06_feb_2014.tar
RUN 		mv /usr/lib/jvm/java-se-8-ri-compact1 /usr/lib/jvm

# add kevoree watchdog
ADD 		org.kevoree.watchdog-0.21.jar /root/kevboot.jar

# add libc-i386 libraries
ADD 		lib/ld-linux.so.2 /lib/
ADD 		lib32 /lib/
RUN			chmod +x /lib/*