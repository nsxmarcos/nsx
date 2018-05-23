#!/bin/bash
source drv.core
source drv.nsx.client

ID=${1}
if [[ -n "${ID}" ]]; then
	if [[ -n "${NSXHOST}" ]]; then
		ITEM="transport-nodes"
		CALL="/${ID}"
		URL=$(buildURL "${ITEM}${CALL}")
		if [[ -n "${URL}" ]]; then
			printf "[$(cgreen "INFO")]: nsx [$(cgreen "delete")] ${ITEM} [$(cgreen "$URL")]... " 1>&2
			nsxDelete "${URL}"
		fi
	fi
else
	printf "[$(corange "ERROR")]: command usage: $(cgreen "tnode.delete") $(ccyan "<tnode-uuid>")\n" 1>&2
fi
