AZURE_CLIENT_ID = ""
AZURE_CLIENT_SECRET = ""
AZURE_TENANT_ID = ""
ACR_REGISTRY = ""
ACR_IMAGE_NAME = ".azurecr.io/basic:1"

az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
docker login -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET ${ACR_REGISTRY}
docker push ${ACR_IMAGE_NAME}
docker logout ${ACR_REGISTRY}
