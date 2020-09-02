// This example is not self-contained.
// It requres usage of the example driver specific to your platform.
// See the HAL documentation.

#include "bindings/hal_common.h"
#include "bindings/bricklet_piezo_speaker_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Piezo Speaker Bricklet 2.0

void check(int rc, const char* msg);

void example_setup(TF_HalContext *hal);
void example_loop(TF_HalContext *hal);


static TF_PiezoSpeakerV2 ps;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_piezo_speaker_v2_create(&ps, UID, hal), "create device object");

	// 10 seconds of loud annoying fast alarm
	check(tf_piezo_speaker_v2_set_alarm(&ps, 800, 2000, 10, 1, 10,
	                                    10000), "call set_alarm");
}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
