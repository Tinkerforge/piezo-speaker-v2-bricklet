#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

# 10 seconds of loud annoying fast alarm
tinkerforge call piezo-speaker-v2-bricklet $uid set-alarm 800 2000 10 1 10 10000
