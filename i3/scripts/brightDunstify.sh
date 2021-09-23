alias sendBacklight='dunstify -i "weather-clear" -h string:x-dunst-stack-tag:helderheid -t 1000 "Helderheid" $(xbacklight -get | cut -d '.' -f 1)'

case $1 in
	"up") xbacklight -inc 10;;
	"down") xbacklight -dec 10;;
esac
sendBacklight
