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
    bool beep_start;
    uint32_t beep_start_time;
    uint32_t beep_duration;
    uint16_t beep_frequency;
    uint8_t  beep_volume;
    bool beep_done;
} Speaker;

extern Speaker speaker;

void speaker_init(void);
void speaker_tick(void);

#endif