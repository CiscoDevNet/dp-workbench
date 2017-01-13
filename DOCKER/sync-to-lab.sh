#!/bin/bash

#      --dry-run \
rsync --exclude .git \
      --exclude .ipynb_checkpoints \
      -cavz \
      -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" \
      --progress \
      ./ rschmied@172.23.175.169:/home/rschmied/dp-workbench/DOCKER/


