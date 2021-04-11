
:x: unhealthy

```
% docker-compose ps
       Name                      Command                   State                               Ports                       
---------------------------------------------------------------------------------------------------------------------------
c300118524_gitlab_1   /assets/wrapper                  Up (unhealthy)   0.0.0.0:8822->22/tcp, 443/tcp, 0.0.0.0:8000->80/tcp
portainer             /portainer -H unix:///var/ ...   Up               8000/tcp, 0.0.0.0:9000->9000/tcp 
```
