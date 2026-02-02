echo "this is a shell script place"

#this is comment

<<comment
this is
a multi
line comment
comment

#script for using variables
a=10
name="ankit"
age=22

#here variable are declared 
#now to use variables

echo "my name is $name and age is $age"

#variable to store output of a command

HOSTNAME=$(hostname)
echo "name of this machine is $HOSTNAME"

#constant variable - cannot be changed by anyone
#USE readonly BEFORE THE VARIABLE TO LOCK THE VARIABLE 
readonly COLLEGE="Amity"
echo "My college name is $COLLEGE"

#array in scripts
array=(1 4 67 hi "ssup bro")

#calling the place of the array by declaring echo value in ${[]}
echo "value in 4th index ${array[4]}"

#calling all the values stored in array is denoted by *
echo "all values stored in array are ${array[*]}"

#finding number of values in array
echo "no. of values is ${#array[*]}"

#variables operations
#here we declare myVar as our variable
Var01="Hey Ssup? How You"

#finding length of the variable, available charecters
Var01Length=${#Var01}
echo "length of myVar is $myVarLength"

#uppercase
echo "Upper case is ${myVar^^}"
#lowercase
echo "Lower case is ${myVar,,}"

#replace a string
newVar=${Var01/Ssup/You}

echo"new Var is $newVar"

#user interaction scripts
echo "what is your name?"

read name
echo "your name is $name"

#user interaction in same line as the input
read -p "what is your name?" name
echo "your name is $name"

#arithmetic operations
#mathematical calculation

#conditional statments

#if else statements
read -p "enter your marks"  marks
if [[ $marks -gt 40  ]]
then 
echo "you are pass"
else
echo "you are fail"
fi

#elif statements
read -p "enter your marks" marks
if [ $marks -ge 80 ]
then
echo "you are first division"
elif [ $marks -ge 60 ]
then
echo "you are second division"
elif [ $marks -ge 50 ]
then
echo "you are third division"

else
echo "you are failed"
fi

#case statements
echo "hey choose a option"
echo "a = i like batman"
echo "b = i like superman"
echo "c = i like green latern"

read choice

case $choice in
a) echo "bat";;
b) echo "super";;
c) echo "green";;
*) echo "no avail"
esac

#AND Operators &&
#AND OPERATOR NEEDS BOTH THE CONDITIONS TO BE TRUE
read -p "what is age" age
read -p "your country" country

#== is used to compare strings and -eq in numerics

if [[ $age -ge 18 ]] && [$country == "India"]
then
echo "you can vote"
else
echo "you cant vote"
fi

#OR OPERATOR ||
#OR OPERATOR NEEDS ANY ONE TO BE TRUE
read -p "what is your age" age
read -p "your country" country

if [ $age -ge 18 ] || [$country == "India"]
then
echo "you can vote"
else
echo "you cannot vote"
fi

#conditional executions --- condition1 && condition2 || condition3
#ternary options
read -p "what is age" age

[ $age -ge 18 ] && echo "Adult" || echo "Minor"

#loops statements 
#(where i & name are variables)

for i in 1 2 3 4 5 6 7 8
do
echo "number is $i"
done

for name in Raju Gaam Baam
do
echo "Name is $name"
done

#getting info from files
FILE="/trial.txt"

for name in $(cat $FILE)
do
echo "Name is $name"
done

#while loop
count=0
num=10

while [[ $count -le $num ]]
do
echo "value of count var is $count"
let count++
done

#infinite loop
#while true
#do
#echo "hi" #to run remove comments from code
#sleep 2s
#done
#to exit loop press (ctrl + c)

#break loop
#it is a break point which terminates the loop when the condition is met
no=6
for i in 1 2 3 4 5 6 7 8 9
do
 if [[ $no -eq $i ]]
then
echo "$no is found"
break
fi
echo "number is $1"
done

echo "This is a intented space applied here, please ignore"

#functions in script
#block of code which performs tasks when being called
#reused many times
echo "-----------"
echo "HI"
echo "-----------"

#function
function welcomenote {
echo "-----------"
echo "HI"
echo "-----------"
}
#block of code/function made
#to call function
welcomenote
welcomenote
welcomenote

#arguments in functions
function welcomenote {
echo "-----------"
echo "HI $1"
echo "Age is $2"
echo "-----------"
}
#here $1,$2 fills value for the words passed
welcomenote raju 45
welcomenote shamu 66
