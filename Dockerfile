# Dockerfile for Hyperledger fabric orderer image.

FROM yeasy/hyperledger-fabric-base:latest
MAINTAINER Baohua Yang <yeasy.github.com>

# install hyperledger fabric orderer
RUN cd $GOPATH/src/github.com/hyperledger/fabric/orderer \
        && go install \
        && cp $GOPATH/src/github.com/hyperledger/fabric/orderer/orderer.yaml $GOPATH/bin \
        && go clean

CMD ["orderer"]
