declare -i BAT_FULL=$(cat /sys/class/power_supply/BAT0/energy_full)
declare -i BAT_NOW=$(cat /sys/class/power_supply/BAT0/energy_now)
declare -i BAT_PERC=$((100*$BAT_NOW/$BAT_FULL))

if (( $BAT_PERC < 15 ))
then
	dunstify -i "battery" -h string:x-dunst-stack-tag:batterij "Let op!" "Batterij is minder dan 15%"
fi


