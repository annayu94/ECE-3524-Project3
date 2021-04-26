#! /bin/bash

while true; do
	echo "(Please enter the number of your selection below)"
	echo ""
	echo "1.  Show all processes"
	echo "2.  Kill a process"
	echo "3.  Bring up top"
	echo "4.  Return to Main Menu"
	echo ""
	read choice
	
	# Choice 1
	if [ $choice == "1" ] ; then
		ps -ef
		while true; do
			read -N 2 input
			echo ""
			if [[ $input = ":q" ]] ; then
				break
			else
				echo "Type :q to quit and return to submenu"
			fi
		done
		
	# Choice 2
	elif [ $choice == "2" ] ; then
		echo "Please enter the PID of the process you would like to kill:"
		read pidnum
		if ! kill $pidnum; then
			echo "The PID does not exsit or It cannot be killed."
		else
			break
		fi	
		while true; do
			read -N 2 input
			echo ""
			if [[ $input = ":q" ]] ; then
				break
			else
				echo "Type :q to quit and return to submenu"
			fi
		done
		
	# Choice 3
	elif [ $choice == "3" ] ; then
		top -n 1
		while true; do
			read -N 2 input
			echo ""
			if [[ $input = ":q" ]] ; then
				break
			else
				echo "Type :q to quit and return to submenu"
			fi
		done
	
	# Choice 4
	elif [ $choice == "4" ] ; then
		break;
	fi
done
