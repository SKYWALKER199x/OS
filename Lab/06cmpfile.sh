if [ $# -ne 2 ]; then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "File '$1' not found."
    exit 1
fi

if [ ! -f $2 ]; then
    echo "File '$2' not found."
    exit 1
fi

if cmp -s $1 $2; then
    echo "The contents of '$1' and '$2' are identical."
    echo "File content"
    cat $1
else
    echo "The contents of '$1' and '$2' are different."
    cmp $1 $2
fi
