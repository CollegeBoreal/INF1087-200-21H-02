# :zap: How to configure our network using python scripts:zap: 
:star: Installer l'utilitaire client kubectl permetant de controller la grappe. 
```
choco install kubernetes-cli
```
<img src=images/1.PNG  alt="alt text" width="650" height="500">

## :zap: Installer Lens :zap:

```
choco install lens
```
<img src=images/6.PNG  alt="alt text" width="650" height="500">


#  :pushpin: Création de grape sur Azure:

:star: Installer Azure CLI.
```
choco install azure-cli
```
<img src=images/7.PNG  alt="alt text" width="650" height="500">

##

:star: se connecter à Azure en utilisant les commandes CLI.

```
az login
```

<img src=images/8.PNG  alt="alt text" width="850" height="500">


##

:star: Créer sa première grappe et Vérifier que le groupe existe.

```
AZ_GROUP_ID=`az group list | jq 'limit(1;.[] | .name )' | sed 's/"//g'`

echo $AZ_GROUP_ID
```
<img src=images/11.PNG  alt="alt text" width="850" height="250">


##

#  :pushpin: Azure Education ne nous permet que deux VMs par cluster.

```
AZ_NODE_COUNT=2 
```

:star: Créer sa grappe.
```
AZ_CLUSTER_NAME="morty"
```
``
:star: Lancer la création.
az aks create --resource-group $AZ_GROUP_ID \
                --name $AZ_CLUSTER_NAME \
              --node-count $AZ_NODE_COUNT \
              --generate-ssh-keys \
              --enable-addons monitoring
```            

<img src=images/12.PNG  alt="alt text" width="650" height="500">

##

#  :pushpin: Utiliser Lens pour installer votre application.

:star: Lancer Lens et verifier notre grappe "morty".


<img src=images/13.PNG  alt="alt text" width="650" height="500">

##

:star: Installer l'application WordPress.

<img src=images/14.PNG  alt="alt text" width="650" height="500">

##
:star: Vérifier si WordPress existe parmi nos applications.

<img src=images/15.PNG  alt="alt text" width="650" height="500">

##
:star: Vérifier son adresse IP externe.

<img src=images/16.PNG  alt="alt text" width="650" height="500">



