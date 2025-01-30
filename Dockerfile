FROM ubuntu:24.04
ARG TARGETPLATFORM
ENV TARGETARCH=$TARGETPLATFORM
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common \
    wget \
    gcc \
    python3-dev \
    python3-pip \
    unzip \
    openssh-client \
    python3-netaddr \
    python3-azure-cli \
    python3-ansible

COPY ./install-yq.sh .
RUN chmod +x ./install-yq.sh && bash install-yq.sh

COPY ./install-packer.sh .
RUN chmod +x ./install-packer.sh && bash install-packer.sh

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]
