#!/bin/bash
SCRIPT_DIR=$(dirname $(realpath $0))
DATA_DIR=$(realpath "${SCRIPT_DIR}/../data")

docker run -d                                                               \
    -v ${DATA_DIR}/n1_eval_scenes:/workspace/NavDP/assets/scenes            \
    --gpus device=0                                                         \
    --name navdp_isaac                                                      \
    --network host                                                          \
    navdp:full                                                              \
    sleep infinity
