#!/usr/bin/env bash
# Download Visual Studio Code client and server, and a list of extensions

set -Eeuo pipefail

DESTDIR=./dl
CONFIG=${1:-config.txt}

if [ ! -f "$CONFIG" ]; then
    echo "Usage: $0 <config>"
    exit 1
fi

# DESTDIR="${DESTDIR:-.}"
# if [[ ! -f /.dockerenv ]]; then
#     list=
#     if [[ -f "${1:-}" ]]; then
#         list="-v $(realpath "$1"):/config.txt:ro"
#         shift
#     fi
#     "$(dirname "${BASH_SOURCE[0]}")/golang.sh" build_only
#     exec docker run --init -e TINI_KILL_PROCESS_GROUP=1 --rm -ti -v "$PWD/dl:/dl" ${list} -w / ${list} goffline /vscode.sh
# fi

###############################################################################
echo -e "\n\033[1;34m🍻 Downloading VSCode\033[0m"
$(dirname $0)/vscode-app.py -o ${DESTDIR}

###############################################################################
echo -e "\n\033[1;34m🍻 Downloading extenions\033[0m"
$(dirname $0)/vscode-ext.py -o ${DESTDIR} -f $CONFIG

###############################################################################
echo -e "\n\033[1;34m🍻 Packaging extenions and vscode-server\033[0m"
$(dirname $0)/vscode-dist.py -d ${DESTDIR} -f $CONFIG
