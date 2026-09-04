#!/usr/bin/env bash

set -e
set -u

# Icons only
shutdown=""
reboot=""
logout=""
suspend=""
hibernate=""
lock=""

options=(
  "$shutdown"
  "$reboot"
  "$logout"
  "$suspend"
  "$hibernate"
  "$lock"
)

chosen=$(printf '%s\n' "${options[@]}" | rofi \
  -dmenu \
  -i \
  -theme ~/.config/rofi/power-menu.rasi)

[[ -z "$chosen" ]] && exit 0

case "$chosen" in
"$shutdown")
  confirm=$(echo -e "Yes\nNo" | rofi -dmenu -theme ~/.config/rofi/power-menu.rasi)
  [[ "$confirm" == "Yes" ]] && systemctl poweroff
  ;;

"$reboot")
  confirm=$(echo -e "Yes\nNo" | rofi -dmenu -theme ~/.config/rofi/power-menu.rasi)
  [[ "$confirm" == "Yes" ]] && systemctl reboot
  ;;

"$logout")
  confirm=$(echo -e "Yes\nNo" | rofi -dmenu -theme ~/.config/rofi/power-menu.rasi)
  [[ "$confirm" == "Yes" ]] && loginctl terminate-session "${XDG_SESSION_ID-}"
  ;;

"$suspend")
  systemctl suspend
  ;;

"$hibernate")
  systemctl hibernate
  ;;

"$lock")
  swaylock
  ;;
esac
