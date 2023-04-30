#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS_NUMBER=$((1 + RANDOM % 1000 ))

MAIN(){
  echo Enter your username:
  read name
  PLAYER_DETAILS=$($PSQL "SELECT username, games_played, best_game FROM player WHERE username='$name';")
  #check if player is new
  if [[ -z $PLAYER_DETAILS ]]
  then
    echo Welcome, $name! It looks like this is your first time here.
    #PLAY $name
    GAME $name 0
  else
      IFS='|'
      echo "$PLAYER_DETAILS" | while read USERNAME GAMES_PLAYED BEST_GAME
      do
        echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      done
      GAME $name 1
  fi
}

GAME(){
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
    if [[ $player_guess -gt $GUESS_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      ((plays_count++))
      GAME
    elif [[ $player_guess -lt $GUESS_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      ((plays_count++))
      GAME
    else
      ((plays_count++))
      echo You guessed it in $plays_count tries. The secret number was $GUESS_NUMBER. Nice job!
      INSERT_INTO_DB $1
    fi
  fi
}
INSERT_INTO_DB(){
  if [[ $PLAYER_DETAILS ]]
  then
    BEST=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "SELECT best_game FROM player WHERE username='$name';")
    if [[ $plays_count -lt $BEST ]]
    then
      #update best score
      UPDATE_BEST_SCORE=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "UPDATE player SET best_game = '$plays_count' WHERE username='$name';")
    fi
    #increase games_played by 1
    UPDATE_PLAYS_COUNT=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "UPDATE player SET games_played = games_played + 1 WHERE username='$name';")
  else
    PLAYER_INSERT=$($PSQL "INSERT INTO player(username, games_played, best_game) VALUES('$name', 1, $plays_count);")
  fi
}
plays_count=0
MAIN
