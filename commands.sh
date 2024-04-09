###Analysis
python scripts/moving_average_elapsed.py data/drawpoint/*.csv
python scripts/moving_average_elapsed.py data/movemap/*.csv
python scripts/moving_average_elapsed.py data/inappalert/*.csv
python scripts/moving_average_elapsed.py data/inappnotification/*.csv

python scripts/moving_average_total_elapsed.py data/drawpoint/*.csv
python scripts/moving_average_total_elapsed.py data/movemap/*.csv
python scripts/moving_average_total_elapsed.py data/inappalert/*.csv
python scripts/moving_average_total_elapsed.py data/inappnotification/*.csv

python scripts/boxplot_elapsed.py data/drawpoint/*.csv
python scripts/boxplot_elapsed.py data/movemap/*.csv
python scripts/boxplot_elapsed.py data/inappalert/*.csv
python scripts/boxplot_elapsed.py data/inappnotification/*.csv

python scripts/boxplot_total_elapsed.py data/drawpoint/*.csv
python scripts/boxplot_total_elapsed.py data/movemap/*.csv
python scripts/boxplot_total_elapsed.py data/inappalert/*.csv
python scripts/boxplot_total_elapsed.py data/inappnotification/*.csv

python scripts/analyzer.py data/drawpoint/*.csv
python scripts/analyzer.py data/drawpointbatch/*.csv
python scripts/analyzer.py data/movemap/*.csv
python scripts/analyzer.py data/inappalert/*.csv
python scripts/analyzer.py data/inappalertbatch/*.csv
python scripts/analyzer.py data/inappnotification/*.csv

###DrawPoint
sh tester.sh AndroidKotlinGoogleMaps DrawPoint
sh tester.sh AndroidKotlinMapbox DrawPoint
sh tester.sh iOSSwiftAppleMap DrawPoint
sh tester.sh iOSSwiftMapbox DrawPoint
sh tester.sh AndroidFlutterMapbox DrawPoint
sh tester.sh iOSFlutterMapbox DrawPoint

###DrawPointBatch 2
sh tester.sh AndroidKotlinGoogleMaps DrawPointBatch 2
sh tester.sh AndroidKotlinMapbox DrawPointBatch 2
sh tester.sh iOSSwiftAppleMap DrawPointBatch 2
sh tester.sh iOSSwiftMapbox DrawPointBatch 2
sh tester.sh AndroidFlutterMapbox DrawPointBatch 2
sh tester.sh iOSFlutterMapbox DrawPointBatch 2

###DrawPointBatch 4
sh tester.sh AndroidKotlinGoogleMaps DrawPointBatch 4
sh tester.sh AndroidKotlinMapbox DrawPointBatch 4
sh tester.sh iOSSwiftAppleMap DrawPointBatch 4
sh tester.sh iOSSwiftMapbox DrawPointBatch 4
sh tester.sh AndroidFlutterMapbox DrawPointBatch 4
sh tester.sh iOSFlutterMapbox DrawPointBatch 4

###DrawPointBatch 8
sh tester.sh AndroidKotlinGoogleMaps DrawPointBatch 8
sh tester.sh AndroidKotlinMapbox DrawPointBatch 8
sh tester.sh iOSSwiftAppleMap DrawPointBatch 8
sh tester.sh iOSSwiftMapbox DrawPointBatch 8
sh tester.sh AndroidFlutterMapbox DrawPointBatch 8
sh tester.sh iOSFlutterMapbox DrawPointBatch 8

###DrawPointBatch 16
sh tester.sh AndroidKotlinGoogleMaps DrawPointBatch 16
sh tester.sh AndroidKotlinMapbox DrawPointBatch 16
sh tester.sh iOSSwiftAppleMap DrawPointBatch 16
sh tester.sh iOSSwiftMapbox DrawPointBatch 16
sh tester.sh AndroidFlutterMapbox DrawPointBatch 16
sh tester.sh iOSFlutterMapbox DrawPointBatch 16

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