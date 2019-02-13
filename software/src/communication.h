/* piezo-speaker-v2-bricklet
 * Copyright (C) 2018-2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
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

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define PIEZO_SPEAKER_V2_BEEP_DURATION_OFF 0
#define PIEZO_SPEAKER_V2_BEEP_DURATION_INFINITE 4294967295

#define PIEZO_SPEAKER_V2_ALARM_DURATION_OFF 0
#define PIEZO_SPEAKER_V2_ALARM_DURATION_INFINITE 4294967295

#define PIEZO_SPEAKER_V2_BOOTLOADER_MODE_BOOTLOADER 0
#define PIEZO_SPEAKER_V2_BOOTLOADER_MODE_FIRMWARE 1
#define PIEZO_SPEAKER_V2_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define PIEZO_SPEAKER_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define PIEZO_SPEAKER_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define PIEZO_SPEAKER_V2_BOOTLOADER_STATUS_OK 0
#define PIEZO_SPEAKER_V2_BOOTLOADER_STATUS_INVALID_MODE 1
#define PIEZO_SPEAKER_V2_BOOTLOADER_STATUS_NO_CHANGE 2
#define PIEZO_SPEAKER_V2_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define PIEZO_SPEAKER_V2_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define PIEZO_SPEAKER_V2_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define PIEZO_SPEAKER_V2_STATUS_LED_CONFIG_OFF 0
#define PIEZO_SPEAKER_V2_STATUS_LED_CONFIG_ON 1
#define PIEZO_SPEAKER_V2_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define PIEZO_SPEAKER_V2_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_SET_BEEP 1
#define FID_GET_BEEP 2
#define FID_SET_ALARM 3
#define FID_GET_ALARM 4
#define FID_UPDATE_VOLUME 5
#define FID_UPDATE_FREQUENCY 6

#define FID_CALLBACK_BEEP_FINISHED 7
#define FID_CALLBACK_ALAM_FINISHED 8

typedef struct {
	TFPMessageHeader header;
	uint16_t frequency;
	uint8_t volume;
	uint32_t duration;
} __attribute__((__packed__)) SetBeep;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetBeep;

typedef struct {
	TFPMessageHeader header;
	uint16_t frequency;
	uint8_t volume;
	uint32_t duration;
	uint32_t duration_remaining;
} __attribute__((__packed__)) GetBeep_Response;

typedef struct {
	TFPMessageHeader header;
	uint16_t start_frequency;
	uint16_t end_frequency;
	uint16_t step_size;
	uint16_t step_delay;
	uint8_t volume;
	uint32_t duration;
} __attribute__((__packed__)) SetAlarm;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetAlarm;

typedef struct {
	TFPMessageHeader header;
	uint16_t start_frequency;
	uint16_t end_frequency;
	uint16_t step_size;
	uint16_t step_delay;
	uint8_t volume;
	uint32_t duration;
	uint32_t duration_remaining;
	uint16_t current_frequency;
} __attribute__((__packed__)) GetAlarm_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t volume;
} __attribute__((__packed__)) UpdateVolume;

typedef struct {
	TFPMessageHeader header;
	uint16_t frequency;
} __attribute__((__packed__)) UpdateFrequency;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) BeepFinished_Callback;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) AlamFinished_Callback;


// Function prototypes
BootloaderHandleMessageResponse set_beep(const SetBeep *data);
BootloaderHandleMessageResponse get_beep(const GetBeep *data, GetBeep_Response *response);
BootloaderHandleMessageResponse set_alarm(const SetAlarm *data);
BootloaderHandleMessageResponse get_alarm(const GetAlarm *data, GetAlarm_Response *response);
BootloaderHandleMessageResponse update_volume(const UpdateVolume *data);
BootloaderHandleMessageResponse update_frequency(const UpdateFrequency *data);

// Callbacks
bool handle_beep_finished_callback(void);
bool handle_alam_finished_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 2
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_beep_finished_callback, \
	handle_alam_finished_callback, \


#endif
