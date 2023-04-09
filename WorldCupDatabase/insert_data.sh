#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
do
  #echo "$($PSQL "SELECT ")"
  if [[ $YEAR != 'year' ]]
  then
    #MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    #INSERTING TEAMS INTO TEAMS TABLE TO GET team id
    INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT (name) DO NOTHING")
    INSERT_OP_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT (name) DO NOTHING")
    #echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_G $OPPONENT_G
    #GET TEAMS ID's
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #a=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, 5, $WINNER_G, $OPPONENT_G, $WINNER_ID, $OPPONENT_ID)")
    MATCHES=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_G, $OPPONENT_G, $WINNER_ID, $OPPONENT_ID)")
  fi
done
