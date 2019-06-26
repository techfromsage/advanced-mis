#!/bin/bash

docker build -t advanced-mis-docs .
docker run -v ${PWD}:/advanced-mis -p 4000:4000 -it advanced-mis-docs

