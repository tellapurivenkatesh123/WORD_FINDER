#!/bin/bash +x
cat << 'EOF'
FFFFFFFFF   IIIIIIIII   NNN         NNN   DDDDDDDDDDD
FFFFFFFFF   IIIIIIIII   NNN N       NNN   DDDDDDDDDDDD
FFF            III      NNN  N      NNN   DDD       DDDD
FFF            III      NNN   N     NNN   DDD       DDDDD
FFFFFFFFF      III      NNN    N    NNN   DDD       DDDDD
FFFFFFFFF      III      NNN     N   NNN   DDD       DDDD
FFF            III      NNN      N  NNN   DDD       DDDD
FFF         IIIIIIIII   NNN       N NNN   DDDDDDDDDDDD    
FFF         IIIIIIIII   NNN         NNN   DDDDDDDDDDDD
EOF
echo "========================="
echo "find the word and replace"
echo "========================="

read -p "Enter the word :" word
echo -e "Enter the filename:\c"
read file
if [[ ! -f "$file" ]];then
    echo "❌ file does not exist"
    exit 1
fi

declare -A variants
variants['lower']=${word,,}
variants['first']=${word^}
variants['upper']=${word^^}

found_variants=()
echo "checking for occurrences..."
for type in ${!variants[@]};do
    if grep -q "${variants[$type]}" "$file";then
        echo "✔ Found $type case: ${variants[$type]}"
        found_variants+=("$type")
    fi
done

if [ ${#found_variants[@]} -eq 0 ];then
    echo "❌ No occurrences of $word "
    exit 0
fi
while [ ${#found_variants[@]} -gt 0 ];do
    echo "Select the options to replace:"
    for i in ${!found_variants[@]};do
    echo "$((i+1)). ${found_variants[$i]} (${variants[${found_variants[$i]}]})"
    done
    echo "0. EXIT"
    read -p "Enter your choice:" choice
    case $choice in
        0)
            echo "EXITING....."
            exit 0
            ;;
        [1-9]*)
            if [ $choice -gt ${#found_variants[@]} ] || [ $choice -lt 1 ];then
                echo "❌  invalid input,try again"
                continue
            fi
            ;;
            
        *)
            echo "❌ invalid input,Enter a number"
            continue
            ;;
    esac
    
    selected=${found_variants[$((choice-1))]}
    old=${variants[$selected]}
    read -p "ENTER THE REPLACEMENT FOR '$old':" new
    sed -i "s/$old/$new/g" "$file"
    echo "✅ Replaced '$old' with '$new'."
    unset 'found_variants[$((choice-1))]'
    found_variants=("${found_variants[@]}")
done

echo "🎉 All selected types replaced. Final file: $file"

