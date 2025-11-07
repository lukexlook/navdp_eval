source .venv/bin/activate
cd NavDP

export total=$(ls -1 assets/scenes/internscenes_home/scenes_home/ | wc -l)

for (( i=0; i<total; i++ )); do \
    python eval_pointgoal_wheeled.py \
        --port 8888 \
        --scene_dir /workspace/NavDP/assets/scenes/internscenes_home/scenes_home \
        --scene_index $i \
        --scene_scale 0.01; \
done

# Errors like
# - [Error] [omni.physx.plugin] Physics scenes...
# - [Error] [omni.usd] USD_MDL...
# should be fine.
#
# Just wait, it may take minutes to load.
# If there will be repetitive runs, consider mounting cache folders.
