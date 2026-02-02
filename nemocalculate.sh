#!/bin/bash
echo "Numero Calculator"
echo "take a value"
read num1

echo "take a value"
read num2

echo "choose any operation"
echo "1. addition"
echo "2. subtraction"
echo "3. multiplication"
echo "4. divide"

read choice
case $choice in
    1)
        output=$((num1 + num2));;
    2)
        output=$((num1 - num2));;
    3)
        output=$((num1 * num2));;
    4)
        if [ $num2 -eq 0 ]; then
            echo "Not Use 0 to divide."
            exit 1
        fi
        output=$((num1 / num2))
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo "answer: $output"
