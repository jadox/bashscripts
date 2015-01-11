#!/bin/bash

echo "Hello there!"
say "Nothing else to do!"
osascript<<EOF
try
tell application id "com.apple.ScreenSaver.Engine" to launch
end try
EOF

say "Nothing"
