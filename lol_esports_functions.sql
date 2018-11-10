---------------------------------------------- Players --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addPlayer" (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE);

CREATE OR REPLACE FUNCTION "addPlayer" (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE)
    RETURNS INT
AS $BODY$
DECLARE
    playerId INT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                Players
            WHERE
                Players.id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO Players (id, firstName, lastName, inGameName, photoURL, region, birthdate)
        VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING
        id INTO playerId;
        RETURN playerId;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayer" (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE);

CREATE OR REPLACE FUNCTION "editPlayer" (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE)
    RETURNS VOID
AS $$
UPDATE
    Players
SET
    firstName = $2,
    lastName = $3,
    inGameName = $4,
    photoURL = $5,
    region = $6,
    birthdate = $7
    WHERE id=Players.id
    $$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayer" (id INT);

CREATE OR REPLACE FUNCTION "deletePlayer" (id INT)
    RETURNS VOID
AS $$ DELETE FROM Players WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificPlayer" (id INT);

CREATE OR REPLACE FUNCTION "getSpecificPlayer" (id INT)
    RETURNS TABLE (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE)
AS $$
SELECT
    id, firstName, lastName, inGameName, photoURL, region, birthdate
FROM
    Players
    WHERE id=Players.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificPlayers" ();

CREATE OR REPLACE FUNCTION "getSpecificPlayer" ()
    RETURNS TABLE (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE)
AS $$
SELECT
    id, firstName, lastName, inGameName, photoURL, region, birthdate
FROM
    Players
    WHERE id=Players.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- Players --------------------------------------------------------------------------------------------

---------------------------------------------- LanguageCodes --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addLanguageCode" (languageCode TEXT, languageText TEXT);

CREATE OR REPLACE FUNCTION "addLanguageCode" (languageCode TEXT, languageText TEXT)
    RETURNS TEXT
AS $BODY$
DECLARE langCode TEXT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                LanguageCodes
            WHERE
                LanguageCodes.auto_id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO LanguageCodes (auto_id, languageCode, languageText)
        VALUES ($1, $2, $3)
    RETURNING
        languageCode INTO langCode;
        RETURN langCode;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLanguageCode" (languageCode TEXT, languageText TEXT);

CREATE OR REPLACE FUNCTION "editLanguageCode" (languageCode TEXT, languageText TEXT)
    RETURNS VOID
AS $$
UPDATE
    LanguageCodes
SET
    languageText = $2
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLanguageCode" (languageCode TEXT);

CREATE OR REPLACE FUNCTION "deleteLanguageCode" (languageCode TEXT)
    RETURNS VOID
AS $$ DELETE FROM LanguageCodes
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificLanguageCode" (languageCode TEXT);

CREATE OR REPLACE FUNCTION "getSpecificLanguageCode" (languageCode TEXT)
    RETURNS TABLE (languageCode TEXT, languageText TEXT)
AS $$
SELECT
    languageCode,
    languageText
FROM
    LanguageCodes
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLanguageCodes" ();

CREATE OR REPLACE FUNCTION "getLanguageCodes" ()
    RETURNS TABLE (languageCode TEXT, languageText TEXT)
AS $$
SELECT
    languageCode,
    languageText
FROM
    LanguageCodes
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- LanguageCodes --------------------------------------------------------------------------------------------
---------------------------------------------- Patches --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addPatch" (patch TEXT);

CREATE OR REPLACE FUNCTION "addPatch" (patch TEXT)
    RETURNS TEXT
AS $BODY$
DECLARE
    patchText TEXT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                Patches
            WHERE
                Patches.patch = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO Patches (patch)
        VALUES ($1)
    RETURNING
        patch INTO patchText;
        RETURN patchText;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPatch" (patch TEXT);

CREATE OR REPLACE FUNCTION "editPatch" (patch TEXT)
    RETURNS VOID
AS $$
UPDATE
    Patches
    SET
    patch = $1
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePatch" (patch TEXT);

CREATE OR REPLACE FUNCTION "deletePatch" (patch TEXT)
    RETURNS VOID
AS $$ DELETE FROM Patches;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificPatch" (patch TEXT);

CREATE OR REPLACE FUNCTION "getSpecificPatch" (patch TEXT)
    RETURNS TABLE (patch TEXT)
AS $$
SELECT
    patch
FROM
    Patches
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPatches" ();

CREATE OR REPLACE FUNCTION "getPatches" ()
    RETURNS TABLE (patch TEXT)
AS $$
SELECT
    patch
FROM
    Patches
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- Patches --------------------------------------------------------------------------------------------
---------------------------------------------- LanguageItems --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addLanguageItems" (languageCode TEXT,patch TEXT, languageItem TEXT);

CREATE OR REPLACE FUNCTION "addLanguageItems" (languageCode TEXT,patch TEXT, languageItem TEXT)
    RETURNS TEXT
