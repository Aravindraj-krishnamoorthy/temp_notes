# temp_notes


apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
  - image: httpd
    name: mypod
    volumeMounts:
      - name: azure
        mountPath: /mnt/azure-storage
  volumes:
  - name: azure
    persistentVolumeClaim:
      claimName: azurefile


apiVersion: v1
kind: PersistentVolume
metadata:
  name: azurefile
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteMany
  azureFile:
    secretName: azure-storage-dev
    shareName: sasubfinledgerdev001
    readOnly: false
  mountOptions:
  - dir_mode=0777
  - file_mode=0777
  - uid=1000
  - gid=1000
  - mfsymlinks
  - nobrl

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: azurefile
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: ""
  resources:
    requests:
      storage: 5Gi
