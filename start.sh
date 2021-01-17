#!/bin/bash

docker-compose up -d
docker exec -it verneg ./G2O_Server

