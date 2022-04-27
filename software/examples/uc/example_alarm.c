// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_piezo_speaker_v2.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

static TF_PiezoSpeakerV2 ps;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_piezo_speaker_v2_create(&ps, NULL, hal), "create device object");

	// 10 seconds of loud annoying fast alarm
	check(tf_piezo_speaker_v2_set_alarm(&ps, 800, 2000, 10, 1, 10,
	                                    10000), "call set_alarm");
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
