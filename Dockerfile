FROM gitlab/gitlab-runner

RUN curl -sSL https://get.docker.com | sh
RUN usermod -aG docker gitlab-runner
