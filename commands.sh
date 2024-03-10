###Analysis
python scripts/moving_average.py data/drawpoint/*.csv
python scripts/moving_average.py data/movemap/*.csv
python scripts/boxplot_elapsed.py data/drawpoint/*.csv
python scripts/boxplot_elapsed.py data/movemap/*.csv

###DrawPoint
sh tester.sh AndroidKotlinGoogleMaps DrawPoint
sh tester.sh AndroidKotlinMapbox DrawPoint
sh tester.sh iOSSwiftAppleMap DrawPoint
sh tester.sh iOSSwiftMapbox DrawPoint
sh tester.sh AndroidFlutterMapbox DrawPoint
sh tester.sh iOSFlutterMapbox DrawPoint

###MoveMap
sh tester.sh AndroidKotlinGoogleMaps MoveMap
sh tester.sh AndroidKotlinMapbox MoveMap
sh tester.sh iOSSwiftAppleMap MoveMap
sh tester.sh iOSSwiftMapbox MoveMap
sh tester.sh AndroidFlutterMapbox MoveMap
sh tester.sh iOSFlutterMapbox MoveMap

###InAppAlert
sh tester.sh AndroidKotlin InAppAlert
sh tester.sh iOSSwift InAppAlert
sh tester.sh AndroidFlutter InAppAlert
sh tester.sh iOSFlutter InAppAlert 

###InAppNotification
sh tester.sh AndroidKotlin InAppNotification
sh tester.sh iOSSwift InAppNotification
sh tester.sh AndroidFlutter InAppNotification
sh tester.sh iOSFlutter InAppNotification 