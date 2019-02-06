/* piezo-speaker-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/protocols/tfp/tfp.h"

#include "speaker.h"

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_BEEP: return beep(message);
		case FID_MORSE_CODE: return morse_code(message);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse beep(const Beep *data) {
	speaker.beep_start     = true;
	speaker.beep_duration  = data->duration;
	speaker.beep_frequency = data->frequency;
	speaker.beep_volume    = data->volume;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse morse_code(const MorseCode *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}


bool handle_beep_finished_callback(void) {
	static bool is_buffered = false;
	static BeepFinished_Callback cb;

	if(!is_buffered) {
		if(speaker.beep_done) {
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(BeepFinished_Callback), FID_CALLBACK_BEEP_FINISHED);
			speaker.beep_done = false;
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(BeepFinished_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

bool handle_morse_code_finished_callback(void) {
	static bool is_buffered = false;
	static MorseCodeFinished_Callback cb;

	if(!is_buffered) {
		tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(MorseCodeFinished_Callback), FID_CALLBACK_MORSE_CODE_FINISHED);
		// TODO: Implement MorseCodeFinished callback handling

		return false;
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(MorseCodeFinished_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	communication_callback_init();
}
