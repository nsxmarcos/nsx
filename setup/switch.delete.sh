#!/bin/bash
ID=${1}

source drv.core
if [[ -n "${ID}" ]]; then
	if [[ -n "${HOST}" ]]; then
		ITEM="logical-switches"
		CALL="/${ID}"
		URL=$(buildURL "${ITEM}${CALL}")
		if [[ -n "${URL}" ]]; then
			printf "[$(cgreen "INFO")]: nsx [$(cgreen "delete")] ${ITEM} - [$(cgreen "$URL")]... " 1>&2
			rDelete "${URL}"
		fi
	fi
else
	printf "[$(corange "ERROR")]: command usage: $(cgreen "switch.delete") $(ccyan "<uuid>")\n" 1>&2
fi
