# temp_notes

https://github.com/hyperledger/fabric/issues/3780

apiVersion: v1
kind: Pod
metadata:
  name: cli-peer0-org1
  annotations:
    io.kubernetes.cri-o.userns-mode: "auto:size=65536"
spec:
  runtimeClassName: sysbox-runc
  containers:
  - name: cli-peer0-org1
    image: acrfinledgerqacentralus01.azurecr.io/ubuntu-sysbox:1
    env:
      - name: ORDERER_CA
        value: /organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
      - name: CORE_PEER_ADDRESS
        value: peer0-org1:7051
      - name: CORE_PEER_ID
        value: cli.peer0.org1.example.com
      - name: CORE_PEER_LOCALMSPID
        value: Org1MSP
      - name: CORE_PEER_MSPCONFIGPATH
        value: /organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
      - name: CORE_PEER_TLS_CERT_FILE
        value: /organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
      - name: CORE_PEER_TLS_ENABLED
        value: "true"
      - name: CORE_PEER_TLS_KEY_FILE
        value: /organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
      - name: CORE_PEER_TLS_ROOTCERT_FILE
        value: /organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
      - name: GOPATH
        value: /opt/gopath
      - name: SYS_CHANNEL
        value: system-channel
      - name: CORE_CHAINCODE_BUILDER
        value: hyperledger/fabric-ccenv:1.4.8
      - name: FABRIC_LOGGING_SPEC
        value: DEBUG
    volumeMounts:
      - mountPath: /organizations
        name: fabricfiles
        subPath: organizations
      - mountPath: /configtx
        name: fabricfiles
        subPath: configtx
      - mountPath: /channel-artifacts
        name: fabricfiles
        subPath: channel-artifacts
      - mountPath: /scripts
        name: fabricfiles
        subPath: scripts
      - mountPath: /opt/gopath/src/github.com/chaincode
        name: fabricfiles
        subPath: chaincode
      - mountPath: /etc/hyperledger/fabric/core.yaml
        name: builders-config
    command: ["/sbin/init"]
  volumes:
  - name: fabricfiles
    persistentVolumeClaim:
      claimName: pvc-azurefile
  - name: builders-config
    configMap:
      name: builders-config
      items:
        - key: core.yaml
          path: core.yaml
  restartPolicy: Never
