FROM ubuntu:20.04

ENV TZ 'Europe/Berlin'

# timezone stuff (https://dawnbringer.net/blog/600/Docker:%20tzdata)
RUN echo $TZ > /etc/timezone && \
    apt update -y && apt install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata


RUN apt update -y && apt install -y \
      vim \
      curl

ENV NVM_DIR /root/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
      && . $NVM_DIR/nvm.sh && nvm install v16.10.0

RUN . $NVM_DIR/nvm.sh && npm i -g samfirm

WORKDIR /root/