AS $BODY$
DECLARE
    languageItemCode TEXT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                LanguageItems
            WHERE
                LanguageItems.languageCode = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO LanguageItems (languageCode, patch, languageItem)
        VALUES ($1, $2, $3)
    RETURNING
        languageCode INTO languageItemCode;
        RETURN languageItemCode;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLanguageItems" (languageCode TEXT,patch TEXT, languageItem TEXT);

CREATE OR REPLACE FUNCTION "editLanguageItems" (languageCode TEXT,patch TEXT, languageItem TEXT)
    RETURNS VOID
AS $$
UPDATE
    LanguageItems
    SET
    languageCode = $1,
    patch = $2,
    languageItem = $3
    WHERE languageCode=LanguageItems.languageCode;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLanguageItems" (languageCode TEXT);

CREATE OR REPLACE FUNCTION "deleteLanguageItems" (languageCode TEXT)
    RETURNS VOID
AS $$ DELETE FROM LanguageItems WHERE languageCode=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificLanguageItem" (languageCode TEXT);

CREATE OR REPLACE FUNCTION "getSpecificLanguageItem" (languageCode TEXT)
    RETURNS TABLE (languageCode TEXT,patch TEXT, languageItem TEXT)
AS $$
SELECT
    languageCode, patch, languageItem 
FROM
    LanguageItems WHERE languageCode=LanguageItems.languageCode;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLanguageItems"();

CREATE OR REPLACE FUNCTION "getLanguageItems" ()
    RETURNS TABLE (languageCode TEXT, patch TEXT, languageItem TEXT)
AS $$
SELECT
    languageCode, patch, languageItem
FROM
    LanguageItems WHERE languageCode=LanguageItems.languageCode
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- LanguageItems --------------------------------------------------------------------------------------------
---------------------------------------------- Leagues --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addLeague" (id INT, gId TEXT, leagueName TEXT,  logoUrl TEXT);

CREATE OR REPLACE FUNCTION "addLeague" (id INT, gId TEXT, leagueName TEXT,  logoUrl TEXT)
    RETURNS INT
AS $BODY$
DECLARE
    leagueId INT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                Leagues
            WHERE
                Leagues.id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO Leagues (id, gId, leagueName, logoURL)
        VALUES ($1, $2, $3, $4)
    RETURNING
        id INTO leagueId;
        RETURN leagueId;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLeague" (id INT, gId TEXT, leagueName TEXT,  logoUrl TEXT);

CREATE OR REPLACE FUNCTION "editLeague" (id INT, gId TEXT, leagueName TEXT,  logoUrl TEXT)
    RETURNS VOID
AS $$
UPDATE
    Leagues
SET
    gId = $2,
    leagueName = $3,
    logoURL = $4
    WHERE id=Leagues.id;
    $$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLeague" (id INT);

CREATE OR REPLACE FUNCTION "deleteLeague" (id INT)
    RETURNS VOID
AS $$ DELETE FROM Leagues WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificLeague" (id INT);

CREATE OR REPLACE FUNCTION "getSpecificLeague" (id INT)
    RETURNS TABLE (id INT, gId TEXT, leagueName TEXT,  logoUrl TEXT)
AS $$
SELECT
    id, gId, leagueName, logoURL
FROM
    Leagues
    WHERE id=Leagues.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificLeagues" ();

CREATE OR REPLACE FUNCTION "getSpecificLeague" ()
    RETURNS TABLE (id INT, gId TEXT, leagueName TEXT,  logoUrl TEXT)
AS $$
SELECT
    id, gId, leagueName, logoURL
FROM
    Leagues
    WHERE id=Leagues.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- Leagues --------------------------------------------------------------------------------------------
---------------------------------------------- Tournaments --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addTournament" (id TEXT, title TEXT, tournamentDescription TEXT,  leagueId INT);

CREATE OR REPLACE FUNCTION "addTournament" (id TEXT, title TEXT, tournamentDescription TEXT,  leagueId INT)
    RETURNS TEXT
AS $BODY$
DECLARE
    tournamnetId TEXT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                Tournaments
            WHERE
                Tournaments.id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO Tournaments (id, title, tournamentDescription, leagueId)
        VALUES ( $1, $2, $3, $4, $5)
    RETURNING
        id INTO tournamnetId;
        RETURN tournamnetId;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournament" (id TEXT, title TEXT, tournamentDescription TEXT,  leagueId INT);

CREATE OR REPLACE FUNCTION "editTournament" (id TEXT, title TEXT, tournamentDescription TEXT,  leagueId INT)
    RETURNS VOID
AS $$
UPDATE
    Tournaments
SET
    title = $2,
    tournamentDescription = $3,
    leagueId = $4
    WHERE id=Tournaments.id;
    $$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournament" (id TEXT);

