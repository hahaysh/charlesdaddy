# CloudShell에 로그인
# Bash 셸로 변경

# 샘플 파일 클론
git clone https://github.com/hahaysh/mslearn-deploy-run-container-app-service
cd mslearn-deploy-run-container-app-service/dotnet

# 전역 선언
MYID=hahaysh01
RES_GROUP=$MYID"rg"
ACR_NAME=$MYID"acr"

# 리소스그룹이랑 ACR을 만듭니다. 
az group create --resource-group $RES_GROUP --location eastus2
az acr create --resource-group $RES_GROUP --name $ACR_NAME --sku Standard --location eastus2  --admin-enabled true

# ACR Tasks를 이용해서 코드 샘플에서 컨테이너 이미지를 빌드합니다.
az acr build --registry $ACR_NAME --image webimage .
