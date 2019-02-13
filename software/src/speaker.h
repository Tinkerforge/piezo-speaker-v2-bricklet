/* piezo-speaker-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * speaker.h: Driver for speaker
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

#ifndef SPEAKER_H
#define SPEAKER_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
    uint8_t volume;

    bool beep_start;
    uint32_t beep_start_time;
    uint16_t beep_frequency;
    uint32_t beep_duration;
    bool beep_done;

    bool alarm_start;
    uint32_t alarm_start_time;
    uint32_t alarm_last_time;
    int8_t alarm_direction;
    uint16_t alarm_start_frequency;
    uint16_t alarm_end_frequency;
    uint16_t alarm_step_size;
    uint16_t alarm_step_delay;
    uint32_t alarm_duration;
    uint16_t alarm_current_frequency;
    bool alarm_done;

    bool pwm_is_init;
} Speaker;

extern Speaker speaker;

void speaker_set_frequency(const uint32_t frequency);
void speaker_update_volume(void);
void speaker_init(void);
void speaker_tick(void);

#endif