#!/bin/bash

docker-compose up -d --build
docker exec -it verneg ./G2O_Server

