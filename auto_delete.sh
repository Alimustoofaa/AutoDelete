#!/bin/bash

# Check if an interval parameter is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <interval>"
    interval=7
else
    interval="$1"
fi


# define path 
PATH_CAPTURES=$HOME/Camera/Captures/
PATH_LOGS=$HOME/Logger/Master/

while true; do
    # Delete CAPTURES
    echo "delete captures"
    result_captures=$(find $PATH_CAPTURES -mindepth 3 -type d -ctime -"$interval")
    echo $result_captures

    # Execute rm -r on the result
    echo "Removing directories:"
    echo "$result_captures" | xargs rm -r
    echo " "

    # Delete LOGS
    echo "delete log"
    result_logs=$(find $PATH_LOGS -mindepth 3 -type d -ctime -"$interval")
    echo $result_logs

    # Execute rm -r on the result
    echo "Removing directories:"
    echo "$result_logs" | xargs rm -r
    echo " "
    
    # Sleep for a day
    sleep 86400
done
