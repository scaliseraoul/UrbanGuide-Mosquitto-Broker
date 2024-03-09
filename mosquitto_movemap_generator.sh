#!/bin/bash

# Mosquitto MoveMap Generator

# Configuration
center_lat=44.646469 #Modena
center_lon=10.925139 
radius=10000


# Function to generate a random float between two values
random_float() {
    local min=$1
    local max=$2
    local result=$(echo "$min + ($max - $min) * $RANDOM / 32768" | bc -l)
    printf "%.6f" "$result"
}

# Function to publish a message
publish_message() {
    local lat=$(random_float $(echo "$center_lat - ($radius/111111)" | bc -l) $(echo "$center_lat + ($radius/111111)" | bc -l))
    local lon=$(random_float $(echo "$center_lon - ($radius/(111111 * cos($center_lat * 3.14159 / 180)))" | bc -l) $(echo "$center_lon + ($radius/(111111 * cos($center_lat * 3.14159 / 180)))" | bc -l))
    local timestamp=$(gdate +%s%3N)
    local message="{\"lat\":$lat,\"lang\":$lon,\"timestamp\":\"$timestamp\"}"
    mosquitto_pub -h 127.0.0.1 -t "$1" -m "$message"
    echo "Published: $message"
}

# Interval in milliseconds and max message count

max_messages=$1
topic=$2
interval=$3
counter=0

if [[ -z "$max_messages" || -z "$topic" || -z "$interval" ]]; then
    echo "Usage: $0 <max_messages> <topic> <interval_ms>? "
    exit 1
fi

# Main loop
while true; do
    if [[ $counter -lt $max_messages ]]; then
        publish_message $topic
        ((counter++))
        sleep $(echo "$interval" | bc -l)
    else
        break
    fi
done

echo "Finished publishing $max_messages messages."