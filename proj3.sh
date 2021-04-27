#! /bin/bash

while true; do
	# Main Menu
	echo "`date`"
	echo "----------------------------------------------------"
	echo " Main Menu"
	echo "----------------------------------------------------"
	echo "1. Operating system info"
	echo "2. Howtname and DNS info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. Last logged in users"
	echo "6. My IP address"
	echo "7. My disk usage"
	echo "8. My home file-tree"
	echo "9. Process operations"
	echo "10. Exit"
	read -p "Enter you choice [ 1 - 10 ] " choice
	
	# Choice 1
	if [ $choice == "1" ] ; then
		echo "----------------------------------------------------"
		echo "  System information"
		echo "----------------------------------------------------"
		echo "Operating systme : $(uname -s)"
		/usr/bin/lsb_release -a
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
	
	# Choice 2
	elif [ $choice == "2" ] ; then
		echo "----------------------------------------------------"
		echo " Hostname and DNS information"
		echo "----------------------------------------------------"
		echo "Hostname : $(hostname)"
		echo "DNS domain : $(hostname -d)"
		echo "Fully qualified domain name : $(hostname -f)"
		echo "Network address (IP) : $(hostname -i)"
		echo "DNS name servers (DNS IP) : $(cat /etc/resolv.conf | awk '/nameserver/ {print $2}')"
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
		
	
	# Choice 3
	elif [ $choice == "3" ] ; then
		echo "----------------------------------------------------"
		echo "  Network information"
		echo "----------------------------------------------------"i
		echo "Total network interfaces found : $(ip -o link show | wc -l)"
		echo "*** IP Addresses Information ***"
		ip a
		echo "***********************"
		echo "*** Network routing ***"
		echo "***********************"
		netstat -nr
		echo "*************************************"
		echo "*** Interface traffic information ***"
		echo "*************************************"
		netstat -i
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
	
	# Choice 4
	elif [ $choice == "4" ] ; then
		echo "----------------------------------------------------"
		echo "  Who is online"
		echo "----------------------------------------------------"
		who -H
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
		
	# Choice 5
	elif [ $choice == "5" ] ; then
		echo "----------------------------------------------------"
		echo "  List of last logged in users"
		echo "----------------------------------------------------"
		last
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
		
	# Choice 6
	elif [ $choice == "6" ] ; then
		echo "----------------------------------------------------"
		echo "  Public IP information"
		echo "----------------------------------------------------"
		curl ifconfig.me
		echo ""
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
		
	# Choice 7
	elif [ $choice == "7" ] ; then
		echo "----------------------------------------------------"
		echo "  Disk Usage Info"
		echo "----------------------------------------------------"
		df -h | awk '{print $5 " " $6}' | sed '1d' | sort
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
	
	# Choice 8
	elif [ $choice == "8" ] ; then
		echo "----------------------------------------------------"
		echo "  My Home file-tree"
		echo "----------------------------------------------------"
		sh ./proj1.sh
		echo "The filetree.html is generated and saved in ${PWD}"
		read -p "Press [Enter] key to continue..." key
		if [ "$key" = "" ] ; then
			continue
		fi
		
	# Choice 9
	elif [ $choice == "9" ] ; then
		echo "----------------------------------------------------"
		echo "  Process Operations"
		echo "----------------------------------------------------"
		sh ./proc.sh
		continue
	
	# Choice 10 
	elif [ $choice == "10" ] ; then
		break;
	
	else
		echo "*** Error: Choose a number between [ 1 - 10 ] ***"
	fi
done

