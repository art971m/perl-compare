#!/bin/bash

SCRIPT_DIRECTORY=$(cd $(dirname $0); pwd -P)
LIB_DIRECTORY=$(cd ${SCRIPT_DIRECTORY}/../lib; pwd -P)
T_DIRECTORY=$(cd ${SCRIPT_DIRECTORY}/../t; pwd -P)

PERL5LIB=${LIB_DIRECTORY}
export PERL5LIB

/usr/bin/env prove --color --verbose  ${T_DIRECTORY}/*