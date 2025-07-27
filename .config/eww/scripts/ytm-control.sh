#!/bin/bash

# Detecta el player activo (Chromium para YouTube Music)
PLAYER=$(playerctl -l | grep chromium | head -n1)

# Ejecuta el comando que viene como primer argumento
playerctl --player="$PLAYER" "$1"
