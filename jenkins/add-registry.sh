#!/bin/bash

echo "{\n\
    \"insecure-registries\": [\"nexus3:8082\"]\n\
}" > /etc/docker/daemon.json