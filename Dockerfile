FROM gitlab/gitlab-runner:v10.0.0

RUN curl -sSL https://get.docker.com | sh
RUN usermod -aG docker gitlab-runner

RUN apt-get -qq update &&\
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y --no-install-recommends install\
    build-essential \
    dnsutils &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
