# #!/usr/bin/env bash

# emoji_file="$HOME/.config/rofi/scripts/emojis/all_emojis.txt"

# chosen=$(cat "$emoji_file" | rofi -dmenu -i -p "Select Emoji")

# if [[ -n "$chosen" ]]; then
# emoji=$(echo "$chosen" | awk '{print $1}')

# echo -n "$emoji" | wl-copy

# wtype "$emoji"
# fi

#!/usr/bin/env bash

emoji_file="$HOME/.config/rofi/scripts/emojis/all_emojis.txt"

# الخدعة هنا: awk يأخذ الإيموجي، يضيف 100 مسافة فارغة، ثم يضع وصف الإيموجي للبحث
chosen=$(awk '{emoji=$1; $1=""; print emoji "                                                                                                    " $0}' "$emoji_file" | rofi \
  -dmenu \
  -i \
  -p "Select Emoji" \
  -theme ~/.config/rofi/rofi-emoji.rasi)

if [[ -n "$chosen" ]]; then
  # نأخذ الإيموجي الصافي فقط (العمود الأول) لنسخه ولصقه
  emoji=$(echo "$chosen" | awk '{print $1}')
  echo -n "$emoji" | wl-copy
  wtype "$emoji"
fi
