function octave_example_beep()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    ps = javaObject("com.tinkerforge.BrickletPiezoSpeakerV2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Make 2 second beep with a frequency of 1kHz
    ps.setBeep(1000, 0, 2000);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
