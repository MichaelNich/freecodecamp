#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#COLUMNS DB
#USERNAME, GAMES_PLAYED, BEST_GAME

GUESS_NUMBER=$((1 + RANDOM 1000 ))

MAIN(){
  echo Enter your username:
  read name
  PLAYER_NAME=$($PSQL="SELECT username")
}

GET_INFO_FROM_DATABASE(){

}

PLAY(){
  if [[ $1 =~ ^[0-9]+$ ]]
  then
  else
    echo That is not an integer, guess again:
  fi
}
MAIN
