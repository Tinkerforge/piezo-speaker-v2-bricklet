Imports System
Imports Tinkerforge

Module ExampleAlarm
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim ps As New BrickletPiezoSpeakerV2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' 10 seconds of loud annoying fast alarm
        ps.SetAlarm(800, 2000, 10, 1, 10, 10000)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
