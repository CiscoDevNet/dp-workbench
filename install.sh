#!/bin/bash

if ! [[ $(vagrant box list) =~ iosxe ]]; then
    echo "install vagrant box"
    vagrant box add --name iosxe ./csr1000v-universalk9.16.03.02.box
fi

if test -z $(docker images --format '{{.Repository}}' dp-workbench); then
    echo "install docker image"
    docker load <./dp-workbench.tar
fi

# starting stuff
cat <<EOF
run all (two) routers:
    vagrant up
run only one router:
    vagrant up rtr1
run the container:
    docker run -p8888:8888 -d dp-workbench
EOF


