function matlab_example_beep()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletPiezoSpeakerV2;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

    ipcon = IPConnection(); % Create IP connection
    ps = handle(BrickletPiezoSpeakerV2(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Make 2 second beep with a frequency of 1kHz
    ps.setBeep(1000, 0, 2000);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
