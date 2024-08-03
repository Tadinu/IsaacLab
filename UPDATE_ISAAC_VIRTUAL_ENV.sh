cd ~/.virtualenvs/isaac
OLD_ISAAC="isaac-sim-4.1.0"
NEW_ISAAC="isaac-sim-4.2.0"
sed -i -e 's/${OLD_ISAAC}/'${NEW_ISAAC}'/g' pyvenv.cfg
cd bin
rm python python3 python3.10
ln -s /home/tad/.local/share/ov/pkg/${NEW_ISAAC}/kit/python/bin/python3 python
ln -s /home/tad/.local/share/ov/pkg/${NEW_ISAAC}/kit/python/bin/python3 python3
ln -s /home/tad/.local/share/ov/pkg/${NEW_ISAAC}/kit/python/bin/python3.10 python3.10
