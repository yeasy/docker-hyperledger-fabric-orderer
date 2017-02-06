# Dockerfile for Hyperledger fabric orderer image.

FROM yeasy/hyperledger-fabric-base:latest
MAINTAINER Baohua Yang <yeasy.github.com>

EXPOSE 7050

ENV ORDERER_CFG_PATH /etc/hyperledger/fabric

RUN mkdir -p $ORDERER_CFG_PATH

# install hyperledger fabric orderer
RUN cd $GOPATH/src/github.com/hyperledger/fabric/orderer \
        && CGO_CFLAGS=" " go install -ldflags "-X github.com/hyperledger/fabric/common/metadata.Version=1.0.0-snapshot-preview -linkmode external -extldflags '-static -lpthread'" \
        && cp $GOPATH/src/github.com/hyperledger/fabric/orderer/orderer.yaml $ORDERER_CFG_PATH \
        && go clean

CMD ["orderer"]
