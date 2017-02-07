# Dockerfile for Hyperledger fabric orderer image.

FROM yeasy/hyperledger-fabric-base:latest
MAINTAINER Baohua Yang <yeasy.github.com>

#EXPOSE 7050

ENV ORDERER_CFG_PATH /etc/hyperledger/fabric/orderer

RUN mkdir -p $ORDERER_CFG_PATH

# install hyperledger fabric orderer
RUN cd $GOPATH/src/github.com/hyperledger/fabric/orderer \
        && CGO_CFLAGS=" " go install -ldflags "-X github.com/hyperledger/fabric/common/metadata.Version=1.0.0-snapshot-preview -linkmode external -extldflags '-static -lpthread'" \
        && go clean \
        && cp $GOPATH/src/github.com/hyperledger/fabric/orderer/orderer.yaml $ORDERER_CFG_PATH \
        && mkdir -p $ORDERER_CFG_PATH/msp/sampleconfig \
        && cp -r $GOPATH/src/github.com/hyperledger/fabric/msp/sampleconfig/* $ORDERER_CFG_PATH/msp/sampleconfig

CMD ["orderer"]
