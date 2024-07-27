set -e
#Alternova pallete colors
# #F9AC7F → \e[38;2;249;172;127m
# #F45BC1 → \e[38;2;244;91;193m
# #7671E5 → \e[38;2;118;113;229m
ascii_art='
\e[38;2;244;91;193m   _____   __   __                                           \e[0m \e[38;2;249;172;127m          \e[0m \e[38;2;249;172;127m  ________                    __          ___ \e[0m
\e[38;2;244;91;193m  /  _  \ |  |_/  |_  ___________  ____   ________  _______   \e[0m \e[38;2;118;113;229m          \e[0m \e[38;2;249;172;127m  \_____  \   _____  _____  |  | _____ __\_ |__ \e[0m
\e[38;2;244;91;193m /  /_\  \|  |\   __\/ __ \_  __ \/    \ /  _  \  \/ /\__  \  \e[0m \e[38;2;118;113;229m   ______ \e[0m \e[38;2;249;172;127m   /   |   \ /     \ \__  \ |  |/ //  |  \| __ \ \e[0m
\e[38;2;244;91;193m/    |    \  |_|  | \  ___/|  | \/   |  |  |_|  |   /  / __ \_\e[0m \e[38;2;118;113;229m  /_____/ \e[0m \e[38;2;249;172;127m  /    |    \  Y Y  \ / __ \|    / |  |  || \_\ \ \e[0m
\e[38;2;244;91;193m\____|____/____/__|  \_____|__|  |___|__/\_____/ \_/  (______/\e[0m \e[38;2;118;113;229m          \e[0m \e[38;2;249;172;127m  \_________/__|_|___(______|__|__\ \___/ |_____/   \e[0m
\e[38;2;244;91;193m                                                             \e[0m \e[38;2;118;113;229m          \e[0m \e[38;2;249;172;127m                                          \e[0m
'
echo -e "$ascii_art"
echo "=> Alternova installing Omakub is for fresh Ubuntu 24.04 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omakub..."
rm -rf ~/.local/share/omakub
git clone https://github.com/Alternova-Inc/omakub.git ~/.local/share/omakub >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakub
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout FETCH_HEAD
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub/install.sh
