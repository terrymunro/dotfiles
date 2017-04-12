#!/bin/bash

declare -i ID
ID=`xinput list | grep -Eo 'Set\s2\skeyboard\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}$'`

xinput set-prop $ID "Device Enabled" 0

echo 'Keyboard has been disabled.'
