#!/bin/bash
set -eu

scripts="$( readlink -e "$( dirname "$( readlink -e "${0}" )" )/scripts/" )"
for s in $(
	      find "${scripts}"  \
		   -regex "${scripts}/[0-9]+-[a-z0-9_-]+\.sh" |
		  sort -n
	  )
do
    (
	if
	    test -L "${s}"
	then
	    l="$( readlink "${s}" )"
	    echo "${0}: running '${s}' -> '${l}'" >&2
	    "${l}"
	else
	    echo "${0}: running '${s}'" >&2
	    "${s}"
	fi
    )
done
