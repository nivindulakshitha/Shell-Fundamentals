#!/bin/bash
name="Someone don't know"
age=23
echo "Hello," $name"! Your age is" $age



echo "Your second name: "
read second_name
# Not neccessary add "" in echo for strings
echo Your full name may be $name $second_name



a=10
b=2
# integer arithmatics
c=`expr $a / $b`
echo "Answer is" $c



# floating point arithmatics
echo - | awk '{print 1.1 + 1.2}'
echo - | awk '{print 1.1 - 1.2}'
echo - | awk '{print 1.1 * 1.2}'
echo - | awk '{print 1.1 / 1.2}'



# Capture the system datetime
date=$(date)
echo $date
formatted_date=$(date "+%D") # Formatting to dd/mm/yy
echo $formatted_date



# -p is used to read inline; in this approach "" is needed around the string part
read -p "Your first name? " first_name
read -p "Your last name? " last_name
read -p "Your born year? " born_year
this_year=$(date "+%Y") # Extract year from the datetime
age=`expr $this_year - $born_year`
echo "You're" $age "years old," $first_name $last_name



# Check wether you're an elder or not
if [ $age -eq 0 ] # Handle if the age is 0 (eq = equal)
then 
  echo "Age should be higher than 0"
fi # Finish



if [ $age -gt 18 ] # gt = greater than
then # If condition is true
  echo "You're an elder!"
else # if condition is false
  echo "You're a junior!"
fi



num_1=20
num_2=50
diff=`expr $num_1 - $num_2`

if [ $diff -eq 0 ]
then
  echo "Numbers are equal"
elif [ $diff -gt 0 ]
then
  echo $num_1 "is greater than" $num_2
else # lt = less than
  echo $num_2 "is greater than" $num_1
fi
# eq, ne, lt, gt, le = less than or , ge are used for numbers



string_1="Hello"
string_2="Hello"

if [ $string_1 = $string_2 ]
then
  echo "Strings are same"
else
  echo $string_1 "and" $string_2 "not same!"
fi
# = means equal and != means not equal



read -p "Your string " user_given
if [ -z $user_given ]
then 
  echo "You have given null value"
elif [ -n $user_given ]
then
  echo Something is there: $user_given
fi




target_value="shell-scripting-is-great!"

if [ $target_value == $user_given ]
then
  echo "You've given" $target_value
else
  echo $target_value "(target) is not as same as" $user_given "(your)"
fi




for i in 1 2 3
do
  for j in 1 2 3 4 5
  do
    echo $i "x" $j "=" `expr $i \* $j`
  done
done




i=10
while [ $i -ne 0 ] # ne - not equal
do
  echo $i time
  i=`expr $i - 1`
done



# Odd and evens
for i in {1..100}
do
  reminder=`expr $i % 2`
  if [ $reminder -eq 0 ]
  then
    echo $i "is even number"
  else
    echo $i "is odd number"
  fi
done



# Number guessing game
range=10
random_number=`expr $RANDOM % $range + 1`
max_chances=`expr $range - 3`
for chance in $(seq 1 $max_chances); do
  read -p "Guess the number > " guessed_number
  if [ $guessed_number -eq $random_number ]; then
    echo "You won the game! It's $random_number"
    break
  else
    space=$((random_number - guessed_number))
    if [ "$space" -lt 0 ]; then
      echo "Target number is lower."
    else
      echo "Target number is greater."
    fi
    if (( space >= -5 && space <= 5 )); then
      echo "You're just near the target!"
    fi
  fi
done


read exit_code