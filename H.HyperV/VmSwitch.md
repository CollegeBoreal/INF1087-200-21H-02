# Virtual Switch

## :zero: Create Virtual Switch


:pushpin: Visualiser vos Switch Virtuels

```
PS> Get-VMSwitch  * | Format-Table Name
```

:pushpin: Visualiser vos cartes ethernets

```
PS> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48       7 Disconnected F4-CE-46-B7-21-E6          0 bps
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47       6 Up           F4-CE-46-B7-21-E4         1 Gbps
```

:pushpin: Creer la Switch Virtuelle pour le driver HyperV

:bulb: Le nom doit être `Primary Virtual Switch` par défaut

```
PS> $net = Get-NetAdapter -Name 'Ethernet'
PS> New-VMSwitch -Name "Primary Virtual Switch" -AllowManagementOS $True -NetAdapterName $net.Name

Name                   SwitchType NetAdapterInterfaceDescription
----                   ---------- ------------------------------
Primary Virtual Switch External   QLogic BCM5709C Gigabit Ethernet (NDIS VBD Client)
```

:pushpin: Visualiser vos cartes ethernets (en plus de la VmSwitch)

```
PS> Get-NetAdapter

Name                      InterfaceDescription                    ifIndex Status       MacAddress             LinkSpeed
----                      --------------------                    ------- ------       ----------             ---------
Ethernet 2                QLogic BCM5709C Gigabit Ethernet ...#48       7 Disconnected F4-CE-46-B7-21-E6          0 bps
Ethernet                  QLogic BCM5709C Gigabit Ethernet ...#47       6 Up           F4-CE-46-B7-21-E4         1 Gbps
vEthernet (Primary Vir... Hyper-V Virtual Ethernet Adapter             10 Up           F4-CE-46-B7-21-E4         1 Gbps
```

:pushpin: Visualiser la VmSwitch


```
PS> Get-VMSwitch * | Format-Table Name

Name
----
Primary Virtual Switch
```
