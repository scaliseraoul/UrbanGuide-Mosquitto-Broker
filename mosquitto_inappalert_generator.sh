#!/bin/bash

# Mosquitto InAppAlert Generator

# Function to publish a message
publish_message() {
    local timestamp=$(gdate +%s%3N)
    local message="{\"text\":\"This is an in app alert text\",\"timestamp\":\"$timestamp\"}"
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