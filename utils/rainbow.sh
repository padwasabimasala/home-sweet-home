# Black        0;30
# Dark Gray    1;30
# Light Gray   0;37
# White        1;37
# Light Cyan   1;36
# Cyan         0;36
# Light Green  1;32
# Green        0;32
# Blue         0;34
# Light Blue   1;34
# Purple       0;35
# Light Purple 1;35
# Light Red    1;31
# Red          0;31
# Brown        0;33
# Yellow       1;33

colors=("0;30" "1;30" "0;37" "1;37" "1;36" "0;36" "1;32" "0;32" "0;34" "1;34" "0;35" "1;35" "1;31" "0;31" "0;33" "1;33")

for color in ${colors[*]}; do
  echo -e "\033[${color}mRainbow\033[0m"
done


