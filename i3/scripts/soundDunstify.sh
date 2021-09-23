alias sendSound='dunstify -i "audio-volume-high" -h string:x-dunst-stack-tag:geluid -t 1000 "Volumeniveau" $(pamixer --get-volume)'
alias muteSound='dunstify -i "audio-volume-muted" -h string:x-dunst-stack-tag:geluid -t 1000 "Volumeniveau" "Gedempt"'


case $1 in
	"up") pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status && sendSound;;
	"down") pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status && sendSound;;
	"mute") pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status && 
		if [ "$(pactl list sinks | grep "Mute" | cut -c 8-)" == "yes" ]			
		then 
			muteSound
		else
			sendSound
		fi;;
esac

