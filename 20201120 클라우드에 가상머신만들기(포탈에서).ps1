#############################################################
## PowerShell로 가상머신 만들기
#############################################################

$myID = "hahaysh01"
$myLocation = "eastus2"
$myVMSize = "Standard_DS2_v2"

New-AzVM `
    -ResourceGroupName $myID"rg" `
    -Name $myID"vm2" `
    -Location $myLocation `
    -Size $myVMSize `
    -VirtualNetworkName $myID"vnet" `
    -SubnetName $myID"sbn" `
    -SecurityGroupName $myID"nsg" `
    -PublicIpAddressName $myID"pubip" `
    -OpenPorts 80, 3389 `
    -AsJob

#############################################################
## Azure CLI로 가상머신 만들기
#############################################################

$myID = "hahaysh01"
$myLocation = "eastus2"
$myVMSize = "Standard_DS2_v2"

# 리소스 그룹 만들기
az group create --name $myID"rg” --location $myLocation

# 가상컴퓨터 만들기
az vm create --resource-group $myID"rg” --name $myID"vm3" --image "win2016datacenter" --size $myVMSize --admin-username "hahaysh" --admin-password "P@ssw0rd1234"

# 웹서버를 위한 80포트 개방
az vm open-port --port 3389 --resource-group $myID"rg" --name $myID"vm“

 