#!/usr/bin/env bash

set -e

cd "$(dirname "${0}")/.."

sudo apt install git g++ imagemagick xclip libsdl1.2-dev libglu1-mesa-dev libgl1-mesa-dev mingw-w64

# More dependencies are installed as needed in BuildAndPostClients.sh, this is limited to libraries that are not part of the apt repositories.