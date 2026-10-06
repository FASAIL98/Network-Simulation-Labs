#!/bin/bash
set -e

echo "======================================"
echo " Setting up NS-3 Lab Environment"
echo "======================================"

cd /workspaces/Network-Simulation-Labs

if [ ! -d "ns-3-dev" ]; then
    echo "Downloading NS-3.46..."
    git clone --branch ns-3.46 --depth 1 https://gitlab.com/nsnam/ns-3-dev.git ns-3-dev
else
    echo "NS-3 already exists."
fi

echo "Copying Lab 2..."
cp lab2.cc ns-3-dev/scratch/lab2.cc

cd ns-3-dev

echo "Configuring NS-3..."
python3.12 ./ns3 configure --enable-examples

echo "Building NS-3..."
python3.12 ./ns3 build

echo "======================================"
echo " Setup completed successfully!"
echo "======================================"
echo "To run Lab 2:"
echo "cd /workspaces/Network-Simulation-Labs/ns-3-dev"
echo "python3.12 ./ns3 run lab2"