#!/bin/bash

node_name=$(kubectl get nodes  --no-headers| grep -v master |awk '{print $1}')
kubectl label node $node_name worker=apps
