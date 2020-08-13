# Get and set variables
$deploymentName = New-Guid
$randhostName = -join ((65..90) + (97..122) | Get-Random -Count 11 | ForEach-Object {[char]$_})
$lowerhostName = $randhostName.ToLower()
$resourceGroupName = "Rg-"+$lowerhostName
$SecurePassword = Read-Host -Prompt "Enter password" -AsSecureString 
$StandardPassword = ConvertFrom-SecureString $SecurePassword -AsPlainText
$vmAdminUser = "azadmin"
$scriptURL = "https://gist.githubusercontent.com/blandco/f49450e545ea3acc1d0cf2bfc1e38162/raw/81e20f5a7308f8fd12995540de7e26004084dd80/devbox.ps1"
$templateURL = "https://gist.githubusercontent.com/blandco/c652afac6297e96501c76253a9d16506/raw/12ad97ceb5e34f6bf0ca800e49c43bf6d0b99d54/devbox-ARMTemplate.json"
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
