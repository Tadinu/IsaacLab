# https://isaac-orbit.github.io/orbit/source/setup/sample.html
./isaaclab.sh -p source/standalone/environments/list_envs.py

#Zero-action agent on the Cart-pole example
./isaaclab.sh -p source/standalone/environments/zero_agent.py --task Isaac-Cartpole-v0 --num_envs 32

Random-action agent on the Cart-pole example:
./isaaclab.sh -p source/standalone/environments/random_agent.py --task Isaac-Cartpole-v0 --num_envs 32

Spawn different quadrupeds and make robots stand using position commands:
./isaaclab.sh -p source/standalone/demos/quadrupeds.py

Spawn different arms and apply random joint position commands:
./isaaclab.sh -p source/standalone/demos/arms.py

Spawn different hands and command them to open and close:
./isaaclab.sh -p source/standalone/demos/hands.py

Spawn procedurally generated terrains with different configurations:
./isaaclab.sh -p source/standalone/demos/procedural_terrain.py

Spawn multiple markers that are useful for visualizations:
./isaaclab.sh -p source/standalone/demos/markers.py

./isaaclab.sh -p source/standalone/environments/state_machine/lift_cube_sm.py --num_envs 32

./isaaclab.sh -p source/standalone/environments/teleoperation/teleop_se3_agent.py --task Isaac-Lift-Cube-Franka-IK-Rel-v0 --num_envs 1 --device keyboard


# step a: collect data with keyboard
./isaaclab.sh -p source/standalone/workflows/robomimic/collect_demonstrations.py --task Isaac-Lift-Cube-Franka-IK-Rel-v0 --num_envs 1 --num_demos 10 --device keyboard
# step b: inspect the collected dataset
./isaaclab.sh -p source/standalone/workflows/robomimic/tools/inspect_demonstrations.py logs/robomimic/Isaac-Lift-Cube-Franka-IK-Rel-v0/hdf_dataset.hdf5


# install python module (for robomimic)
./isaaclab.sh -e robomimic
# split data
./isaaclab.sh -p source/standalone//workflows/robomimic/tools/split_train_val.py logs/robomimic/Isaac-Lift-Cube-Franka-IK-Rel-v0/hdf_dataset.hdf5 --ratio 0.2


./isaaclab.sh -p source/standalone/workflows/robomimic/train.py --task Isaac-Lift-Cube-Franka-IK-Rel-v0 --algo bc --dataset logs/robomimic/Isaac-Lift-Cube-Franka-IK-Rel-v0/hdf_dataset.hdf5
./isaaclab.sh -p source/standalone//workflows/robomimic/play.py --task Isaac-Lift-Cube-Franka-IK-Rel-v0 --checkpoint /PATH/TO/model.pth

===============================================
RL
# install python module (for stable-baselines3)
./isaaclab.sh -e sb3
# run script for training
# note: we enable cpu flag since SB3 doesn't optimize for GPU anyway
./isaaclab.sh -p source/standalone/workflows/sb3/train.py --task Isaac-Cartpole-v0 --headless --cpu
# run script for playing with 32 environments
./isaaclab.sh -p source/standalone/workflows/sb3/play.py --task Isaac-Cartpole-v0 --num_envs 32 --checkpoint /PATH/TO/model.zip


# install python module (for skrl)
./isaaclab.sh -e skrl
# run script for training
./isaaclab.sh -p source/standalone/workflows/skrl/train.py --task Isaac-Reach-Franka-v0 --headless
# run script for playing with 32 environments
./isaaclab.sh -p source/standalone/workflows/skrl/play.py --task Isaac-Reach-Franka-v0 --num_envs 32 --checkpoint $MEDIA_EXT_DRIVE/OMNIVERSE/orbit/logs/skrl/franka_reach/2024-03-25_19-27-18/checkpoints/best_agent.pt

./isaaclab.sh -p source/standalone/workflows/skrl/train.py --task Isaac-Lift-Cube-Franka-v0 --headless
./isaaclab.sh -p source/standalone/workflows/skrl/play.py --task Isaac-Lift-Cube-Franka-v0 --num_envs 32 --checkpoint $MEDIA_EXT_DRIVE/OMNIVERSE/orbit/logs/skrl/franka_lift/2024-05-10_19-59-04/checkpoints/best_agent.pt

./isaaclab.sh -p source/standalone/workflows/skrl/train.py --task Isaac-Open-Drawer-Franka-v0 --headless
./isaaclab.sh -p source/standalone/workflows/skrl/play.py --task Isaac-Open-Drawer-Franka-Play-v0 --num_envs 32 --checkpoint 
