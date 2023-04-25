#!/bin/bash

URL="$POPCLIP_TEXT"
#ADB_PATH="/usr/local/bin/adb"
ADB_PATH="$HOME/Library/Android/sdk/platform-tools/adb"

echo "Sending URL: $URL"
$ADB_PATH devices | grep -v "List of devices" | awk '{print $1}' | while read -r device; do
    echo "Sending URL to device: $device"
    $ADB_PATH -s "$device" shell am start -a android.intent.action.VIEW -d "$URL"
done
