Error: error getting chaincode bytes: 'go list' failed with: can't load package: package /organizations/chaincode/csg_blockchain_chaincode/src/WholesalelDisputeMgmt: import "/organizations/chaincode/csg_blockchain_chaincode/src/WholesalelDisputeMgmt": cannot import absolute path: exit status 1

Error: chaincode install failed with status: 500 - failed to invoke backing implementation of 'InstallChaincode': could not build chaincode: docker build failed: docker image inspection failed: Get "http://unix.sock/images/dev-peer0-org1-wholesaledisputemgmt_v1-fafc1c29e6b6384854dd8592599d62cdb1da3d5fc5734b4e94269c1a311b4eee-df45887ad71b45c9a504cab6e26abafab016c00bfb04edc7a2d0ab2a4217e9e5/json": dial unix /var/run/docker.sock: connect: no such file or directory
===================== Chaincode is installed  =====================
root@cli-peer0-org1:/# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
