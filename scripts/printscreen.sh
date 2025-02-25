date=$(date +%d-%m-%Y_%H-%M-%S)
directory="$HOME/Pictures/Screenshots"
picture_path="${directory}/${date}.png"

mkdir -p $directory

fullscreen=false

while getopts "f" opt; do
	case $opt in
		f)
			fullscreen=true
			;;
		*)
			exit 1
			;;
	esac
done


if [ $fullscreen = true ]; then
	grim $picture_path
else
	grim -g "$(slurp)" $picture_path
fi

cat $picture_path | wl-copy
