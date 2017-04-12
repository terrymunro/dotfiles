#!/bin/bash

declare -i ID
ID=`xinput list | grep -Eo 'Set 2 keyboard\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}$'`

xinput set-prop $ID "Device Enabled" 1

echo 'Keyboard has been enabled.'
