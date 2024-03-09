###Analysis
python scripts/moving_average.py data/drawpoint/*.csv
python scripts/moving_average.py data/movemap/*.csv

python scripts/boxplot_elapsed.py data/drawpoint/*.csv
python scripts/boxplot_elapsed.py data/movemap/*.csv
#test

sh mosquitto_marker_generator.sh 100 test

###Android Kotlin

##GoogleMaps

#drawPoint
sh mosquitto_marker_generator.sh 100 AndroidKotlinGoogleMapsDrawPointReceive
sh mosquitto_marker_generator.sh 100 AndroidKotlinGoogleMapsDrawPointReceive 1

mosquitto_sub -h localhost -t "AndroidKotlinGoogleMapsDrawPointComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidKotlinGoogleMapsDrawPoint.csv

#moveMap
sh mosquitto_movemap_generator.sh 100 AndroidKotlinGoogleMapsMoveMapReceive 2

mosquitto_sub -h localhost -t "AndroidKotlinGoogleMapsMoveMapComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidKotlinGoogleMapsMoveMap.csv


##MapBox

#drawPoint
sh mosquitto_marker_generator.sh 100 AndroidKotlinMapboxDrawPointReceive
sh mosquitto_marker_generator.sh 100 AndroidKotlinMapboxDrawPointReceive 1

mosquitto_sub -h localhost -t "AndroidKotlinMapboxDrawPointComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidKotlinMapboxDrawPoint.csv

#moveMap
sh mosquitto_movemap_generator.sh 100 AndroidKotlinMapboxMoveMapReceive 2

mosquitto_sub -h localhost -t "AndroidKotlinMapboxMoveMapComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidKotlinMapboxMoveMap.csv

###iOS Swift

##General

#inAppAlert iOSSwiftInAppAlertReceive
sh mosquitto_inappalert_generator.sh 100 iOSSwiftInAppAlertReceive 2

mosquitto_sub -h localhost -t "iOSSwiftInAppAlertComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSSwiftInAppAlert.csv



#inAppNotification iOSSwiftInAppNotificationReceive
sh mosquitto_inappnotification_generator.sh 100 iOSSwiftInAppNotificationReceive 2

mosquitto_sub -h localhost -t "iOSSwiftInAppNotificationComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSSwiftInAppNotification.csv



##Apple Maps

#drawPoint
sh mosquitto_marker_generator.sh 100 iOSSwiftAppleMapDrawPointReceive
sh mosquitto_marker_generator.sh 100 iOSSwiftAppleMapDrawPointReceive 1

mosquitto_sub -h localhost -t "iOSSwiftAppleMapDrawPointComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSSwiftAppleMapDrawPoint.csv

#moveMap
sh mosquitto_movemap_generator.sh 100 iOSSwiftAppleMapMoveMapReceive 2

mosquitto_sub -h localhost -t "iOSSwiftAppleMapMoveMapComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSSwiftAppleMapMoveMap.csv

##Mapbox

#drawPoint
sh mosquitto_marker_generator.sh 100 iOSSwiftMapboxDrawPointReceive
sh mosquitto_marker_generator.sh 100 iOSSwiftMapboxDrawPointReceive 1

mosquitto_sub -h localhost -t "iOSSwiftMapboxDrawPointComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSSwiftMapboxDrawPoint.csv

#moveMap
sh mosquitto_movemap_generator.sh 100 iOSSwiftMapboxMoveMapReceive 2

mosquitto_sub -h localhost -t "iOSSwiftMapboxMoveMapComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSSwiftMapboxMoveMap.csv


###FlutterMapbox

##Android

#drawPoint
sh mosquitto_marker_generator.sh 100 AndroidFlutterMapboxDrawPointReceive
sh mosquitto_marker_generator.sh 100 AndroidFlutterMapboxDrawPointReceive 1

mosquitto_sub -h localhost -t "AndroidFlutterMapboxDrawPointComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidFlutterMapboxDrawPoint.csv

#moveMap
sh mosquitto_movemap_generator.sh 100 AndroidFlutterMapboxMoveMapReceive 2

mosquitto_sub -h localhost -t "AndroidFlutterMapboxMoveMapComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidFlutterMapboxMoveMap.csv

#inAppAlert
sh mosquitto_inappalert_generator.sh 100 AndroidFlutterInAppAlertReceive 2

mosquitto_sub -h localhost -t "AndroidFlutterInAppAlertComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidFlutterInAppAlert.csv

#inAppNotification AndroidFlutterInAppNotificationReceive
sh mosquitto_inappnotification_generator.sh 100 AndroidFlutterInAppNotificationReceive 2

mosquitto_sub -h localhost -t "AndroidFlutterInAppNotificationComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > AndroidFlutterInAppNotification.csv

##iOS

#drawPoint
sh mosquitto_marker_generator.sh 100 iOSFlutterMapboxDrawPointReceive
sh mosquitto_marker_generator.sh 100 iOSFlutterMapboxDrawPointReceive 1

mosquitto_sub -h localhost -t "iOSFlutterMapboxDrawPointComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSFlutterMapboxDrawPoint.csv

#moveMap  -- iOSFlutterMapboxmoveMapReceive
sh mosquitto_movemap_generator.sh 100 iOSFlutterMapboxMoveMapReceive 2

mosquitto_sub -h localhost -t "iOSFlutterMapboxMoveMapComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSFlutterMapboxMoveMap.csv

#inAppAlert iOSFlutterInAppAlertReceive
sh mosquitto_inappalert_generator.sh 100 iOSFlutterInAppAlertReceive 2

mosquitto_sub -h localhost -t "iOSFlutterInAppAlertComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSFlutterInAppAlert.csv

#inAppNotification iOSFlutterInAppNotificationReceive
sh mosquitto_inappnotification_generator.sh 100 iOSFlutterInAppNotificationReceive 2

mosquitto_sub -h localhost -t "iOSFlutterInAppNotificationComplete" | while read line; do echo "$line,$(gdate +%s%3N)"; done > iOSFlutterInAppNotification.csv
