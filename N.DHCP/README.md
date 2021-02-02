# DHCP 

https://www.cisco.com/en/US/docs/ios/12_4t/ip_addr/configuration/guide/htdhcpsv.html


```
$ ssh amirali12:Terminal@12@10.13.237.200
Arta_group> enable
Password: cisco
Arta_group# configure terminal 
Enter configuration commands, one per line.  End with CNTL/Z.
Arta_group(config)#ip dhcp pool hyper-v
Arta_group(dhcp-config)#network 10.13.237.0 255.255.255.0
Arta_group(dhcp-config)#def
Arta_group(dhcp-config)#default-router 10.13.237.1
Arta_group(dhcp-config)#EXIT                    
Arta_group(config)#^Z

Arta_group# configure terminal 
Enter configuration commands, one per line.  End with CNTL/Z.
Arta_group(config)#ip dhcp excluded-address 10.13.237.1 10.13.237.191
```

```
#show ip dhcp pool hyper-v

Pool hyper-v :
 Utilization mark (high/low)    : 100 / 0
 Subnet size (first/next)       : 0 / 0 
 Total addresses                : 254
 Leased addresses               : 1
 Excluded addresses             : 1
 Pending event                  : none
 1 subnet is currently in the pool :
 Current index        IP address range                    Leased/Excluded/Total
 10.13.237.194        10.13.237.1      - 10.13.237.254     1     / 1     / 254  
```
