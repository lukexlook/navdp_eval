FROM navdp:base1_uv
ARG https_proxy

RUN export https_proxy=$https_proxy         \
    && uv pip install                       \
    isaacsim==4.2.0.2                       \
    isaacsim-extscache-physics==4.2.0.2     \
    isaacsim-extscache-kit==4.2.0.2         \
    isaacsim-extscache-kit-sdk==4.2.0.2     \
    --extra-index-url https://pypi.nvidia.com
