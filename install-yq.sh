VERSION=v4.28.1

if [[ "$TARGETARCH" = "linux/amd64" ]]
then
  BINARY=yq_linux_amd64
elif [[ "$TARGETARCH" = "linux/arm64" ]]
then
  BINARY=yq_linux_arm64
fi

wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY}.tar.gz -O - | tar xz && mv ${BINARY} /usr/bin/yq