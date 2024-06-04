#https://isaac-sim.github.io/IsaacLab/main/source/setup/installation/pip_installation.html
ISAAC_ENV=${1:-"./conda_envs/isaac"}
if [ ! -d "$ISAAC_ENV" ]
then
	conda create --prefix $ISAAC_ENV python=3.11
	conda config --set env_prompt '({name})'
	conda info --envs
        # conda init # -> This will add auto conda init script to ~/.bashrc
	conda activate $ISAAC_ENV
else
	echo "$ISAAC_ENV already exists"
fi
