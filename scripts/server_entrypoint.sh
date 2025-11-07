#!/bin/bash
source .venv/bin/activate
cd NavDP/baselines/navdp/
python navdp_server.py --port 8888 --checkpoint /workspace/navdp-cross-modal.ckpt
