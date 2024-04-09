#!/bin/bash

# Identifier for your app, replace with your actual app's bundle identifier
APP_BUNDLE_IDENTIFIER="com.example.urbanGuideFlutter"

# The device ID of the simulator you want to target
SIMULATOR_DEVICE_ID='0AB92CCB-C67D-4CE0-A4B7-B702A3721C32'

# Loop through the sequence 2, 4, 8, 16
for i in 2 4 8 16
do
    # Stop the app 
    xcrun simctl terminate "$SIMULATOR_DEVICE_ID" "$APP_BUNDLE_IDENTIFIER"

    sleep 5

    # Launch the app
    xcrun simctl launch "$SIMULATOR_DEVICE_ID" "$APP_BUNDLE_IDENTIFIER"
    
    # Wait for 10 seconds
    sleep 10
    
    # Launch another script with i as argument
    sh tester.sh iOSFlutterMapbox DrawPointBatch $i
    
    # Wait for another 10 seconds
    sleep 10
done