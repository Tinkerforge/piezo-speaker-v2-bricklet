/* piezo-speaker-v2-bricklet
 * Copyright (C) 2018 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_speaker.h: Configuration for the speaker
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

#ifndef CONFIG_SPEAKER_H
#define CONFIG_SPEAKER_H

#include "xmc_gpio.h"

#define SPEAKER_LR0_PIN  P1_0
#define SPEAKER_LR1_PIN  P0_5
#define SPEAKER_LR2_PIN  P0_6
#define SPEAKER_LR3_PIN  P0_8

#define SPEAKER_SU0_PIN  P0_12
#define SPEAKER_SU1_PIN  P0_13
#define SPEAKER_SU2_PIN  P0_14
#define SPEAKER_SU3_PIN  P0_15

#define SPEAKER_SUS_PIN  P2_11 // SU shutdown

#define SPEAKER_PWM_PIN  P1_1

#endif