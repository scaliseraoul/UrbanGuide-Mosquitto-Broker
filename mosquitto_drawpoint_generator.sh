#!/bin/bash

# Mosquitto Marker Generator

# Configuration
center_lat=44.646469 #Modena
center_lon=10.925139 
radius=500


# Function to generate a random float between two values
random_float() {
    local min=$1
    local max=$2
    local result=$(echo "$min + ($max - $min) * $RANDOM / 32768" | bc -l)
    printf "%.6f" "$result"
}

# Function to publish a message
publish_message() {
    local timestamp=$(gdate +%s%3N)
    local topic=$1
    local batch_size=$2
    
    # Handle single message separately to avoid JSON array format
    if [[ $batch_size -eq 1 ]]; then
        local lat=$(random_float $(echo "$center_lat - ($radius/111111)" | bc -l) $(echo "$center_lat + ($radius/111111)" | bc -l))
        local lon=$(random_float $(echo "$center_lon - ($radius/(111111 * cos($center_lat * 3.14159 / 180)))" | bc -l) $(echo "$center_lon + ($radius/(111111 * cos($center_lat * 3.14159 / 180)))" | bc -l))
        local message="{\"lat\":$lat,\"lang\":$lon,\"title\":\"Monumento $timestamp\",\"category\":\"Monuments\",\"timestamp\":\"$timestamp\"}"
        mosquitto_pub -h 127.0.0.1 -t "$topic" -m "$message"
        echo "Published: $message"
    else
        local json_array="{\"list\":["
        for ((i=0; i<$batch_size; i++)); do
            local lat=$(random_float $(echo "$center_lat - ($radius/111111)" | bc -l) $(echo "$center_lat + ($radius/111111)" | bc -l))
            local lon=$(random_float $(echo "$center_lon - ($radius/(111111 * cos($center_lat * 3.14159 / 180)))" | bc -l) $(echo "$center_lon + ($radius/(111111 * cos($center_lat * 3.14159 / 180)))" | bc -l))
            local message="{\"lat\":$lat,\"lang\":$lon,\"title\":\"Monumento $timestamp\",\"category\":\"Monuments\",\"timestamp\":\"$timestamp\"}"
            
            if [[ $i -gt 0 ]]; then
                json_array+=","
            fi
            json_array+="$message"
        done
        json_array+="],\"timestamp\":\"$timestamp\"}" 
        mosquitto_pub -h 127.0.0.1 -t "$topic" -m "$json_array"
        echo "Published: $json_array"
    fi
}

# Interval in milliseconds and max message count

max_messages=$1
topic=$2
interval=$3
batch_size=${4:-1}
counter=0

if [[ -z "$max_messages" || -z "$topic" ]]; then
    echo "Usage: $0 <max_messages> <topic> <interval_ms>? [batch_size]?"
    exit 1
fi

# Main loop
while true; do
    if [[ $counter -lt $max_messages ]]; then
        publish_message $topic $batch_size
        ((counter++))
        if [ ! -z "$interval" ]; then
            sleep $(echo "$interval" | bc -l)
        fi
    else
        break
    fi
done

echo "Finished publishing $max_messages messages."