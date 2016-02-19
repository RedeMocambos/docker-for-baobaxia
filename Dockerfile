FROM phusion/baseimage

RUN apt-get update && apt-get install -y git wget && \
    cd /root && git clone -b fix-install-for-ubuntu --single-branch https://github.com/sydro/baobaxia.git && \
    locale-gen && locale-gen pt_BR.UTF-8

RUN rm -f /etc/service/sshd/down && \
    ssh-keygen -f ~/.ssh/id_rsa -t rsa -N '' && cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

RUN wget "http://media.mocambos.net/baobaxia_20150402.tbz" -O /tmp/baobaxia.tbz && \
    tar -C /root/baobaxia/ -xvf /tmp/baobaxia.tbz --strip-components=1 baobaxia/mocambos && \
    rm -rf /tmp/* && apt-get clean && rm -rf /var/cache/apt/*

RUN mkdir -p /etc/my_init.d
ADD baobaxia-start.sh /etc/my_init.d/baobaxia-start.sh
RUN chmod +x /etc/my_init.d/baobaxia-start.sh

WORKDIR /root/baobaxia

CMD ["/sbin/my_init"]
