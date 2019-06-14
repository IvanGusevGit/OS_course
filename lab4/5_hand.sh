#!/bin/bash

in_file=5.out

touch v_problem

num=1
mode="+"

tail -n 0 -f $in_file |
while true
do
    read line
    case $line in
        "+")
            mode="+"
            echo "Changed mode to the +"
            ;;
        "*")
            mode="*"
            echo "Changed mode to the *"
            ;;
        "QUIT")
            echo "Stopped by QUIT message"
            exit 0
            ;;
        *)
            if [[ "$line" =~ [0-9]+ ]]
            then
                case $mode in
                    "+")
                        num=$(($num + $line))
                        echo $num
                        ;;
                    "*")
                        num=$(($num * $line))
                        echo $num
                        ;;
                esac
            else
                echo "Incorrect message"
                exit 1
            fi
            ;;
    esac
done
