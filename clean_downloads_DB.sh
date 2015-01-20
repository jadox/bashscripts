#!/bin/bash

echo "Looking for new entries..."
date>>log.txt
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'>tmp.txt
entries=$(wc -l <tmp.txt);
#echo $entries;

if [ $entries == 0 ]
then
echo -e "Nothing found!"
echo -e "Database Empty">>log.txt
echo -e "- - - - - - - - - - - - - - - - - - - - - - -">>log.txt
rm tmp.txt
else
echo "Found $entries entries on database!"
echo -e "$entries entries found.\n">>log.txt
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
echo "Sqlite3 database cleared."
echo -e "Sqlite3 database cleared.">>log.txt
echo -e "- - - - - - - - - - - - - - - - - - - - - - -">>log.txt
rm tmp.txt
fi
echo -e "Done."
