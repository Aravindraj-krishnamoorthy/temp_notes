export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/../organizations/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem
export PEER0_ORG1_CA=${PWD}/../organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem
export PEER0_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/tlsca/tlsca.org2.example.com-cert.pem
export PEER0_ORG3_CA=${PWD}/organizations/peerOrganizations/org3.example.com/tlsca/tlsca.org3.example.com-cert.pem

export FABRIC_CFG_PATH=$PWD/../../config/

export CHANNEL_NAME=mychannel

setGlobalsForPeer0Org1(){
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA
    export CORE_PEER_MSPCONFIGPATH=/root/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
       

    export CORE_PEER_ADDRESS=localhost:7051
}

peerchannellist(){
    setGlobalsForPeer0Org1
    
    peer channel list
}

createChannel(){

    setGlobalsForPeer0Org1
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME \
    --ordererTLSHostnameOverride orderer.example.com \
    -f ./artifacts/${CHANNEL_NAME}.tx --outputBlock ./artifacts/${CHANNEL_NAME}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

#createChannel
#peerchannellist

#/root/fabric-samples/test-network/scripts/organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem
#/root/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem
