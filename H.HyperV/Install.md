# Hyper V 

## Qu'est-ce que Hyper V


## :gear: Installer Hyper-V

### :a: Installer le role [Hyper V](https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/install-the-hyper-v-role-on-windows-server) et les outils de gestion [`RSAT`](https://docs.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools) sur Windows Server

:warning: Attention le serveur va redémarrer

```
PS> Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
```

### :b: Tester le role Hyper V et les outils de gestion [`RSAT`](https://docs.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/remote-server-administration-tools)

```
PS> Get-WindowsFeature *Hyper*

Display Name                                            Name                       Install State
------------                                            ----                       -------------
[X] Hyper-V                                             Hyper-V                        Installed
        [X] Hyper-V Management Tools                    RSAT-Hyper-V-Tools             Installed
            [X] Hyper-V GUI Management Tools            Hyper-V-Tools                  Installed
            [X] Hyper-V Module for Windows PowerShell   Hyper-V-PowerShell             Installed
```

### :ab: Lister les modules Hyper-V disponibles

```
PS> Get-Module -ListAvailable *Hyper*


    Directory: C:\Windows\system32\WindowsPowerShell\v1.0\Modules


ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Binary     2.0.0.0    Hyper-V                             {Add-VMAssignableDevice, Add-VMDvdDrive, Add-VMFibreChan...
Binary     1.1        Hyper-V                             {Add-VMDvdDrive, Add-VMFibreChannelHba, Add-VMHardDiskDr...

```

### :o: Voir les commandes Powershell pour le role Hyper V

```
PS> Get-Command -Module Hyper-V
```

### :x: Installer les modules powershell et RSAT individuellement (Si non installé par la commande globale)

```
PS> # Install Hyper-V Manager and the PowerShell module (HVM only available on GUI systems)
PS> Install-WindowsFeature -Name Hyper-V-PowerShell
PS> Install-WindowsFeature -Name RSAT-Hyper-V-Tools
```

# References

https://www.altaro.com/hyper-v/install-hyper-v-powershell-module/

https://techthoughts.info/home-lab-setup/
