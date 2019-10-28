/* piezo-speaker-v2-bricklet
 * Copyright (C) 2018-2019 Olaf Lüke <olaf@tinkerforge.com>
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
#include "bricklib2/hal/system_timer/system_timer.h"

#include "speaker.h"

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_SET_BEEP: return set_beep(message);
		case FID_GET_BEEP: return get_beep(message, response);
		case FID_SET_ALARM: return set_alarm(message);
		case FID_GET_ALARM: return get_alarm(message, response);
		case FID_UPDATE_VOLUME: return update_volume(message);
		case FID_UPDATE_FREQUENCY: return update_frequency(message);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_beep(const SetBeep *data) {
	if((data->frequency < 50) || (data->frequency > 15000)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	if(data->volume > 10) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	speaker.beep_start     = true;
	speaker.beep_frequency = data->frequency;
	speaker.volume         = data->volume;
	speaker.beep_duration  = data->duration;
	speaker.beep_done      = false;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_beep(const GetBeep *data, GetBeep_Response *response) {
	response->header.length = sizeof(GetBeep_Response);
	response->frequency     = speaker.beep_frequency;
	response->volume        = speaker.volume;
	response->duration      = speaker.beep_duration;

	uint32_t beep_duration = system_timer_get_ms() - speaker.beep_start_time;
	if(speaker.beep_done || (beep_duration >= speaker.beep_duration)) {
		response->duration_remaining = 0;
	} else {
		response->duration_remaining = speaker.beep_duration - beep_duration;
	}

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_alarm(const SetAlarm *data) {
	if((data->start_frequency < 50) || (data->start_frequency > 15000)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	if((data->end_frequency < 50) || (data->end_frequency > 15000)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	if(data->start_frequency >= data->end_frequency) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	if(data->volume > 10) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	if(data->step_size >= (data->end_frequency - data->start_frequency)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	speaker.alarm_start             = true;
	speaker.alarm_start_frequency   = data->start_frequency;
	speaker.alarm_end_frequency     = data->end_frequency;
	speaker.alarm_step_size         = data->step_size;
	speaker.alarm_step_delay        = data->step_delay;
	speaker.volume                  = data->volume;
	speaker.alarm_duration          = data->duration;
	speaker.alarm_current_frequency = data->start_frequency;
	speaker.alarm_done              = false;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_alarm(const GetAlarm *data, GetAlarm_Response *response) {
	response->header.length     = sizeof(GetAlarm_Response);
	response->start_frequency   = speaker.alarm_start_frequency;
	response->end_frequency     = speaker.alarm_end_frequency;
	response->step_size         = speaker.alarm_step_size;
	response->step_delay        = speaker.alarm_step_delay;
	response->volume            = speaker.volume;
	response->duration          = speaker.alarm_duration;
	response->current_frequency = speaker.alarm_current_frequency;

	uint32_t alarm_duration = system_timer_get_ms() - speaker.alarm_start;
	if(speaker.alarm_done || (alarm_duration >= speaker.alarm_duration)) {
		response->duration_remaining = 0;
	} else {
		response->duration_remaining = speaker.alarm_duration - alarm_duration;
	}

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse update_volume(const UpdateVolume *data) {
	if(data->volume > 10) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	speaker.volume = data->volume;
	speaker_update_volume();

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse update_frequency(const UpdateFrequency *data) {
	if((data->frequency < 50) || (data->frequency > 15000)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	// Don't update frequency if an alarm is ongoing
	if(!speaker.alarm_start && (speaker.alarm_duration == 0)) {
		// Only update if beep is ongoing
		speaker.beep_frequency = data->frequency;
		if(speaker.beep_start_time != 0) {
			speaker_set_frequency(data->frequency);
		}
	}

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}




bool handle_beep_finished_callback(void) {
	static bool is_buffered = false;
	static BeepFinished_Callback cb;

	if(!is_buffered) {
		if(speaker.beep_done) {
			speaker.beep_done = false;
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(BeepFinished_Callback), FID_CALLBACK_BEEP_FINISHED);
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

bool handle_alam_finished_callback(void) {
	static bool is_buffered = false;
	static AlamFinished_Callback cb;

	if(!is_buffered) {
		if(speaker.alarm_done) {
			speaker.alarm_done = false;
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(AlamFinished_Callback), FID_CALLBACK_ALAM_FINISHED);
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(AlamFinished_Callback));
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
