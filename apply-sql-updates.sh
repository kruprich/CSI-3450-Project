echo "Updating Tables"
PGPASSWORD=postgres psql --username=postgres --dbname=LoLEsports --file=lol_esports_tables.sql;
echo "Updating Functions"
PGPASSWORD=postgres psql --username=postgres --dbname=LoLEsports --file=lol_esports_functions.sql;
