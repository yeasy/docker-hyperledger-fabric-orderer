# Dockerfile for Hyperledger fabric orderer image.

FROM yeasy/hyperledger-fabric-base:latest
MAINTAINER Baohua Yang <yeasy.github.com>

#EXPOSE 7050

ENV ORDERER_CFG_PATH /etc/hyperledger/fabric/

RUN mkdir -p $ORDERER_CFG_PATH

# install hyperledger fabric orderer
RUN cd $FABRIC_HOME/orderer \
        && CGO_CFLAGS=" " go install -ldflags "-X github.com/hyperledger/fabric/common/metadata.Version=1.0.0-snapshot-preview -linkmode external -extldflags '-static -lpthread'" \
        && go clean \
        && cp $FABRIC_HOME/orderer/orderer.yaml $ORDERER_CFG_PATH/ \
        && mkdir -p $ORDERER_CFG_PATH/common/configtx/tool/ \
        && cp $FABRIC_HOME/common/configtx/tool/genesis.yaml $ORDERER_CFG_PATH/

CMD ["orderer"]
