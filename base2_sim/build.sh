#!/bin/bash
docker build                                \
    --build-arg https_proxy=$https_proxy    \
    -t navdp:base2_sim .
