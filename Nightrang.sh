#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
	    cd libs
		sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
		sudo apt-get install g++-4.7 -y c++-4.7 -y
		sudo apt-get update
		sudo apt-get upgrade
		sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
		sudo apt-get install screen -y
		sudo apt-get install tmux -y
		sudo apt-get install libstdc++6 -y
		sudo apt-get install lua-lgi -y
		sudo apt-get install libnotify-dev -y
        sudo apt-get install libconfig++9v5
		wget --no-check-certificate https://valtman.name/files/telegram-bot-180116-nightly-linux
		mv telegram-bot-180116-nightly-linux tdbot
		chmod +x tdbot
		cd ..
		chmod +x libs
		chmod +x Nightrang.sh
}

function print_logo() {
	red "\  |_)         |      |                              "
	red "   \ | |   _  |  __ \   __|   __|   _  |  __ \    _  | "
	red " |\  | |  (   |  | | |  |    |     (   |  |   |  (   | "
	red "_| \_|_| \__. | _| |_| \__| _|    \__._| _|  _| \__. | "
	red "         |___/                                  |___/  "
	echo -e "\n\e[0m"
}
red() {
printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
deltgbot() {
 rm -rf $HOME/.telegram-bot
}
config() {
mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config
default_profile = "cli";
cli = {
lua_script = "$HOME/Cli/script.lua";
};
EOF
printf "\nConfig Has Been Saved.\n"
}
Nightrang() {
./libs/tdbot | grep -v "{"
}

Nightrangapi() {
./libs/tdbot -p cli --login --bot=${1}
}

case $1 in
config)
print_logo
printf "Please wait...\n"
config ${2}
exit ;;

logapi)
print_logo
printf "Please wait...\n"
lua start.lua
exit;;

install)
print_logo
install
exit;;

bd)
printf "New Bot for NightRang is Launching...\n"
print_logo
Nightrang
exit;;

reset)
print_logo
printf "Please wait for delete telegram-bot...\n"
deltgbot
sleep 1
config
exit;;

esac

exit 0
 
