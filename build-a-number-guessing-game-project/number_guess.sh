#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#COLUMNS DB
#USERNAME, GAMES_PLAYED, BEST_GAME

GUESS_NUMBER=$((1 + RANDOM % 1000 ))

MAIN(){
  echo Enter your username:
  read name
  PLAYER_DETAILS=$($PSQL "SELECT username, games_played, best_game FROM player WHERE username='$name'")
  #check if player is new
  if [[ -z $PLAYER_DETAILS ]]
  then
    echo Welcome, $name! It looks like this is your first time here.
    #PLAY $name
    GAME $name 0
  else
      IFS='|'
      echo "$PLAYER_DETAILS" | while read USERNAME GAMES_PLAYED, BEST_GAME
      do
        echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      done
  fi
}

#GET_INFO_FROM_DATABASE(){}

PLAY(){
  if [[ $1 == "It's lower than that, guess again:" ]]
  then
    echo $1
  elif [[ $1 == "It's higher than that, guess again:" ]]
  then
    echo bunda
  fi
}

GAME(){
  ##GAME
  if [[ $2 ]]
  then
    echo Guess the secret number between 1 and 1000:
  fi
  read player_guess

  if [[ ! $player_guess =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    GAME "Again"
  else
    if [[ $player_guess > $GUESS_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      ((plays_count++))
      GAME
    elif [[ $player_guess < $GUESS_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      ((plays_count++))
      GAME
    else
      ((plays_count++))
      echo You guessed it in $plays_count tries. The secret number was $GUESS_NUMBER. Nice job!
      INSERT_INTO_DB
    fi
  fi
}
INSERT_INTO_DB(){
  PLAYER_INSERT=$($PSQL "INSERT INTO player(username, games_played, best_game) VALUES('$name', 1, $plays_count);")
}
plays_count=0
MAIN
