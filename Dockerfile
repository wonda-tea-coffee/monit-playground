FROM ubuntu:22.04

WORKDIR /work

RUN apt update && apt install -y monit

ADD monit.conf /etc/monit/conf.d/monit.conf
ADD run.sh /work/run.sh
ADD monit.sh /work/monit.sh
RUN chmod +x /work/run.sh /work/monit.sh

CMD ["/usr/bin/monit", "-I", "-c", "/etc/monit/monitrc"]
