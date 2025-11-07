#!/bin/bash
source .venv/bin/activate
cd IsaacLab/
git checkout tags/v1.2.0
./isaaclab.sh -i
