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
    birthdate = $7;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayer" (id INT);

CREATE OR REPLACE FUNCTION "deletePlayer" (id INT)
    RETURNS VOID
AS $$ DELETE FROM Players;
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
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayers" ();

CREATE OR REPLACE FUNCTION "getSpecificPlayer" ()
    RETURNS TABLE (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE)
AS $$
SELECT
    id, firstName, lastName, inGameName, photoURL, region, birthdate
FROM
    Players
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
                LanguageCodes.languageCode = $1) THEN
            RETURN - 1;
    ELSE
        INSERT INTO LanguageCodes (languageCode, languageText)
        VALUES ($1, $2)
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
