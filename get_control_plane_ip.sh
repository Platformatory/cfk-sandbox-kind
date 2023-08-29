#!/bin/bash
docker container inspect kind-control-plane   --format '{{ .NetworkSettings.Networks.kind.IPAddress }}'
