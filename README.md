# IMPORT PROJECT

- Go to: [Azure DevOps Services Demo Generator](https://azuredevopsdemogenerator.azurewebsites.net/)

<!-- ![alt](1.png) -->

- Download [AUGP-DO.zip](AUGP-DO.zip)

<!-- ![alt](2.png)

![alt](3.png)

![alt](4.png) -->

# CREATE RGs

## Connect to Azure using Powershell

```powershell
Connect-AzAccount -DeviceAuth
```

## Crate resource groups

```powershell
$workloadName = 'frontend' + 'YOURSUFFIX'
$location = 'westeurope'
$environments = 'shared', 'dev', 'prod' 
$environments | % { New-AzResourceGroup -Name "rg-$( $workloadName )-$( $_ )" -Location $location }
```

# CLONE REPO

```
git clone https://ja@dev.azure.com/augp/AUGP-DO2/_git/AUGP-DO
cd AUGP-DO

git checkout -b ft_lab
```
