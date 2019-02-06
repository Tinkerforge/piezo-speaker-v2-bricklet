/* piezo-speaker-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * speaker.c: Driver for speaker
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "speaker.h"

#include "configs/config_speaker.h"

#include "bricklib2/utility/util_definitions.h"
#include "bricklib2/hal/ccu4_pwm/ccu4_pwm.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#define SPEAKER_PIN_NUM 8

#define SPEAKER_PIN_VALUE_LOW   0
#define SPEAKER_PIN_VALUE_HIGH  1
#define SPEAKER_PIN_VALUE_FLOAT 2

const XMC_GPIO_CONFIG_t speaker_config_low = {
	.mode                = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
	.output_level        = XMC_GPIO_OUTPUT_LEVEL_LOW,
};

const XMC_GPIO_CONFIG_t speaker_config_high = {
	.mode                = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
	.output_level        = XMC_GPIO_OUTPUT_LEVEL_HIGH,
};

const XMC_GPIO_CONFIG_t speaker_config_float = {
	.mode                = XMC_GPIO_MODE_INPUT_TRISTATE,
	.input_hysteresis    = XMC_GPIO_INPUT_HYSTERESIS_STANDARD,
};

typedef struct {
	XMC_GPIO_PORT_t *port;
	uint8_t pin;
} SpeakerPin;

SpeakerPin speaker_pins[SPEAKER_PIN_NUM] = {
	{SPEAKER_LR0_PIN}, {SPEAKER_LR1_PIN}, {SPEAKER_LR2_PIN}, {SPEAKER_LR3_PIN},
	{SPEAKER_SU0_PIN}, {SPEAKER_SU1_PIN}, {SPEAKER_SU2_PIN}, {SPEAKER_SU3_PIN},
};

Speaker speaker;

// Volume bitmask for 11 different volume levels:
// bit 8          | bit 7 | bit 6 | bit 5 | bit 4 | bit 3 | bit 2 | bit 1 | bit 0
// Enable Step-Up | SU3   | SU2   | SU1   | SU0   | LR3   | LR2   | LR1   | LR0
const uint16_t speaker_volume[11] = {
	0b011110000, // 1.55V LR
	0b011110111, // 1.86V LR
	0b011111010, // 2.10V LR
	0b011111011, // 2.32V LR
	0b011111100, // 2.60V LR
	0b011111101, // 3.28V LR
	0b011111110, // 3.88V LR
	0b101111110, // 5.7V  SU
	0b100111110, // 10.1V SU
	0b100011110, // 14.6V SU
	0b100001110, // 19.1V SU
};

void speaker_set_pin(uint8_t pin, uint8_t value) {
	switch(value) {
		case SPEAKER_PIN_VALUE_LOW:   XMC_GPIO_Init(speaker_pins[pin].port, speaker_pins[pin].pin, &speaker_config_low);   break;
		case SPEAKER_PIN_VALUE_HIGH:  XMC_GPIO_Init(speaker_pins[pin].port, speaker_pins[pin].pin, &speaker_config_high);  break;
		case SPEAKER_PIN_VALUE_FLOAT: XMC_GPIO_Init(speaker_pins[pin].port, speaker_pins[pin].pin, &speaker_config_float); break;
	}

}

void speaker_set_frequency(uint32_t frequency) {
	if(frequency == 0) {
		XMC_GPIO_Init(SPEAKER_PWM_PIN, &speaker_config_low);
	} else {
		uint32_t period = MIN(1000000/frequency, UINT16_MAX);
		ccu4_pwm_init(SPEAKER_PWM_PIN, SPEAKER_PWM_SLICE, period);
		ccu4_pwm_set_duty_cycle(SPEAKER_PWM_SLICE, period/2);
	}
}

void speaker_update_volume(void) {
		uint16_t volume_bitmask = speaker_volume[MIN(10, speaker.beep_volume)];
		for(uint8_t i = 0; i < 8; i++) {
			if(volume_bitmask & (1 << i)) {
				speaker_set_pin(i, SPEAKER_PIN_VALUE_FLOAT);
			} else {
				speaker_set_pin(i, SPEAKER_PIN_VALUE_LOW);
			}
		}

		if(volume_bitmask & (1 << 8)) {
			XMC_GPIO_SetOutputHigh(SPEAKER_SUS_PIN);
		} else {
			XMC_GPIO_SetOutputLow(SPEAKER_SUS_PIN);
		}
}

void speaker_init(void) {
	memset(&speaker, 0, sizeof(Speaker));

	speaker.beep_volume = 0;
	speaker.beep_frequency = 1000;
	speaker.beep_duration = 1000;

	XMC_GPIO_Init(SPEAKER_SUS_PIN, &speaker_config_low);

	speaker_set_frequency(0);
	speaker_update_volume();

}

void speaker_tick(void) {
	if(speaker.beep_start) {
		speaker_update_volume();

		speaker.beep_start = false;
		speaker.beep_start_time = system_timer_get_ms();
		speaker_set_frequency(speaker.beep_frequency);
	}
	if((speaker.beep_start_time != 0) && system_timer_is_time_elapsed_ms(speaker.beep_start_time, speaker.beep_duration)) {
		speaker_set_frequency(0);
		speaker.beep_start_time = 0;
		speaker.beep_done = true;
	}
}