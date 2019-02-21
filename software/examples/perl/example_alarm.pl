#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletPiezoSpeakerV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $ps = Tinkerforge::BrickletPiezoSpeakerV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# 10 seconds of loud annoying fast alarm
$ps->set_alarm(800, 2000, 10, 1, 10, 10000);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
