FROM gitlab/gitlab-runner:v1.11.1

RUN curl -sSL https://get.docker.com | sh
RUN usermod -aG docker gitlab-runner

RUN apt-get -qq update &&\
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y --no-install-recommends install\
    build-essential &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl &&\
    chmod +x ./kubectl &&\
    sudo mv ./kubectl /usr/local/bin/kubectl

RUN curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
