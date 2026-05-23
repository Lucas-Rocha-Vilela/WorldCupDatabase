# World Cup Database
World Cup Database developed by Lucas Rocha Vilela, throughout the course Relational Databases Certification from FreeCodeCamp.
In this project, I created a database based on PostgreSQL using Bash Script.

The insert_data.sh gets the data inside the games.csv file and inserts it into the tables "games" and "teams" in an organized manner.
The "games" table has the following columns: game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals.
The "teams" table has the following columns: team_id, name

The queries.sh realizes a serie of queries to get specific results and pass the tests imposed by the course.

The worldcup.sql is the database resulted from the insert_data.sh execution.