CREATE OR REPLACE FUNCTION "deleteTournament" (id TEXT)
    RETURNS VOID
AS $$ DELETE FROM Tournaments WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificTournament" (id TEXT);

CREATE OR REPLACE FUNCTION "getSpecificTournament" (id TEXT)
    RETURNS TABLE (id TEXT, title TEXT, tournamentDescription TEXT,  leagueId INT)
AS $$
SELECT
    id, title, tournamentDescription, leagueId
FROM
    Tournaments
    WHERE id=Tournaments.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificTournaments" ();

CREATE OR REPLACE FUNCTION "getSpecificTournament" ()
    RETURNS TABLE (id TEXT, title TEXT, tournamentDescription TEXT,  leagueId INT)
AS $$
SELECT
    id, title, tournamentDescription, leagueId
FROM
    Tournaments
    WHERE id=Tournaments.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- Tournaments --------------------------------------------------------------------------------------------
---------------------------------------------- Teams --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addTeam" (id INT, teamName TEXT, photoURL TEXT,  logoUrl TEXT,  acronym TEXT,  altLogoURL TEXT, homeLeague INT);

CREATE OR REPLACE FUNCTION "addTeam" (id INT, teamName TEXT, photoURL TEXT,  logoUrl TEXT,  acronym TEXT,  altLogoURL TEXT, homeLeague INT)
    RETURNS INT
AS $BODY$
DECLARE
    leagueId INT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                Teams
            WHERE
                Teams.id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO Teams (id, teamName, photoURL, logoURL, acronym,  altLogoURL, homeLeague)
        VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING
        id INTO leagueId;
        RETURN leagueId;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeam" (id INT, teamName TEXT, photoURL TEXT,  logoUrl TEXT,  acronym TEXT,  altLogoURL TEXT, homeLeague INT);

CREATE OR REPLACE FUNCTION "editTeam" (id INT, teamName TEXT, photoURL TEXT,  logoUrl TEXT,  acronym TEXT,  altLogoURL TEXT, homeLeague INT)
    RETURNS VOID
AS $$
UPDATE
    Teams
SET
    teamName = $2,
    photoURL = $3,
    logoURL = $4,
    acronym = $5,
    altLogoURL = $6,
    homeLeague = $7    
    WHERE id=Teams.id;
    $$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeam" (id INT);

CREATE OR REPLACE FUNCTION "deleteTeam" (id INT)
    RETURNS VOID
AS $$ DELETE FROM Teams WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificTeam" (id INT);

CREATE OR REPLACE FUNCTION "getSpecificTeam" (id INT)
    RETURNS TABLE (id INT, teamName TEXT, photoURL TEXT, logoUrl TEXT, acronym TEXT, altLogoURL TEXT, homeLeague INT)
AS $$
SELECT
    id, teamName, photoURL, logoURL, acronym, altLogoURL, homeLeague
FROM
    Teams
    WHERE id=Teams.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificTeams" ();

CREATE OR REPLACE FUNCTION "getSpecificTeam" ()
    RETURNS TABLE (id INT, teamName TEXT, photoURL TEXT,  logoUrl TEXT,  acronym TEXT,  altLogoURL TEXT, homeLeague INT)
AS $$
SELECT
    id, teamName, photoURL, logoURL, acronym,  altLogoURL, homeLeague
FROM
    Teams
    WHERE id=Teams.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- Teams --------------------------------------------------------------------------------------------
---------------------------------------------- TournamentBrackets --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addTournamentBracket" (id TEXT, tournamentBracketsName TEXT, groupPosition INT,  groupName TEXT);

CREATE OR REPLACE FUNCTION "addTournamentBracket" (id TEXT, tournamentBracketsName TEXT, groupPosition INT,  groupName TEXT)
    RETURNS TEXT
AS $BODY$
DECLARE
    tournamnetBracketId TEXT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                TournamentBrackets
            WHERE
                TournamentBrackets.id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO TournamentBrackets (id, tournamentBracketsName, groupPosition, groupName)
        VALUES ( $1, $2, $3, $4, $5)
    RETURNING
        id INTO tournamnetBracketId;
        RETURN tournamnetBracketId;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournamentBracket" (id TEXT, tournamentBracketsName TEXT, groupPosition INT,  groupName TEXT);

CREATE OR REPLACE FUNCTION "editTournamentBracket" (id TEXT, tournamentBracketsName TEXT, groupPosition INT,  groupName TEXT)
    RETURNS VOID
AS $$
UPDATE
    TournamentBrackets
SET
    tournamentBracketsName = $2,
    groupPosition = $3,
    groupName = $4
    WHERE id=TournamentBrackets.id;
    $$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournamentBracket" (id TEXT);

CREATE OR REPLACE FUNCTION "deleteTournamentBracket" (id TEXT)
    RETURNS VOID
