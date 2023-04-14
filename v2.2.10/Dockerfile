# https://github.com/yeasy/docker-hyperledger-fabric-orderer
#
# Dockerfile for Hyperledger fabric-orderer image.

FROM yeasy/hyperledger-fabric-base:2.2.10
LABEL maintainer "Baohua Yang <yeasy.github.com>"

EXPOSE 7050

ENV ORDERER_GENERAL_LOCALMSPDIR $FABRIC_CFG_PATH/msp
ENV ORDERER_GENERAL_LISTENADDRESS 0.0.0.0

RUN mkdir -p $FABRIC_CFG_PATH $ORDERER_GENERAL_LOCALMSPDIR

# Install fabric orderer
RUN CGO_CFLAGS=" " go install -tags "" -ldflags "$LD_FLAGS" github.com/hyperledger/fabric/cmd/orderer \
        && go clean

# orderer bootup requires the bootstrap block file, see orderer.yaml
CMD ["orderer", "start"]
