#!/usr/bin/env bash

function_name=$1
container_name=$2
echo "Function name: $function_name"
echo "Conainer name: $container_name"

# shell pod name
if [[ $function_name == "gnb" || $function_name == "ue" ]]; then
    pod_name=$(kubectl get pods | egrep -i -o "ueransim-$function_name-[a-z0-9]+-[a-z0-9]+")
else
    pod_name=$(kubectl get pods | egrep -i -o "free5gc-$function_name-[a-z0-9]+-[a-z0-9]+")
fi

if [[ -z $container_name ]]; then
    kubectl logs -f $pod_name
else
    kubectl logs -f $pod_name -c $container_name
fi

