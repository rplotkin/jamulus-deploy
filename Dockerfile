FROM amazonlinux

# RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# CMD sudo yum-config-manager --enable epel


RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
CMD yum-config-manager --add-repo http://packages.atrpms.net/dist/el5/
CMD yum-config-manager --enable epel

# RUN apt-get install build-essential libqt4-dev libjack-jackd2-dev
# this command starts with what is  equal to build-essential #not qt-devel
RUN yum install -y gcc gcc-c++ make
RUN yum install -y qt5-qtbase-devel
RUN yum install -y jack-audio-connection-kit-devel
RUN yum install -y git


# RUN yum install libqt4-dev
# RUN yum install libjack-jackd2-dev 

RUN cd /usr && git clone --verbose https://github.com/corrados/jamulus.git
WORKDIR "/usr/jamulus"
RUN ls -la
RUN pwd
RUN /usr/lib64/qt5/bin/qmake Jamulus.pro
RUN make clean
RUN make

CMD [ "./Jamulus", "-s", "-n" ]
EXPOSE 22124/udp
