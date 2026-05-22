#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#insert teams
cat games.csv | while IFS="," read -r YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR =~ ^[0-9]+$ ]]
  then
    INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER_NAME'), ('$OPPONENT_NAME') ON CONFLICT (name) DO NOTHING;")
  fi
done

#insert games
cat games.csv | while IFS="," read -r YEAR ROUND WINNER_NAME OPPONENT_NAME WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR =~ ^[0-9]+$ ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_NAME';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT_NAME';")
    INSERT_GAMES=$($PSQL "INSERT INTO games(year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES($YEAR, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS, '$ROUND');")
  fi
done
