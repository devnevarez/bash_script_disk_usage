#!/bin/bash

#Print home directory diskspace usage

echo -e "\e[1;32;4;44mWelcome here is a glimpse of the home directory:\e[0m"

disk=$(df -h --output=source,used,pcent /home)

echo $disk

#Defines a path

DIR_TO_CHECK='/'

printf "======================================================\n"
echo -e "\e[1;32;4;44mTodays Date:\e[0m"

date

printf "======================================================\n"
echo -e "\e[1;32;4;44mList of directories and usage:\e[0m"

#Get a report for the file system usage

df -h

printf "======================================================\n"
echo -e "\e[1;32;4;44mSummary of directories:\e[0m"

#Give summaries for directories
counter=0
max=50

for diskSpace in `/bin/df -h | grep -vE 'Filesystem|tmpfs' | awk '{print $5}' | sed 's/%//g'`
do
	if [ $diskSpace -ge $max ]; then
		let counter++
		echo -e "\e[31mDisk space usage on database $(hostname), ${counter} directory is in need of monitoring.\e[0m "
	else
		echo -e "\e[32mThis directory is healthy!\e[0m"
	fi
done

echo "     _____                   _______                  _______                   _____                    _____                _____                    _____          
         /\    \                 /::\    \                /::\    \                 /\    \                  /\    \              |\    \                  /\    \         
        /::\    \               /::::\    \              /::::\    \               /::\    \                /::\    \             |:\____\                /::\    \        
       /::::\    \             /::::::\    \            /::::::\    \             /::::\    \              /::::\    \            |::|   |               /::::\    \       
      /::::::\    \           /::::::::\    \          /::::::::\    \           /::::::\    \            /::::::\    \           |::|   |              /::::::\    \      
     /:::/\:::\    \         /:::/~~\:::\    \        /:::/~~\:::\    \         /:::/\:::\    \          /:::/\:::\    \          |::|   |             /:::/\:::\    \     
    /:::/  \:::\    \       /:::/    \:::\    \      /:::/    \:::\    \       /:::/  \:::\    \        /:::/__\:::\    \         |::|   |            /:::/__\:::\    \    
   /:::/    \:::\    \     /:::/    / \:::\    \    /:::/    / \:::\    \     /:::/    \:::\    \      /::::\   \:::\    \        |::|   |           /::::\   \:::\    \   
  /:::/    / \:::\    \   /:::/____/   \:::\____\  /:::/____/   \:::\____\   /:::/    / \:::\    \    /::::::\   \:::\    \       |::|___|______    /::::::\   \:::\    \  
 /:::/    /   \:::\ ___\ |:::|    |     |:::|    ||:::|    |     |:::|    | /:::/    /   \:::\ ___\  /:::/\:::\   \:::\ ___\      /::::::::\    \  /:::/\:::\   \:::\    \ 
/:::/____/  ___\:::|    ||:::|____|     |:::|    ||:::|____|     |:::|    |/:::/____/     \:::|    |/:::/__\:::\   \:::|    |    /::::::::::\____\/:::/__\:::\   \:::\____\
\:::\    \ /\  /:::|____| \:::\    \   /:::/    /  \:::\    \   /:::/    / \:::\    \     /:::|____|\:::\   \:::\  /:::|____|   /:::/~~~~/~~      \:::\   \:::\   \::/    /
 \:::\    /::\ \::/    /   \:::\    \ /:::/    /    \:::\    \ /:::/    /   \:::\    \   /:::/    /  \:::\   \:::\/:::/    /   /:::/    /          \:::\   \:::\   \/____/ 
  \:::\   \:::\ \/____/     \:::\    /:::/    /      \:::\    /:::/    /     \:::\    \ /:::/    /    \:::\   \::::::/    /   /:::/    /            \:::\   \:::\    \     
   \:::\   \:::\____\        \:::\__/:::/    /        \:::\__/:::/    /       \:::\    /:::/    /      \:::\   \::::/    /   /:::/    /              \:::\   \:::\____\    
    \:::\  /:::/    /         \::::::::/    /          \::::::::/    /         \:::\  /:::/    /        \:::\  /:::/    /    \::/    /                \:::\   \::/    /    
     \:::\/:::/    /           \::::::/    /            \::::::/    /           \:::\/:::/    /          \:::\/:::/    /      \/____/                  \:::\   \/____/     
      \::::::/    /             \::::/    /              \::::/    /             \::::::/    /            \::::::/    /                                 \:::\    \         
       \::::/    /               \::/____/                \::/____/               \::::/    /              \::::/    /                                   \:::\____\        
        \::/____/                 ~~                       ~~                      \::/____/                \::/____/                                     \::/    /        
                                                                                    ~~                       ~~                                            \/____/ "
										    
