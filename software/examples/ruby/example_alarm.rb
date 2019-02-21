#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_piezo_speaker_v2'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

ipcon = IPConnection.new # Create IP connection
ps = BrickletPiezoSpeakerV2.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# 10 seconds of loud annoying fast alarm
ps.set_alarm 800, 2000, 10, 1, 10, 10000

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
