#!/bin/bash

#xcrun simctl listapps 0AB92CCB-C67D-4CE0-A4B7-B702A3721C32
#xcrun simctl list devices

APP_BUNDLE_IDENTIFIER="Raoul.UrbanGuide"
SIMULATOR_DEVICE_ID='0AB92CCB-C67D-4CE0-A4B7-B702A3721C32'

# Loop through the sequence 2, 4, 8, 16
for i in 2 4 8 16
do
    # Stop the app 
    xcrun simctl terminate "$SIMULATOR_DEVICE_ID" "$APP_BUNDLE_IDENTIFIER"

    sleep 5

    # Launch the app
    xcrun simctl launch "$SIMULATOR_DEVICE_ID" "$APP_BUNDLE_IDENTIFIER"
    
    sleep 15
    
    sh tester.sh iOSSwiftAppleMap DrawPointBatch $i &
    sh tester.sh iOSSwift InAppAlert $i

    # Wait for another 10 seconds
    sleep 15
done