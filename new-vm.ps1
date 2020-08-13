# Get and set variables
$deploymentName = New-Guid
$randhostName = -join ((65..90) + (97..122) | Get-Random -Count 11 | ForEach-Object {[char]$_})
$lowerhostName = $randhostName.ToLower()
$resourceGroupName = "Rg-"+$lowerhostName
$SecurePassword = Read-Host -Prompt "Enter password" -AsSecureString 
$StandardPassword = ConvertFrom-SecureString $SecurePassword -AsPlainText
$vmAdminUser = "azadmin"
$scriptURL = "https://raw.githubusercontent.com/blandco/azDevBox/master/post-deploy.ps1"
$templateURL = "https://raw.githubusercontent.com/blandco/azDevBox/master/devbox-ARMTemplate.json"
$AzureLocation = "centralus"

# Login to Azure
az login

# Create the Resource Group
az group create --location $AzureLocation --name $resourceGroupName

# Deploy
az group deployment create --name $deploymentName --parameters adminUsername=$vmAdminUser --parameters adminPassword=$StandardPassword --parameters hostname=$lowerhostName --parameters scriptURL=$scriptURL --resource-group $resourceGroupName --template-uri=$templateURL

# Display the hostname.FQDN
Write-Host "Virtual machine with hostname"$lowerhostName"."$AzureLocation".cloudapp.azure.com is ready."

# ARM template validation command #
# az group deployment validate --parameters adminUsername=$vmAdminUser --parameters adminPassword=$SecurePassword --parameters hostname=$lowerhostName --parameters scriptURL=$scriptURL --resource-group $resourceGroupName --template-uri=$templateURL
