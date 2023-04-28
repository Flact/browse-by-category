#!/bin/zsh

url_list_file="urls.txt"

if [[ ! -f $url_list_file ]]; then
    echo "File not found: $url_list_file"
    exit 1
fi

# URL validation regex pattern
url_pattern='^(https?|ftp):\/\/(([a-zA-Z0-9._-]+\.[a-zA-Z]{2,6})|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?(\/.*)?$'

declare -A categories
declare -A opened_categories
current_category=""

while read line; do
    if [[ $line == (\[CAT:*) ]]; then
        current_category="${line:5:-1}"
        categories["$current_category"]=""
    elif [[ -n $line ]]; then
        if [[ $line =~ $url_pattern ]]; then
            categories["$current_category"]+="$line"$'\n'
        else
            echo "Invalid URL: $line"
        fi
    fi
done < "$url_list_file"

while [[ ${#categories[@]} -gt 0 ]]; do
    cat_array=("${(@k)categories}")
    echo -e "\n"
    for i in {1..${#cat_array[@]}}; do
        echo "$i) ${cat_array[$i]//\"}"
    done
    echo "0) Exit"

    while true; do
        echo -n "Select a category to open: "
        read -r selection

        # Check if the input is a valid positive integer within the range of available categories or if the user entered 0 to exit
        if [[ "$selection" =~ ^[0-9][0-9]*$ ]] && (( selection >= 0 && selection <= ${#cat_array[@]} )); then
            break
        else
            echo "Invalid input. Please enter a number between 0 and ${#cat_array[@]}."
        fi
    done

    if [[ $selection == 0 ]]; then
        exit 0
    fi

    cat="${cat_array[$selection]}"

    if [[ -n $cat ]]; then
        while read url; do
            if [[ -n $url ]]; then
                firefox --new-tab "$url" &> /dev/null
                sleep 1
            fi
        done <<< "${categories[$cat]}"
        opened_categories["$cat"]=1
        unset "categories[$cat]"
    fi
done
