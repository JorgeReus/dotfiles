curr_brightness=$(xrandr --verbose | grep -oE "Brightness: (.+)" | cut -d: -f2) 
brightness=$(echo "$curr_brightness .1" | awk '{printf "%f", $1 + $2}' )
if (( $(echo "$brightness > 1" |bc -l) ))
then
    brightness=1
fi
xrandr --output eDP-1 --brightness $brightness
