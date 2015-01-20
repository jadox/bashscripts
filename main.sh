#!/bin/bash

echo "Looking for new entries..."
date>>log.txt
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'>tmp.txt
entries=$(wc -l <tmp.txt);
echo $entries;

if [ $entries == 0 ]
then say "Nothing found!"
else say "Found stuff on database!" echo "$entries"
fi

#say "Nothing else to do!"
#osascript<<EOF
#try
#tell application id "com.apple.ScreenSaver.Engine" to launch
#end try
#EOF


say "Done!"
