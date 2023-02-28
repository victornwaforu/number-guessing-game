#!/bin/bash

# connecting to the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# to get the user name , not more than 22 characters.
echo "Enter your username:"
read USERNAME

# creating variables from the tables in the database
USERNAME_AVAILABLE=$($PSQL "SELECT username FROM usernames WHERE username = '$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM usernames INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM usernames INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")

# if the username is not already in the database
if [[ -z $USERNAME_AVAILABLE ]]
then
  # insert the username into the database
  INSERT_NEW_USER=$($PSQL "INSERT INTO usernames(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# random number generator from 1-1000
CORRECT_NUMBER=$((1 + RANDOM % 1000))
GUESS=1

echo -e "\nGuess the secret number between 1 and 1000:"
while read NUMBER
do
  # when the number guessed is not an integer
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $NUMBER -gt $CORRECT_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    else
      if [[ $NUMBER -lt $CORRECT_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
      elif [[ $NUMBER -eq $CORRECT_NUMBER ]]
        then
        break;
      fi
    fi 
  fi
  GUESS=$(( $GUESS + 1 ))
done

# -gt(greater than), -eq(equal to), -lt(less than)

if [[ $GUESS == 1 ]]
then
  echo "You guessed it in $GUESS tries. The secret number was $CORRECT_NUMBER. Nice job!"
else
  echo "You guessed it in $GUESS tries. The secret number was $CORRECT_NUMBER. Nice job!"
fi

USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username = '$USERNAME'")
INSERT_GAME=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($GUESS, $USER_ID)")

