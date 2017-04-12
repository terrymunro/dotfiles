#!/bin/bash

declare -i ID
ID=`xinput list | grep -Eo 'TouchPad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`

xinput set-prop $ID "Device Enabled" 0

echo 'Touchpad has been disabled.'
