#!/usr/bin/env bash
# File guessinggame.sh

# Requirements
# First you will create a program called guessinggame.sh.
# This program will continuously ask the user to guess the number of files in the current directory, until they guess the correct number.
# The user will be informed if their guess is too high or too low.
# Once the user guesses the correct number of files in the current directory they should be congratulated.

# First we write a function to fetch the number of files in the directory
function get_number_of_files() {
	ls -l | grep -c ^[-]
}

echo "This program is seeking your guess about the number of files in the current directory!"
num_of_files=$( get_number_of_files )
guessed=false
# Next, we seek input of the user until he/she enters the correct response. Some exception handling is also done for incorrect input such as decimals, strings, or negative integers

while ! $guessed
do
	read -p "Plese enter your guess here: " guess
	echo "your guess: $guess"

	if [[ $guess =~ ^-?[0-9]+$ ]]
	then
		if [[ $guess =~ ^[0-9]+$ ]]
		then
			if [[ $guess -eq $num_of_files ]]; then
				echo 'Congratulations!'
				guessed=true
			elif [[ $guess -lt $num_of_files ]]; then
				echo 'Your guess is too low.'
			elif [[ $guess -gt $num_of_files ]]; then
				echo 'Your guess is too high.'
			else
				echo 'You cannot enter here! Intentionally kept here.'
			fi
		else
			echo "Error: Negative numbers or integers not possible. Your input is not recognized as a number of files, must be a non-negative integer number."
		fi
	else
		echo "Error: Your input is not recognized as a number of files, must be a non-negative integer number."
	fi
done
