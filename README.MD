# TMC Continuous Delivery Repository

## Description
Provide cluster control requirements to ensure they are operationally ready and consistent via the Tanzu Mission Control continuous delivery capability. 

### Scope
This is focused on the APA R&D Lab services 


## Instructions

### ClusterGroup Prep

- Step 1: Enable Kustomization CD
**tanzu tmc continuousdelivery enable -g <gropupname> -s clustergroup**

- Step 2: Enable Helm
**tanzu tmc helm enable -g <groupname> -s clustergroup**


- Step 2: Assign Git Repo to the ClusterGroup
**tanzu tmc continuousdelivery gitrepository create -f groupprep/<groupname>/<groupname>-gitrepo.yaml -s clustergroup**

- Step 3: Add cluster group sub folder to the git repo
**tanzu tmc continuousdelivery kustomization create -f groupprep/<groupname>/<groupname>-kustomize.yaml -s clustergroup**






### Custom Extensibility

- Cluster Group Settings

- Cluster specific settings

