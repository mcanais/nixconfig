exname=$(basename $(pwd))

if [ ! -e "$exname.c" ]; then
	echo "File $exname.c does not exist"
	exit 1
fi

gcc -Wall -Wextra -Werror -Wno-unused-result -lm "$exname.c" -o "$exname.out"

if [ -e "input" ]; then
	cat input | ./${exname}.out
else
	./${exname}.out
fi

