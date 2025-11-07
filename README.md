> [!NOTE]
> Regarding [base1_uv](./base1_uv/), it should be unnecessary
> to build against the large `isaac-sim` image.
> Nonetheless, for research purposes, we are not that sensitive to the image size,
> so we just keep it there.

> [!IMPORTANT]
> For [base3_lab](./base3_lab/), the build process
> is incomplete and requires additional manual steps.
>
> Specifically, we should
> - build `navdp:base3_lab` first,
> - run a temporary `navdp:base3_lab` container,
> - execute `install.sh` inside,
> - export the temporary container to `navdp:base3_lab_install`.
>
> Note "the rsl-rl unavailable error" can be ignored safely.
>
> If an interactive IsaacSim window is desired, we may find
> the [example script](./base3_lab/gui.sh) helpful.

## Evaluation Steps

- Check, modify, and run [server_run.sh](./scripts/server_run.sh),
- Check, modify, and run [isaac_run.sh](./scripts/isaac_run.sh),
- `docker exec` into `navdp_isaac` (best within a tmux session, since the evaluation will be time-consuming),
- Refer to [isaac_eval.sh](./scripts/isaac_eval.sh) for commands to run.
