# azDevBox

Powershell script to deploy and configure a virtual machine using an Azure Resource Manager template and custom script extension.

## Requirements:
1. Azure PowerShell Az module.
2. Existing Azure KeyVault and secret.

## How to Use:
1. [Install the PowerShell Az module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-4.5.0).
2. [Create a new KeyVault and secret](https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal).
3. Edit new-vm.ps1 and update $keyVaultName and $keyVaultSecret with your new KeyVault and secret name. 
4. Edit post-deploy.ps1 to change how Chocolately configures your VM. (*Or use the script to do anything else*)
5. Run new-vm.ps1
6. Once the VM is ready, the script will display the FQDN.

# ![Image showing script output of hostname and script runtime](https://raw.githubusercontent.com/blandco/azDevBox/master/script-output.png)

### References
+ [Create a Virtual Machine with Azure Resource Manager (ARM) Templates and use Chocolatey to install software](http://www.frankysnotes.com/2018/04/dont-install-your-software-yourself.html).
+ [Add variables to your ARM template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-add-variables?tabs=azure-powershell).
+ [Deploy applications to a Windows virtual machine in Azure with the Custom Script Extension](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-automate-vm-deployment).