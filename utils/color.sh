#!/bin/bash

CLR_GRN='\033[0;32m'
CLR_RED='\033[0;31m'
CLR_NC='\033[0m'

function echo_red {
	echo -e "$CLR_RED$1$CLR_NC"
}

function echo_green {
	echo -e "$CLR_GRN$1$CLR_NC"
}
