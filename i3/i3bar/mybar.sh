#!/bin/sh

# Based on https://github.com/Tazeg/i3status

bg_bar_color="#282A36"
bg_separator_previous=$bg_bar_color

# Print a left caret separator
# @params {string} $1 text color, ex: "#FF0000"
# @params {string} $2 background color, ex: "#FF0000"
separator() {
  echo -n "{"
  echo -n "\"full_text\":\"\"," # CTRL+Ue0b2
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border\":\"$bg_bar_color\","
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"color\":\"$1\","
  echo -n "\"background\":\"$2\""
  echo -n "}"
}

common() {
  echo -n "\"border\": \"$bg_bar_color\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0"
}

myip_public() {
  local bg="#1976D2"
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"ip_public\","
  echo -n "\"full_text\":\" $(~/.config/i3status/ip.py) \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myip_local() {
  local bg="#2E7D32" # vert
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"ip_local\","
  echo -n "\"full_text\":\"  $(ip route get 1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

disk_usage() {
  local bg="#3949AB"
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_disk_usage\","
  echo -n "\"full_text\":\" 💽 $(~/.config/i3status/disk.py)%\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "}"
}

memory() {
  echo -n ",{"
  echo -n "\"name\":\"id_memory\","
  echo -n "\"full_text\":\" 📼 $(~/.config/i3status/memory.py)%\","
  echo -n "\"background\":\"#3949AB\","
  common
  echo -n "}"
}

cpu_usage() {
  echo -n ",{"
  echo -n "\"name\":\"id_cpu_usage\","
  echo -n "\"full_text\":\" 📀 $(~/.config/i3status/cpu.py)% \","
  echo -n "\"background\":\"#3949AB\","
  common
  echo -n "},"
}

meteo() {
  local bg="#546E7A"
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_meteo\","
  echo -n "\"full_text\":\" $(~/.config/i3status/meteo.py) \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

mydate() {
  local bg="#E0E0E0"
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_time\","
  echo -n "\"full_text\":\"  $(date "+%A %b-%d %l:%M") \","
  echo -n "\"color\":\"#000000\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

battery0() {
  if [ -f /sys/class/power_supply/BAT0/uevent ]; then
    local bg="#D69E2E"
    separator $bg $bg_separator_previous
    bg_separator_previous=$bg
    prct=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)
    charging=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2) # POWER_SUPPLY_STATUS=Discharging|Charging
    icon="🔋"
    echo -n ",{"
    echo -n "\"name\":\"battery0\","
    echo -n "\"full_text\":\" ${icon} ${prct}% \","
    echo -n "\"color\":\"#000000\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
  else
    bg_separator_previous="#E0E0E0"
  fi
}

volume() {
  local bg="#673AB7"
  separator $bg $bg_separator_previous  
  vol=$(pacmd list-sinks|grep -A 15 '* index'| awk '/volume: front/{ print $5 }' | sed 's/[%|,]//g')
  echo -n ",{"
  echo -n "\"name\":\"id_volume\","
  if [ $vol -le 0 ]; then
    echo -n "\"full_text\":\" 🔈 ${vol}% \","
  elif [ $vol -le 80 ]; then
    echo -n "\"full_text\":\" 🔉 ${vol}% \","
  else
    echo -n "\"full_text\":\" 🔊 ${vol}% \","
  fi
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
  separator $bg_bar_color $bg
}

# https://github.com/i3/i3/blob/next/contrib/trivial-bar-script.sh
echo '{ "version": 1, "click_events":true }'     # Send the header so that i3bar knows we want to use JSON:
echo '['                    # Begin the endless array.
echo '[]'                   # We send an empty first array of blocks to make the loop simpler:

# Now send blocks with information forever:
(while :;
do
	echo -n ",["
  mydate
  meteo
  myip_public
  myip_local
  disk_usage
  memory
  cpu_usage
  battery0
  volume
  echo "]"
	sleep 2
bg_separator_previous=$bg_bar_color
done) &
