FROM debian:stable

LABEL Anderson C Silva <andersondevmail@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ARG UNIQUSH_VERSION=2.4.0

WORKDIR /opt/uniqush

COPY uniqush-push.conf ./

ADD https://github.com/uniqush/uniqush-push/releases/download/${UNIQUSH_VERSION}/uniqush-push_${UNIQUSH_VERSION}_amd64.deb /tmp/
RUN dpkg -i /tmp/uniqush-push_${UNIQUSH_VERSION}_amd64.deb && rm /tmp/uniqush-push_${UNIQUSH_VERSION}_amd64.deb 

RUN apt-get -q update && \
    apt-get -q -y --no-install-recommends install \
        ca-certificates && \
    apt-get -q clean && \
    apt-get -q -y autoremove && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9898

CMD uniqush-push -config /opt/uniqush/uniqush-push.conf