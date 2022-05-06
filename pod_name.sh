#!/usr/bin/env bash

function_name=$1
if [[ $function_name == "gnb" || $function_name == "ue" ]]; then
    pod_name=$(kubectl get pods | egrep -i -o "ueransim-$function_name-[a-z0-9]+-[a-z0-9]+")
else
    pod_name=$(kubectl get pods | egrep -i -o "free5gc-$function_name-[a-z0-9]+-[a-z0-9]+")
fi

echo -n $pod_name
