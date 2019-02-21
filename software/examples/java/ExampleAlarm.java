import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletPiezoSpeakerV2;

public class ExampleAlarm {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Piezo Speaker Bricklet 2.0
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletPiezoSpeakerV2 ps = new BrickletPiezoSpeakerV2(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// 10 seconds of loud annoying fast alarm
		ps.setAlarm(800, 2000, 10, 1, 10, 10000);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
