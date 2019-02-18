<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletPiezoSpeakerV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletPiezoSpeakerV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

$ipcon = new IPConnection(); // Create IP connection
$ps = new BrickletPiezoSpeakerV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// 10 seconds of loud annoying fast alarm
$ps->setAlarm(800, 2000, 10, 1, 10, 10000);

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
