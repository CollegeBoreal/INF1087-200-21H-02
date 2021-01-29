# :tada: Vérification Prof

Afin de pouvoir vérifier votre travail, je dois avoir accès à vos machines. Pour cela, vous devez créer mon utilisateur.


## :a: Utilisateur pour le prof

Sous [@PowerShell](https://docs.microsoft.com/en-us/powershell)



#### :one: Entrer la commande ci-dessous, 

* Taper Enter et Donner `B0r34l$` comme mot de passe

```
PS > $Password = Read-Host -AsSecureString 
```

#### :two: Créer l'utilisateur

```
PS > New-LocalUser "Brice" -Password $Password -FullName "Brice" -Description "Prof. "
```


#### :three: Donner les droits administrateurs à l'utilisateur

```
PS > Add-LocalGroupMember -Group "Administrators" -Member "Brice"
```

#### :four: Ne jamais faire expirer le mot de passe

```
PS> Set-LocalUser "Brice" -AccountNeverExpires
```

#### :x: Donner un autre mot de passe

```
PS > Set-LocalUser "Brice" -Password (ConvertTo-SecureString -AsPlainText "B0r34l$" -Force)
```

#### :o: Verification


```
PS > Get-LocalGroupMember -Group "Administrators"

ObjectClass Name                   PrincipalSource
----------- ----                   ---------------
User        <SERVEUR>\Administrator Local
User        <SERVEUR>\Brice         Local
```



### :key: OS Level

#### :keyboard: ServerCore 

```
PS > Get-ComputerInfo -Property WindowsProductName, OsServerLevel
WindowsProductName             OsServerLevel
------------------             -------------
Windows Server 2019 Datacenter    ServerCore
```
#### :desktop_computer: FullServer 

```
PS > Get-ComputerInfo -Property WindowsProductName, OsServerLevel

WindowsProductName             OsServerLevel
------------------             -------------
Windows Server 2019 Datacenter    FullServer
```

```
PS C:\> Get-ComputerInfo -Property Windows*, Hyper*


WindowsBuildLabEx                                 : 17763.1.amd64fre.rs5_release.180914-1434
WindowsCurrentVersion                             : 6.3
WindowsEditionId                                  : ServerDatacenterACor
WindowsInstallationType                           : Server Core
WindowsInstallDateFromRegistry                    : 1/11/2020 5:24:35 AM
WindowsProductId                                  : 00000-00000-00000-00000
WindowsProductName                                : Windows Server Datacenter
WindowsRegisteredOrganization                     :
WindowsRegisteredOwner                            :
WindowsSystemRoot                                 : C:\Windows
WindowsVersion                                    : 1809
HyperVisorPresent                                 : False
HyperVRequirementDataExecutionPreventionAvailable : True
HyperVRequirementSecondLevelAddressTranslation    : True
HyperVRequirementVirtualizationFirmwareEnabled    : True
HyperVRequirementVMMonitorModeExtensions          : True
```


# Références

https://pureinfotech.com/create-new-user-account-powershell-windows-10/
