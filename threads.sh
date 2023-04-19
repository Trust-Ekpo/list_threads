#!/bin/bash

# A simple bash script that returns the number of threads in a process



#asking the user for the name of the process
echo "What process are you looking for? "
#reading the  inpput from the user and saving it to the variable the_pid
read the_pid

#cheching to ensure the variable is not empty
if [ -n $the_pid ]
then
# We get a list of all running processes. 
# then we check through that list for a line that ends with the process requested by the user.
# we remove the process grep and threads.sh from the list
# then we select the second column of the returned information which is the pid of the process 
	pid=$(ps aux | grep -E "$the_pid\$" | grep -v grep | grep -v threads.sh | awk '{print $2}')
# We print out the number of threads by cating the proc directory of the process, going to the status file and grepping for threads
	cat /proc/$pid/status | grep -i threads

fi
