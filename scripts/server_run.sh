#!/bin/bash
SCRIPT_DIR=$(dirname $(realpath $0))
DATA_DIR=$(realpath "${SCRIPT_DIR}/../data")

docker run -d                                                               \
    -v ${DATA_DIR}/navdp-cross-modal.ckpt:/workspace/navdp-cross-modal.ckpt \
    -v ${SCRIPT_DIR}/server_entrypoint.sh:/workspace/entrypoint.sh          \
    --entrypoint /workspace/entrypoint.sh                                   \
    --gpus device=0                                                         \
    --name navdp_server                                                     \
    -p 8888:8888                                                            \
    navdp:server
