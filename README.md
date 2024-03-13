Error: error getting chaincode bytes: 'go list' failed with: can't load package: package /organizations/chaincode/csg_blockchain_chaincode/src/WholesalelDisputeMgmt: import "/organizations/chaincode/csg_blockchain_chaincode/src/WholesalelDisputeMgmt": cannot import absolute path: exit status 1

Error: chaincode install failed with status: 500 - failed to invoke backing implementation of 'InstallChaincode': could not build chaincode: docker build failed: docker image inspection failed: Get "http://unix.sock/images/dev-peer0-org1-wholesaledisputemgmt_v1-fafc1c29e6b6384854dd8592599d62cdb1da3d5fc5734b4e94269c1a311b4eee-df45887ad71b45c9a504cab6e26abafab016c00bfb04edc7a2d0ab2a4217e9e5/json": dial unix /var/run/docker.sock: connect: no such file or directory
===================== Chaincode is installed  =====================
root@cli-peer0-org1:/# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES


https://verizon.webex.com/meet/ashish.shahane

ESCC invoke result: response:<status:500 message:"make sure the chaincode wholesaleclaim has been successfully defined on channel mychannel and try again: chaincode wholesaleclaim not found" >
Error: endorsement failure during invoke. response: status:500 message:"make sure the chaincode wholesaleclaim has been successfully defined on channel mychannel and try again: chaincode wholesaleclaim not found"


committed with status (ENDORSEMENT_POLICY_FAILURE) at peer0-org2:7051
Error: transaction invalidated with status (ENDORSEMENT_POLICY_FAILURE)


ESCC invoke result: response:<status:500 message:"error in simulation: failed to execute transaction 8e8ac4e0148d809cdf68aa968dc5690eb22848553ef2612bf593fd25bb416f85: could not launch chaincode wholesaleclaim:2c9ee2c2bc9adc7ff61cd85baa37f843879a0d8bbd0f06dbc6e0eb3f1c9a4aaa: connection to wholesaleclaim:2c9ee2c2bc9adc7ff61cd85baa37f843879a0d8bbd0f06dbc6e0eb3f1c9a4aaa failed: error cannot create connection for wholesaleclaim:2c9ee2c2bc9adc7ff61cd85baa37f843879a0d8bbd0f06dbc6e0eb3f1c9a4aaa: error creating grpc connection to wholesaleclaim-org2:7052: failed to create new connection: connection error: desc = \"transport: error while dialing: dial tcp: lookup wholesaleclaim-org2 on 10.2.0.10:53: no such host\"" >
Error: endorsement failure during invoke. response: status:500 message:"error in simulation: failed to execute transaction 8e8ac4e0148d809cdf68aa968dc5690eb22848553ef2612bf593fd25bb416f85: could not launch chaincode wholesaleclaim:2c9ee2c2bc9adc7ff61cd85baa37f843879a0d8bbd0f06dbc6e0eb3f1c9a4aaa: connection to wholesaleclaim:2c9ee2c2bc9adc7ff61cd85baa37f843879a0d8bbd0f06dbc6e0eb3f1c9a4aaa failed: error cannot create connection for wholesaleclaim:2c9ee2c2bc9adc7ff61cd85baa37f843879a0d8bbd0f06dbc6e0eb3f1c9a4aaa: error creating grpc connection to wholesaleclaim-org2:7052: failed to create new connection: connection error: desc = \"transport: error while dialing: dial tcp: lookup wholesaleclaim-org2 on 10.2.0.10:53: no such host\""

In case if /r: command not found is not found error is thrown try the following command

sed -i 's/\r$//' scriptname

explanation
 Option -i is for in-place editing, we delete the trailing \r directly in the input file. thus be careful to type the pattern correctly

export CORE_PEER_ADDRESS=ctlorg-peer1:7051
peer lifecycle \
    chaincode approveformyorg \
    --channelID ${CHANNEL_NAME} \
    --name ${CHAINCODE_NAME} \
    --version 1 \
    --package-id ${cc_id} \
    --sequence ${seq} \
    -o ${ORDERER_IP}:7070 \
--ordererTLSHostnameOverride ordorg-orderer1 \
    --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/organizations/ordererOrganizations/ordorg.verizon.com/msp/tlscacerts/ordorg-tls-ca.pem \
--waitForEvent

peer channel \
    fetch  \
    config cfg_block.pb \
    -c vzlumenchannel \
    -o ordorg-orderer1:7070 \
--ordererTLSHostnameOverride ordorg-orderer1 \
    --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/organizations/ordererOrganizations/ordorg.verizon.com/msp/tlscacerts/ordorg-tls-ca.pem 

    https://teams.microsoft.com/l/meetup-join/19%3ameeting_NGFhYjE2MDUtM2VlYy00ZDlkLWI2NDQtMmQwODY3MjI5YjRi%40thread.v2/0?context=%7b%22Tid%22%3a%2272b17115-9915-42c0-9f1b-4f98e5a4bcd2%22%2c%22Oid%22%3a%225cdeb330-716b-4268-9fae-2be60d3bbe2e%22%7d

https://teams.microsoft.com/l/meetup-join/19%3ameeting_YjgzNGMzZDItYmJkYy00OWQyLWE5ZmUtMWYzY2E0NjBiYWQw%40thread.v2/0?context=%7b%22Tid%22%3a%2272b17115-9915-42c0-9f1b-4f98e5a4bcd2%22%2c%22Oid%22%3a%22f5cccbe0-df10-4816-995d-b5f9a95cbcab%22%7d
