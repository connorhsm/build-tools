#!/usr/bin/env bash

set -e

cd "$(dirname "${0}")/.."

sudo apt install git g++ imagemagick xclip libsdl1.2-dev libglu1-mesa-dev libgl1-mesa-dev mingw-w64

# More dependencies are installed as needed in BuildAndPostClients.sh, this is limited to libraries that are not part of the apt repositories.

#Additional, from chard convos for cross compile windows and mac
#build-essential dmg2img dos2unix git imagemagick libsdl1.2-dev libz-mingw-w64-dev zip

#sudo ln -s /bin/i686-w64-mingw32-g++ /usr/i686-w64-mingw32/bin/g++
#sudo ln -s /bin/i686-w64-mingw32-gcc /usr/i686-w64-mingw32/bin/gcc
#sudo ln -s /bin/i686-w64-mingw32-windres /usr/i686-w64-mingw32/bin/windres