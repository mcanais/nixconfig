template="$HOME/ist/iaed/template.c"

name="template.c"
append=false

usage() {
	echo "Usage: $0 [-a] <file>"
	echo "Creates a c file template"
	echo ""
	echo "  -a       Append template to file"
	echo "  --help   Display help"
}

if [[ "$1" == "--help" ]]; then
	usage
	exit 0
fi

while getopts "a" opt; do
	case $opt in
		a) append=true ;;
		*) usage ;;
	esac
done

shift $((OPTIND - 1))

if [ $# -eq 1 ]; then
	name=$1
fi


if $append; then
	cat $template >> $name
	instruction="Appended"
else
	cp $template $name
	instruction="Added"
fi


chmod 644 ./$name

echo "$instruction template to $name"
