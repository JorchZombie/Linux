#cuenta ventanas aviertas en hyprland
win_count=$(hyprctl clients | wc -i)

#decide la clase segun cantiad de ventanas
if ((win_count >=16)); then
  font_size=12
elif ((win_count >=13)); then
  font_size=14
else
  font_size=16
fi

#genera css dinamico para tamaño de iconos
cat <<EOF > ~/.config/waybar/styles/dynamic.css
#taskbar button {
  font-size: ${font_size}px;
}
EOF

pkill -SIGUSR2 waybar
