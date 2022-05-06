#!/usr/bin/env bash

function_name=$1
echo "Function name: $function_name"

shell=""
if [[ $function_name == "amf" || $function_name == "smf" || $function_name == "smf2" ]]; then
    shell=ash
else
    shell=bash
fi

if [[ $function_name == "gnb" || $function_name == "ue" ]]; then
    pod_name=$(kubectl get pods | egrep -i -o "ueransim-$function_name-[a-z0-9]+-[a-z0-9]+")
else
    pod_name=$(kubectl get pods | egrep -i -o "free5gc-$function_name-[a-z0-9]+-[a-z0-9]+")
fi

echo "Using shell $shell for pod $pod_name"
kubectl exec -it $pod_name -- $shell
