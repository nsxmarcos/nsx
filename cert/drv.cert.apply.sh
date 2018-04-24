#!/bin/bash
source drv.core

CERTID=$1

URL="https://$HOST/api/v1/node/services/http?action=apply_certificate&certificate_id=$CERTID"
printf "Retrieving [$URL]... " 1>&2
RESPONSE=$(curl -k -b cookies.txt -w "%{http_code}" -X POST \
-H "`grep X-XSRF-TOKEN headers.txt`" \
-H "Content-Type: application/json" \
"$URL" 2>/dev/null)
isSuccess "$RESPONSE"
echo "$HTTPBODY"
