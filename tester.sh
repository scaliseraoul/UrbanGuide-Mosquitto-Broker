#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: $0 <topic> <event_type>"
  exit 1
fi

TOPIC=$1
EVENT_TYPE=$2
BATCH_SIZE=${3:-1}
FILE=""
INTERVAL=2

pkill -x mosquitto_sub

case $EVENT_TYPE in
  InAppAlert)
    echo "Handling InAppAlert for topic $TOPIC$EVENT_TYPE"
    FILE="mosquitto_inappalert_generator.sh"
    ;;
  InAppNotification)
    echo "Handling InAppNotification for topic $TOPIC$EVENT_TYPE"
    FILE="mosquitto_inappnotification_generator.sh"
    ;;
  DrawPoint)
    echo "Handling DrawPoint for topic $TOPIC$EVENT_TYPE"
    FILE="mosquitto_drawpoint_generator.sh"
    ;;
  DrawPointBatch)
    echo "Handling DrawPoint for topic $TOPIC$EVENT_TYPE"
    FILE="mosquitto_drawpoint_generator.sh"
    ;;
  MoveMap)
    echo "Handling MoveMap for topic $TOPIC$EVENT_TYPE"
    FILE="mosquitto_movemap_generator.sh"
    ;;
  *)
    echo "Error: Invalid event type. Please use one of the following: InAppAlert, InAppNotification, DrawPoint, MoveMap."
    exit 2
    ;;
esac

echo "Generating $BATCH_SIZE events every $INTERVAL seconds"

BACKUP_DIR="backup"
FILE_PATH="${TOPIC}${EVENT_TYPE}${BATCH_SIZE}.csv"
BACKUP_FILE="${BACKUP_DIR}/${TOPIC}${EVENT_TYPE}${BATCH_SIZE}_$(gdate +%s).csv"

if [ -f "$FILE_PATH" ]; then
  mkdir -p "$BACKUP_DIR"
  mv "$FILE_PATH" "$BACKUP_FILE"
fi

echo "TIMESTAMP_SENT,OS,LANGUAGE,MAP,EVENT,CONF,LATENCY,ELAPSED_TIME,TIMESTAMP_RECEIVED" > $FILE_PATH
mosquitto_sub -h localhost -t "${TOPIC}${EVENT_TYPE}Complete" | while read line; do echo "$line,$(gdate +%s%3N)"; done >> $FILE_PATH &


sh $FILE 100 ${TOPIC}${EVENT_TYPE}Receive $INTERVAL $BATCH_SIZE

exit 0
