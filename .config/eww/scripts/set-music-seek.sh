#!/bin/bash

PLAYER=$(playerctl -l | grep chromium | head -n1)

LENGTH_MICROSECONDS=$(playerctl --player="$PLAYER" metadata --format "{{mpris:length}}")

# $1 es porcentaje de la barra (de 0 a 100)
REALVALUE=$(python3 -c "
import sys
length_microseconds = float(sys.argv[1])
percentage = float(sys.argv[2])
length_seconds = length_microseconds / 1000000
real_value = (percentage / 100) * length_seconds
print(real_value)
" "$LENGTH_MICROSECONDS" "$1")

playerctl --player="$PLAYER" position "$REALVALUE"