AS $$ DELETE FROM TournamentBrackets WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificTournamentBracket" (id TEXT);

CREATE OR REPLACE FUNCTION "getSpecificTournamentBracket" (id TEXT)
    RETURNS TABLE (id TEXT, tournamentBracketsName TEXT, groupPosition INT,  groupName TEXT)
AS $$
SELECT
    id, tournamentBracketsName, groupPosition, groupName
FROM
    TournamentBrackets
    WHERE id=TournamentBrackets.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificTournamentBrackets" ();

CREATE OR REPLACE FUNCTION "getSpecificTournamentBracket" ()
    RETURNS TABLE (id TEXT, tournamentBracketsName TEXT, groupPosition INT,  groupName TEXT)
AS $$
SELECT
    id, tournamentBracketsName, groupPosition, groupName
FROM
    TournamentBrackets
    WHERE id=TournamentBrackets.id
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- TournamentBrackets --------------------------------------------------------------------------------------------
/* ---------------------------------------------- Matches --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addMatch" (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT);

CREATE OR REPLACE FUNCTION "addMatch" (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)
    RETURNS TEXT
AS $BODY$
DECLARE
    matchId TEXT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                Matches
            WHERE
                Matches.id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO Matches (id, tournamentId, bracketId, matchesName, position)
        VALUES ($1, $2, $3, $4, $5)
    RETURNING
        id INTO matchId;
        RETURN matchId;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMatch" (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT);

CREATE OR REPLACE FUNCTION "editMatch" (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)
    RETURNS VOID
AS $$
UPDATE
    Matches
SET
    tournamentId = $2,
    bracketId = $3,
    matchesName = $4,
    position = $5
    WHERE id=Matches.id;
    $$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMatch" (id TEXT);

CREATE OR REPLACE FUNCTION "deleteMatch" (id TEXT)
    RETURNS VOID
AS $$ DELETE FROM Matches WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificMatch" (id TEXT);

CREATE OR REPLACE FUNCTION "getSpecificMatch" (id TEXT)
    RETURNS TABLE (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)
AS $$
SELECT
    id, tournamentId, bracketId, matchesName, position
FROM
    Matches
    WHERE id=Matches.id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificMatch" ();

CREATE OR REPLACE FUNCTION "getSpecificMatch" ()
    RETURNS TABLE (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)
AS $$
SELECT
    id, tournamentId, bracketId, matchesName, position
FROM
    Matches
    WHERE id=Matches.id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- Matches --------------------------------------------------------------------------------------------
 */---------------------------------------------- Games --------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addGame" (id TEXT, matchId TEXT, bracketId TEXT,  tournamentId TEXT, gamesName TEXT);

CREATE OR REPLACE FUNCTION "addGame" (id TEXT, matchId TEXT,  bracketId TEXT,  tournamentId TEXT, gamesName TEXT)
    RETURNS TEXT
AS $BODY$
DECLARE
    gamesId TEXT;
BEGIN
    IF EXISTS (
            SELECT
                $1
            FROM
                Games
            WHERE
                Games.id = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO Games (id, matchId, bracketId,  tournamentId, gamesName)
        VALUES ( $1, $2, $3, $4, $5)
    RETURNING
        id INTO gamesId;
        RETURN gamesId;
    END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGame" (id TEXT, matchId TEXT,  bracketId TEXT,  tournamentId TEXT, gamesName TEXT);

CREATE OR REPLACE FUNCTION "editGame" (id TEXT, matchId TEXT,  bracketId TEXT,  tournamentId TEXT, gamesName TEXT)
    RETURNS VOID
AS $$
UPDATE
    Games
SET
    matchId = $2,
    bracketId = $3,
    tournamentId = $4,
    gamesName = $5

    WHERE id=Games.id;
    $$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGame" (id TEXT);

CREATE OR REPLACE FUNCTION "deleteGame" (id TEXT)
    RETURNS VOID
AS $$ DELETE FROM Games WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificGame" (id TEXT);

CREATE OR REPLACE FUNCTION "getSpecificGame" (id TEXT)
    RETURNS TABLE (id TEXT, matchId TEXT,  bracketId TEXT,  tournamentId TEXT, gamesName TEXT)
AS $$
SELECT
    id, matchId, bracketId,  tournamentId, gamesName
FROM
    Games
    WHERE id=Games.id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSpecificGame" ();

CREATE OR REPLACE FUNCTION "getSpecificGame" ()
    RETURNS TABLE (id TEXT, matchId TEXT,  bracketId TEXT,  tournamentId TEXT, gamesName TEXT)
AS $$
SELECT
    id, matchId, bracketId,  tournamentId, gamesName
FROM
    Games
    WHERE id=Games.id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

---------------------------------------------- Games --------------------------------------------------------------------------------------------
