#!/bin/bash

PLAYER=$(playerctl -l | grep chromium | head -n1)

# Si no hay ningún reproductor válido, salir
[ -z "$PLAYER" ] && echo "0" && exit

TITLE=$(playerctl --player="$PLAYER" metadata --format "{{title}}")
POSITION=$(playerctl --player="$PLAYER" position 2>/dev/null)
LENGTH_MICROSECONDS=$(playerctl --player="$PLAYER" metadata --format "{{mpris:length}}" 2>/dev/null)

# Guarda temporalmente el título de la última canción
CACHE_FILE="/tmp/eww_last_song_title"

if [ ! -f "$CACHE_FILE" ]; then
  echo "$TITLE" > "$CACHE_FILE"
fi

LAST_TITLE=$(cat "$CACHE_FILE")

# Si la canción cambió, resetear barra
if [ "$LAST_TITLE" != "$TITLE" ]; then
  echo "$TITLE" > "$CACHE_FILE"
  echo "0"
  exit
fi

# Calcular porcentaje de progreso
PERCENTAGE=$(python3 -c "
import sys
try:
    position = float(sys.argv[1])
    length = float(sys.argv[2]) / 1000000
    if length > 0:
        print(int((position / length) * 100))
    else:
        print(0)
except:
    print(0)
" "$POSITION" "$LENGTH_MICROSECONDS")

echo "$PERCENTAGE"
