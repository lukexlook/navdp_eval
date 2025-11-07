source .venv/bin/activate
cd NavDP

sed -i -e \
    's/os\.listdir(args_cli\.scene_dir)/sorted(os.listdir(args_cli.scene_dir))/g' \
    eval_pointgoal_wheeled.py

python eval_pointgoal_wheeled.py \
    --port 8888 \
    --scene_dir /workspace/NavDP/assets/scenes/internscenes_home/scenes_home \
    --scene_index 0 \
    --scene_scale 0.01

# Errors like
# - [Error] [omni.physx.plugin] Physics scenes...
# - [Error] [omni.usd] USD_MDL...
# should be fine.
#
# Just wait, it may take minutes to load.
# If there will be repetitive runs, consider mounting cache folders.
