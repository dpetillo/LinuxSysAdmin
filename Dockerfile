FROM centos 

RUN yum -y install openssh
RUN yum -y install openssh-clients

ENTRYPOINT [ "tail -f /dev/null" ]
