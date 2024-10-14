#!/bin/bash

echo -e '[[registry]]\nlocation = "nexus3:8082"\ninsecure = true' >> /etc/containers/registries.conf.d/nexus-docker-hosted.conf
