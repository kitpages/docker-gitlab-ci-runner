FROM gitlab/gitlab-runner

RUN curl -sSL https://get.docker.com | sh
RUN usermod -aG docker gitlab-runner

RUN curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
