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
		read -N 2 input
		echo ""
		if [[ $input = ":q" ]] ; then
			continue
		fi
		
	# Choice 2
	elif [ $choice == "2" ] ; then
		while true; do
			echo "Please enter the PID of the process you would like to kill:"
			read pidnum
			if ! kill $pidnum > /dev/null 2>&1; then
				echo "The PID does not exist or You don't have permission."
				echo "Try another PID."
			else
				continue
			fi
		done	
		read -N 2 input
		echo ""
		if [[ $input = ":q" ]] ; then
			continue
		fi
		
	# Choice 3
	elif [ $choice == "3" ] ; then
		top
		read -N 2 input
		echo ""
		if [[ $input = ":q" ]] ; then
			continue
		fi
	
	# Choice 4
	elif [ $choice == "4" ] ; then
		break;
	fi
done
