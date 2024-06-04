#https://isaac-sim.github.io/IsaacLab/main/source/setup/installation/pip_installation.html
ISAAC_SIM_VERSION=${1:-"4.5.0"}
source CONDA_ENV_ISAAC_CREATE.sh conda_envs/isaac
pip install --upgrade pip
# NOTE: CUDA is already installed in isaacsim
pip install "isaacsim[all,extscache]==${ISAAC_SIM_VERSION}" --extra-index-url https://pypi.nvidia.com
# TORCH (some examples may require updating torch). Run `nvidia-smi` for the installed cuda <version>
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu<version>

# NOTE: Before running [isaaclab.sh], add this there so it will run isaacsim installed from the conda env
# CONDA_PREFIX="conda_envs/isaac"

# PYCHARM CONFIG
# Configure Python intepreter as <path_to_IsaacLab>/conda_envs/isaac/bin/python

# 2. Create Run configuration named `IsaacLabSim`
# Add a Before-launch task as an `External Tool`:
# Work program: <path_to_isaaclab>/setup_conda_env.sh
