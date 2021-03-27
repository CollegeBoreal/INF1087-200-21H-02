# :zap: How to configure our network using python scripts:zap: 
:star: Installer l'utilitaire client kubectl permetant de controller la grappe. 
```
choco install kubernetes-cli
```
<img src=images/1.PNG  alt="alt text" width="650" height="500">

## :zap: This is our topology :zap:
:star: we will use one router and one switch with three vlans and each vlan will receive IP address directly from DHCP server configured on my router.
<img src=images/.PNG  alt="alt text" width="650" height="500">


#  :pushpin: Configuration of Router:

## :one: Connecrting remotely using SSH: 
:star: Connecting to our router from distance usign this set of commands. SSH helps us to connect to our router with our username and password: 
