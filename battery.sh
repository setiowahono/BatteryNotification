#!/usr/bin/env bash
while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    if on_ac_power; then
        if [ "$battery_percent" -gt 90 ]; then
            notify-send -i "$PWD/battery.png" "Battery Full" "Battery level at $battery_percent% please unplug the charger now"
            paplay /usr/share/sounds/freedesktop/stereo/dialog-information.oga
        fi
    fi
    if [ "$battery_percent" -le 30 ]; then
        notify-send -i "$PWD/battery.png" "Battery Low" "Battery level at $battery_percent% please plug the charger now"
        paplay /usr/share/sounds/freedesktop/stereo/dialog-information.oga
    fi
    sleep 200
done