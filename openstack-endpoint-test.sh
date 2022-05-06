#!/bin/bash
IP="129.97.168.40"  # nuc-01
NOVA_URL="http://$IP/compute/v2.1"
NEUTRON_URL="http://$IP:9696"
KEYSTONE_URL="http://$IP:5000/v3"
TOKEN_URL="$KEYSTONE_URL/auth/tokens"

TOKEN=$(curl -s \
-i -H "Content-Type: application/json" \
-d '
{"auth": {
"identity": {
"methods": ["password"],
"password": {
"user": {
"name": "admin",
"domain": { "id": "default" },
"password": "admin_pass"
}
}
},
"scope": {
"project": {
"name": "admin",
"domain": { "id": "default" }
}
}
}
}' \
$TOKEN_URL | grep 'X-Subject-Token' | awk -F':' '{print $2}' | xargs)
echo "Got authentication token="$TOKEN
