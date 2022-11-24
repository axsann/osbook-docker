#!/bin/bash
docker exec -it ubuntu-1 /bin/bash -c 'cd /root/workspace; exec "$SHELL"'
