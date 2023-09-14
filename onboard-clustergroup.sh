#! /bin/sh

# Cluster Group enablement


function log() {
  echo -e "\n\xf0\x9f\x93\x9d     --> $*\n"
}

if [ -n "$1" ]; then
    CLUSTERGROUP=$1
    log "Commencing enabled ClusterGroup: $CLUSTERGROUP in TMC"

    log "Enabling continuous delivery"
    tanzu tmc continuousdelivery enable -g $CLUSTERGROUP -s clustergroup

    log "Enabling Helm"
    tanzu tmc helm enable -g $CLUSTERGROUP -s clustergroup

    log "Adding Git Repo"
    if [[ -f "groupprep/$CLUSTERGROUP/$CLUSTERGROUP-gitrepo.yaml" ]]; then
        tanzu tmc continuousdelivery gitrepository create -f groupprep/$CLUSTERGROUP/$CLUSTERGROUP-gitrepo.yaml -s clustergroup
    else
        log "ClusterGroup git repo file not found"
    fi

    log "Appending ClusterGroup sub path to Git Repo"

    if [[ -f "groupprep/$CLUSTERGROUP/$CLUSTERGROUP-kustomize.yaml" ]]; then
        tanzu tmc continuousdelivery kustomization create -f groupprep/$CLUSTERGROUP/$CLUSTERGROUP-kustomize.yaml -s clustergroup
    else
        log "ClusterGroup sub path file not found"
    fi
fi
