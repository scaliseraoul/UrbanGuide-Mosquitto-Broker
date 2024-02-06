#!/bin/bash

# Mosquitto Control

start_mosquitto() {
    echo "Starting Mosquitto MQTT Broker..."
    brew services start mosquitto
    echo "Mosquitto started."
}

stop_mosquitto() {
    echo "Stopping Mosquitto MQTT Broker..."
    brew services stop mosquitto
    echo "Mosquitto stopped."
}

status_mosquitto() {
    echo "Checking Mosquitto status..."
    brew services list | grep mosquitto
}

case "$1" in
    start)
        start_mosquitto
        ;;
    stop)
        stop_mosquitto
        ;;
    status)
        status_mosquitto
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        exit 1
esac
