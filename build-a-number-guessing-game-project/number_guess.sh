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
  if [[ $1 =~ ^[0-9]+$ ]]
  then
  echo PPPP
  else
    echo That is not an integer, guess again:
  fi
}
MAIN
