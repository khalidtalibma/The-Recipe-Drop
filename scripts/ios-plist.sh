#!/usr/bin/env bash
# Adds the Info.plist keys the app needs (Bluetooth for xBloom, encryption export compliance).
set -euo pipefail
PLIST="ios/App/App/Info.plist"
set_key () { /usr/libexec/PlistBuddy -c "Delete :$1" "$PLIST" 2>/dev/null || true; /usr/libexec/PlistBuddy -c "Add :$1 $2 $3" "$PLIST"; }
set_key NSBluetoothAlwaysUsageDescription string "The Recipe Drop uses Bluetooth to connect to your xBloom coffee machine so you can start a brew and follow every pour live."
set_key NSBluetoothPeripheralUsageDescription string "The Recipe Drop uses Bluetooth to connect to your xBloom coffee machine."
set_key ITSAppUsesNonExemptEncryption bool false
set_key CFBundleDisplayName string "Recipe Drop"
set_key UIRequiresFullScreen bool true
# portrait only
/usr/libexec/PlistBuddy -c "Delete :UISupportedInterfaceOrientations" "$PLIST" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :UISupportedInterfaceOrientations array" "$PLIST"
/usr/libexec/PlistBuddy -c "Add :UISupportedInterfaceOrientations:0 string UIInterfaceOrientationPortrait" "$PLIST"
echo "Info.plist updated"
