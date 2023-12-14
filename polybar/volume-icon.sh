#!/bin/bash

# Get the current volume
VOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

# Decide which icon to use based on the volume
if [ "$VOLUME" -eq 0 ]; then
  ICON=""  # Muted icon
elif [ "$VOLUME" -lt 40 ]; then
  ICON="" # Low volume icon
elif [ "$VOLUME" -lt 80 ]; then
  ICON="󰕾"  # Medium volume icon
else
  ICON=""  # High volume icon
fi

# Output the icon and the volume
echo "$ICON"
