Powershell script to deploy and configure a virtual machine using an Azure Resource Manager template and custom script extension.

Requirements:
1. Azure PowerShell Az module - https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-4.5.0
2. Existing KeyVault and secret.

How to Use:
1. Install the PowerShell Az module or PowerShell 7.
2. Create a new KeyVault and secret - https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal
3. Edit new-vm.ps1 and update $keyVaultName and $keyVaultSecret with your new KeyVault. 
4. Edit post-deploy.ps1 to change how Chocolately configures your VM.
5. Run new-vm.ps1
6. Once the VM is ready, the script will display the FQDN.
