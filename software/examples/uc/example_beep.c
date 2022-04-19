// This example is not self-contained.
// It requres usage of the example driver specific to your platform.
// See the HAL documentation.

#include "bindings/hal_common.h"
#include "bindings/bricklet_piezo_speaker_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

void check(int rc, const char* msg);

void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);


static TF_PiezoSpeakerV2 ps;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_piezo_speaker_v2_create(&ps, UID, hal), "create device object");

	// Make 2 second beep with a frequency of 1kHz
	check(tf_piezo_speaker_v2_set_beep(&ps, 1000, 0, 2000), "call set_beep");
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
