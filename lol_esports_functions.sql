---------------------------------------------- Players --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addPlayer"(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP);
CREATE OR REPLACE FUNCTION "addPlayer"(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP)
RETURNS INT AS $BODY$
DECLARE
	playerId INT;
BEGIN
	IF EXISTS(SELECT 1 FROM Players WHERE Players.id=$1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Players (id, firstName, lastName, inGameName, photoURL, region, birthdate) 
		VALUES ($1, $2, $3, $4, $5, $6, $7)
		RETURNING id into Players;
		RETURN Players;
	END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayer"(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP);
CREATE OR REPLACE FUNCTION "editPlayer"(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP)
RETURNS VOID AS $$
	UPDATE Players
	SET firstName=$2, lastName=$3, inGameName=$4, photoURL=$5, region=$6, birthdate=$7, 
	WHERE id=$1
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayer"(id INT);
CREATE OR REPLACE FUNCTION "addPlayer"(id INT)
RETURNS VOID AS $$
		DELETE FROM Players
		WHERE id=$1;
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayer"(id INT);
CREATE OR REPLACE FUNCTION "getSpecificPlayer"(id INT) 
RETURNS TABLE(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP) AS $$
		SELECT id, firstName, lastName, inGameName, photoURL, region, birthdate, birthdate
		FROM Players
		WHERE id=$1
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayers"();
CREATE OR REPLACE FUNCTION "getSpecificPlayer"() 
RETURNS TABLE(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP) AS $$
		SELECT id, firstName, lastName, inGameName, photoURL, region, birthdate, birthdate
		FROM Players
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;
---------------------------------------------- Players --------------------------------------------------------------------------------------------


-- Just do this for every table.
-- All 117 tables