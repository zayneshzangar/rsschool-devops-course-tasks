#!/bin/bash

node_name=$(kubectl get nodes  --no-headers| grep -v master |awk '{print $1}')
kubectl label node $node_name worker=apps

kubectl create ns jenkins || true

kubectl apply -f jenkins-volume.yaml

kubectl apply -f jenkins-role.yaml


# helm repo add jenkinsci https://charts.jenkins.io
# helm repo update
# helm search repo jenkinsci

# chart=jenkinsci/jenkins
# helm install jenkins -n jenkins -f jenkins-values.yaml $chart

# jsonpath="{.data.jenkins-admin-password}"
# secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$jsonpath)
# echo $(echo $secret | base64 --decode)
