#!/bin/bash
source .venv/bin/activate
cd NavDP/baselines/navdp/
sed -i -e 's/127.0.0.1/0.0.0.0/g' navdp_server.py
python navdp_server.py --port 8888 --checkpoint /workspace/navdp-cross-modal.ckpt
