# Azure CLI로 Web App 만들기
# Azure Cloud Shell (PowerShell에서 실행)
# Replace the following URL with a public GitHub repo URL 
$gitrepo="https://github.com/Azure-Samples/php-docs-hello-world"
$myresourcegroup="hahaysh01rg"
$webappname="hahaysh01webapp2"
$webappplan="hahaysh01asp"

# Create a resource group.
# az group create --location eastus --name $myresourcegroup
# Create an App Service plan in `FREE` tier. 
# az appservice plan create --name $webappplan --resource-group $myresourcegroup --sku FREE
# Create a web app. 
az webapp create --name $webappname --resource-group $myresourcegroup --plan $webappplan
# Deploy code from a public GitHub repository. 
az webapp deployment source config --name $webappname --resource-group $myresourcegroup --repo-url $gitrepo --branch master --manual-integration 


# Azure PowerShell 로 Web App 만들기
# Azure Cloud Shell (PowerShell)
# Replace the following URL with a public GitHub repo URL 
$gitrepo="https://github.com/hahaysh/Azure-Samples.git" 
$myresourcegroup="hahaysh01rg"
$webappname="hahaysh01webapp3"
$webappplan="hahaysh01asp"
$location="East US2" 

# Create a resource group. 
# New-AzResourceGroup -Name $myresourcegroup -Location $location 

# Create an App Service plan in Free tier. 
# New-AzAppServicePlan -Name $webappplan -Location $location -ResourceGroupName $myresourcegroup -Tier Free 

# Create a web app. 
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappplan -ResourceGroupName $myresourcegroup 

# Configure GitHub deployment from your GitHub repo and deploy once. 
$PropertiesObject = @{
repoUrl = "$gitrepo";
branch = "master";
isManualIntegration = "true"; 
} 
Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $myresourcegroup -ResourceType Microsoft.Web/sites/sourcecontrols -ResourceName $webappname/web -ApiVersion 2015-08-01 -Force


