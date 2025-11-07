#!/bin/bash
SCRIPT_DIR=$(dirname $(realpath $0))
DATA_DIR=$(realpath "${SCRIPT_DIR}/../data")
INTER_DIR=$(realpath "${SCRIPT_DIR}/../interfacing")

docker run -d                                                               \
    -v ${DATA_DIR}/navdp-cross-modal.ckpt:/workspace/navdp-cross-modal.ckpt \
    -v ${SCRIPT_DIR}/server_entrypoint.sh:/workspace/entrypoint.sh          \
    -v ${INTER_DIR}/navdp_server.py:/workspace/NavDP/baselines/navdp/navdp_server.py \
    --entrypoint /workspace/entrypoint.sh                                   \
    --gpus device=0                                                         \
    --name navdp_server                                                     \
    -p 8888:8888                                                            \
    navdp:server
