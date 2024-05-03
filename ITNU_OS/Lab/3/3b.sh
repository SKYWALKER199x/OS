echo "Combinations of length 3:"
for item1 in {a..z}; do
    for item2 in {a..z}; do
        for item3 in {a..z}; do
            echo "$item1$item2$item3"
        done
    done
done