#!/bin/bash

# Starting with i = 2, increment by 2 each time
for i in 2 4 8 16
do
    adb shell am force-stop com.example.urban_guide_flutter
    
    sleep 5

    # Launch com.urbanguide
    adb shell am start -n com.example.urban_guide_flutter/.MainActivity # Adjust the activity name if needed
    
    # Wait for 10 seconds
    sleep 10
    
    # Launch another script with i as argument
    sh tester.sh AndroidFlutterMapbox DrawPointBatch $i
    
    # Wait for another 10 seconds
    sleep 5
done
