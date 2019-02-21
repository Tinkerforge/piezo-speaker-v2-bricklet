function octave_example_alarm()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    ps = javaObject("com.tinkerforge.BrickletPiezoSpeakerV2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % 10 seconds of loud annoying fast alarm
    ps.setAlarm(800, 2000, 10, 1, 10, 10000);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
