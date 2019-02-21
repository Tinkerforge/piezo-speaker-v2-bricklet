use std::{error::Error, io};

use tinkerforge::{ip_connection::IpConnection, piezo_speaker_v2_bricklet::*};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Piezo Speaker Bricklet 2.0.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let ps = PiezoSpeakerV2Bricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // 10 seconds of loud annoying fast alarm
    ps.set_alarm(800, 2000, 10, 1, 10, 10000);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
