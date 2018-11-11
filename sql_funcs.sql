DROP FUNCTION IF EXISTS "addGameTimelineFrameEventBuildingKill" (gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, teamId INT, buildingType TEXT, laneType TEXT, towerType TEXT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventBuildingKill" (gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, teamId INT, buildingType TEXT, laneType TEXT, towerType TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventBuildingKill
		WHERE
			GameTimelineFrameEventBuildingKill.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventBuildingKill (gameId, type, _timestamp, xPosition, yPosition, killerId, teamId, buildingType, laneType, towerType)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventBuildingKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, teamId INT, buildingType TEXT, laneType TEXT, towerType TEXT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventBuildingKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, teamId INT, buildingType TEXT, laneType TEXT, towerType TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventBuildingKill
SET 	gameId=$2, type=$3, _timestamp=$4, xPosition=$5, yPosition=$6, killerId=$7, teamId=$8, buildingType=$9, laneType=$10, towerType=$11
	WHERE id=GameTimelineFrameEventBuildingKill.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventBuildingKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventBuildingKill" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, teamId INT, buildingType TEXT, laneType TEXT, towerType TEXT)
AS $$
SELECT auto_id, gameId, type, _timestamp, xPosition, yPosition, killerId, teamId, buildingType, laneType, towerType
FROM
	GameTimelineFrameEventBuildingKill
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventBuildingKill"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventBuildingKill"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, teamId INT, buildingType TEXT, laneType TEXT, towerType TEXT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, xPosition, yPosition, killerId, teamId, buildingType, laneType, towerType
	FROM GameTimelineFrameEventBuildingKill
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventBuildingKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventBuildingKill" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventBuildingKill WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventBuildingKill-------------------

DROP FUNCTION IF EXISTS "addGameStatTeamBans" (gameId TEXT, teamId INT, championId INT, pickTurn INT);
CREATE OR REPLACE FUNCTION "addGameStatTeamBans" (gameId TEXT, teamId INT, championId INT, pickTurn INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameStatTeamBans
		WHERE
			GameStatTeamBans.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameStatTeamBans (gameId, teamId, championId, pickTurn)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameStatTeamBans" (auto_id INT, gameId TEXT, teamId INT, championId INT, pickTurn INT);
CREATE OR REPLACE FUNCTION "editGameStatTeamBans" (auto_id INT, gameId TEXT, teamId INT, championId INT, pickTurn INT)
	RETURNS VOID
AS $$
UPDATE
	GameStatTeamBans
SET 	gameId=$2, teamId=$3, championId=$4, pickTurn=$5
	WHERE id=GameStatTeamBans.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameStatTeamBans" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameStatTeamBans" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, teamId INT, championId INT, pickTurn INT)
AS $$
SELECT auto_id, gameId, teamId, championId, pickTurn
FROM
	GameStatTeamBans
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameStatTeamBans"();
CREATE OR REPLACE FUNCTION "getAllGameStatTeamBans"()
RETURNS TABLE(auto_id INT, gameId TEXT, teamId INT, championId INT, pickTurn INT)  AS $$
	SELECT auto_id, gameId, teamId, championId, pickTurn
	FROM GameStatTeamBans
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameStatTeamBans" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameStatTeamBans" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameStatTeamBans WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameStatTeamBans-------------------

DROP FUNCTION IF EXISTS "addItemMaps" (itemId INT, patch TEXT, mapId INT);
CREATE OR REPLACE FUNCTION "addItemMaps" (itemId INT, patch TEXT, mapId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemMaps
		WHERE
			ItemMaps.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemMaps (itemId, patch, mapId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemMaps" (auto_id INT, itemId INT, patch TEXT, mapId INT);
CREATE OR REPLACE FUNCTION "editItemMaps" (auto_id INT, itemId INT, patch TEXT, mapId INT)
	RETURNS VOID
AS $$
UPDATE
	ItemMaps
SET 	itemId=$2, patch=$3, mapId=$4
	WHERE id=ItemMaps.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemMaps" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemMaps" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, mapId INT)
AS $$
SELECT auto_id, itemId, patch, mapId
FROM
	ItemMaps
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemMaps"();
CREATE OR REPLACE FUNCTION "getAllItemMaps"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, mapId INT)  AS $$
	SELECT auto_id, itemId, patch, mapId
	FROM ItemMaps
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemMaps" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemMaps" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemMaps WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemMaps-------------------

DROP FUNCTION IF EXISTS "addPatches" (patch TEXT);
CREATE OR REPLACE FUNCTION "addPatches" (patch TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Patches
		WHERE
			Patches.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Patches (patch)
		VALUES ($1)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPatches" (auto_id INT, patch TEXT);
CREATE OR REPLACE FUNCTION "editPatches" (auto_id INT, patch TEXT)
	RETURNS VOID
AS $$
UPDATE
	Patches
SET 	patch=$2
	WHERE id=Patches.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPatches" (auto_id INT);
CREATE OR REPLACE FUNCTION "getPatches" (auto_id INT)
	RETURNS TABLE (auto_id INT, patch TEXT)
AS $$
SELECT auto_id, patch
FROM
	Patches
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPatches"();
CREATE OR REPLACE FUNCTION "getAllPatches"()
RETURNS TABLE(auto_id INT, patch TEXT)  AS $$
	SELECT auto_id, patch
	FROM Patches
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePatches" (auto_id INT);
CREATE OR REPLACE FUNCTION "deletePatches" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Patches WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Patches-------------------

DROP FUNCTION IF EXISTS "addLeagueNames" (leagueId INT, languageCode TEXT, leagueNamesName TEXT);
CREATE OR REPLACE FUNCTION "addLeagueNames" (leagueId INT, languageCode TEXT, leagueNamesName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			LeagueNames
		WHERE
			LeagueNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO LeagueNames (leagueId, languageCode, leagueNamesName)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLeagueNames" (auto_id INT, leagueId INT, languageCode TEXT, leagueNamesName TEXT);
CREATE OR REPLACE FUNCTION "editLeagueNames" (auto_id INT, leagueId INT, languageCode TEXT, leagueNamesName TEXT)
	RETURNS VOID
AS $$
UPDATE
	LeagueNames
SET 	leagueId=$2, languageCode=$3, leagueNamesName=$4
	WHERE id=LeagueNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLeagueNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getLeagueNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, leagueId INT, languageCode TEXT, leagueNamesName TEXT)
AS $$
SELECT auto_id, leagueId, languageCode, leagueNamesName
FROM
	LeagueNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllLeagueNames"();
CREATE OR REPLACE FUNCTION "getAllLeagueNames"()
RETURNS TABLE(auto_id INT, leagueId INT, languageCode TEXT, leagueNamesName TEXT)  AS $$
	SELECT auto_id, leagueId, languageCode, leagueNamesName
	FROM LeagueNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLeagueNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteLeagueNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM LeagueNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------LeagueNames-------------------

DROP FUNCTION IF EXISTS "addItemStats" (itemId INT, patch TEXT, stat INT, statValue NUMERIC);
CREATE OR REPLACE FUNCTION "addItemStats" (itemId INT, patch TEXT, stat INT, statValue NUMERIC)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemStats
		WHERE
			ItemStats.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemStats (itemId, patch, stat, statValue)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemStats" (auto_id INT, itemId INT, patch TEXT, stat INT, statValue NUMERIC);
CREATE OR REPLACE FUNCTION "editItemStats" (auto_id INT, itemId INT, patch TEXT, stat INT, statValue NUMERIC)
	RETURNS VOID
AS $$
UPDATE
	ItemStats
SET 	itemId=$2, patch=$3, stat=$4, statValue=$5
	WHERE id=ItemStats.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemStats" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, stat INT, statValue NUMERIC)
AS $$
SELECT auto_id, itemId, patch, stat, statValue
FROM
	ItemStats
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemStats"();
CREATE OR REPLACE FUNCTION "getAllItemStats"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, stat INT, statValue NUMERIC)  AS $$
	SELECT auto_id, itemId, patch, stat, statValue
	FROM ItemStats
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemStats" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemStats WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemStats-------------------

DROP FUNCTION IF EXISTS "addMasteryNames" (masteryId INT, patch TEXT, languageCode TEXT, masteryName TEXT);
CREATE OR REPLACE FUNCTION "addMasteryNames" (masteryId INT, patch TEXT, languageCode TEXT, masteryName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			MasteryNames
		WHERE
			MasteryNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO MasteryNames (masteryId, patch, languageCode, masteryName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMasteryNames" (auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryName TEXT);
CREATE OR REPLACE FUNCTION "editMasteryNames" (auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryName TEXT)
	RETURNS VOID
AS $$
UPDATE
	MasteryNames
SET 	masteryId=$2, patch=$3, languageCode=$4, masteryName=$5
	WHERE id=MasteryNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getMasteryNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getMasteryNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryName TEXT)
AS $$
SELECT auto_id, masteryId, patch, languageCode, masteryName
FROM
	MasteryNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllMasteryNames"();
CREATE OR REPLACE FUNCTION "getAllMasteryNames"()
RETURNS TABLE(auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryName TEXT)  AS $$
	SELECT auto_id, masteryId, patch, languageCode, masteryName
	FROM MasteryNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMasteryNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteMasteryNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM MasteryNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------MasteryNames-------------------

DROP FUNCTION IF EXISTS "addPlayerStatsSummariesMostPlayedChampions" (playerStatsSummaryId INT, championId INT, wins INT, losses INT, total INT, kdaRatioRank NUMERIC);
CREATE OR REPLACE FUNCTION "addPlayerStatsSummariesMostPlayedChampions" (playerStatsSummaryId INT, championId INT, wins INT, losses INT, total INT, kdaRatioRank NUMERIC)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			PlayerStatsSummariesMostPlayedChampions
		WHERE
			PlayerStatsSummariesMostPlayedChampions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO PlayerStatsSummariesMostPlayedChampions (playerStatsSummaryId, championId, wins, losses, total, kdaRatioRank)
		VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayerStatsSummariesMostPlayedChampions" (auto_id INT, playerStatsSummaryId INT, championId INT, wins INT, losses INT, total INT, kdaRatioRank NUMERIC);
CREATE OR REPLACE FUNCTION "editPlayerStatsSummariesMostPlayedChampions" (auto_id INT, playerStatsSummaryId INT, championId INT, wins INT, losses INT, total INT, kdaRatioRank NUMERIC)
	RETURNS VOID
AS $$
UPDATE
	PlayerStatsSummariesMostPlayedChampions
SET 	playerStatsSummaryId=$2, championId=$3, wins=$4, losses=$5, total=$6, kdaRatioRank=$7
	WHERE id=PlayerStatsSummariesMostPlayedChampions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayerStatsSummariesMostPlayedChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getPlayerStatsSummariesMostPlayedChampions" (auto_id INT)
	RETURNS TABLE (auto_id INT, playerStatsSummaryId INT, championId INT, wins INT, losses INT, total INT, kdaRatioRank NUMERIC)
AS $$
SELECT auto_id, playerStatsSummaryId, championId, wins, losses, total, kdaRatioRank
FROM
	PlayerStatsSummariesMostPlayedChampions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPlayerStatsSummariesMostPlayedChampions"();
CREATE OR REPLACE FUNCTION "getAllPlayerStatsSummariesMostPlayedChampions"()
RETURNS TABLE(auto_id INT, playerStatsSummaryId INT, championId INT, wins INT, losses INT, total INT, kdaRatioRank NUMERIC)  AS $$
	SELECT auto_id, playerStatsSummaryId, championId, wins, losses, total, kdaRatioRank
	FROM PlayerStatsSummariesMostPlayedChampions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayerStatsSummariesMostPlayedChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deletePlayerStatsSummariesMostPlayedChampions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM PlayerStatsSummariesMostPlayedChampions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------PlayerStatsSummariesMostPlayedChampions-------------------

DROP FUNCTION IF EXISTS "addItemBuiltFroms" (itemId INT, patch TEXT, fromItemId INT);
CREATE OR REPLACE FUNCTION "addItemBuiltFroms" (itemId INT, patch TEXT, fromItemId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemBuiltFroms
		WHERE
			ItemBuiltFroms.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemBuiltFroms (itemId, patch, fromItemId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemBuiltFroms" (auto_id INT, itemId INT, patch TEXT, fromItemId INT);
CREATE OR REPLACE FUNCTION "editItemBuiltFroms" (auto_id INT, itemId INT, patch TEXT, fromItemId INT)
	RETURNS VOID
AS $$
UPDATE
	ItemBuiltFroms
SET 	itemId=$2, patch=$3, fromItemId=$4
	WHERE id=ItemBuiltFroms.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemBuiltFroms" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemBuiltFroms" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, fromItemId INT)
AS $$
SELECT auto_id, itemId, patch, fromItemId
FROM
	ItemBuiltFroms
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemBuiltFroms"();
CREATE OR REPLACE FUNCTION "getAllItemBuiltFroms"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, fromItemId INT)  AS $$
	SELECT auto_id, itemId, patch, fromItemId
	FROM ItemBuiltFroms
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemBuiltFroms" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemBuiltFroms" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemBuiltFroms WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemBuiltFroms-------------------

DROP FUNCTION IF EXISTS "addChampionSpellResources" (championId INT, spellId INT, patch TEXT, languageCode TEXT, resource TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpellResources" (championId INT, spellId INT, patch TEXT, languageCode TEXT, resource TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellResources
		WHERE
			ChampionSpellResources.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellResources (championId, spellId, patch, languageCode, resource)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellResources" (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, resource TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpellResources" (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, resource TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellResources
SET 	championId=$2, spellId=$3, patch=$4, languageCode=$5, resource=$6
	WHERE id=ChampionSpellResources.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellResources" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellResources" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, resource TEXT)
AS $$
SELECT auto_id, championId, spellId, patch, languageCode, resource
FROM
	ChampionSpellResources
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellResources"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellResources"()
RETURNS TABLE(auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, resource TEXT)  AS $$
	SELECT auto_id, championId, spellId, patch, languageCode, resource
	FROM ChampionSpellResources
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellResources" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellResources" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellResources WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellResources-------------------

DROP FUNCTION IF EXISTS "addGameStats" (gameId TEXT, platformId TEXT, gameCreation NUMERIC, gameDuration INT, mapId INT, seasonId INT, gameVersion TEXT, gameMode TEXT);
CREATE OR REPLACE FUNCTION "addGameStats" (gameId TEXT, platformId TEXT, gameCreation NUMERIC, gameDuration INT, mapId INT, seasonId INT, gameVersion TEXT, gameMode TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameStats
		WHERE
			GameStats.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameStats (gameId, platformId, gameCreation, gameDuration, mapId, seasonId, gameVersion, gameMode)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameStats" (auto_id INT, gameId TEXT, platformId TEXT, gameCreation NUMERIC, gameDuration INT, mapId INT, seasonId INT, gameVersion TEXT, gameMode TEXT);
CREATE OR REPLACE FUNCTION "editGameStats" (auto_id INT, gameId TEXT, platformId TEXT, gameCreation NUMERIC, gameDuration INT, mapId INT, seasonId INT, gameVersion TEXT, gameMode TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameStats
SET 	gameId=$2, platformId=$3, gameCreation=$4, gameDuration=$5, mapId=$6, seasonId=$7, gameVersion=$8, gameMode=$9
	WHERE id=GameStats.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameStats" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, platformId TEXT, gameCreation NUMERIC, gameDuration INT, mapId INT, seasonId INT, gameVersion TEXT, gameMode TEXT)
AS $$
SELECT auto_id, gameId, platformId, gameCreation, gameDuration, mapId, seasonId, gameVersion, gameMode
FROM
	GameStats
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameStats"();
CREATE OR REPLACE FUNCTION "getAllGameStats"()
RETURNS TABLE(auto_id INT, gameId TEXT, platformId TEXT, gameCreation NUMERIC, gameDuration INT, mapId INT, seasonId INT, gameVersion TEXT, gameMode TEXT)  AS $$
	SELECT auto_id, gameId, platformId, gameCreation, gameDuration, mapId, seasonId, gameVersion, gameMode
	FROM GameStats
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameStats" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameStats WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameStats-------------------

DROP FUNCTION IF EXISTS "addTeamStatsHistoriesChampions" (teamStatsHistoriesId TEXT, championId INT);
CREATE OR REPLACE FUNCTION "addTeamStatsHistoriesChampions" (teamStatsHistoriesId TEXT, championId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamStatsHistoriesChampions
		WHERE
			TeamStatsHistoriesChampions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamStatsHistoriesChampions (teamStatsHistoriesId, championId)
		VALUES ($1, $2)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamStatsHistoriesChampions" (auto_id INT, teamStatsHistoriesId TEXT, championId INT);
CREATE OR REPLACE FUNCTION "editTeamStatsHistoriesChampions" (auto_id INT, teamStatsHistoriesId TEXT, championId INT)
	RETURNS VOID
AS $$
UPDATE
	TeamStatsHistoriesChampions
SET 	teamStatsHistoriesId=$2, championId=$3
	WHERE id=TeamStatsHistoriesChampions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamStatsHistoriesChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamStatsHistoriesChampions" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamStatsHistoriesId TEXT, championId INT)
AS $$
SELECT auto_id, teamStatsHistoriesId, championId
FROM
	TeamStatsHistoriesChampions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamStatsHistoriesChampions"();
CREATE OR REPLACE FUNCTION "getAllTeamStatsHistoriesChampions"()
RETURNS TABLE(auto_id INT, teamStatsHistoriesId TEXT, championId INT)  AS $$
	SELECT auto_id, teamStatsHistoriesId, championId
	FROM TeamStatsHistoriesChampions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamStatsHistoriesChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamStatsHistoriesChampions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamStatsHistoriesChampions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamStatsHistoriesChampions-------------------

DROP FUNCTION IF EXISTS "addMapUnpurchasableItems" (mapId INT, patch TEXT, itemId INT);
CREATE OR REPLACE FUNCTION "addMapUnpurchasableItems" (mapId INT, patch TEXT, itemId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			MapUnpurchasableItems
		WHERE
			MapUnpurchasableItems.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO MapUnpurchasableItems (mapId, patch, itemId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMapUnpurchasableItems" (auto_id INT, mapId INT, patch TEXT, itemId INT);
CREATE OR REPLACE FUNCTION "editMapUnpurchasableItems" (auto_id INT, mapId INT, patch TEXT, itemId INT)
	RETURNS VOID
AS $$
UPDATE
	MapUnpurchasableItems
SET 	mapId=$2, patch=$3, itemId=$4
	WHERE id=MapUnpurchasableItems.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getMapUnpurchasableItems" (auto_id INT);
CREATE OR REPLACE FUNCTION "getMapUnpurchasableItems" (auto_id INT)
	RETURNS TABLE (auto_id INT, mapId INT, patch TEXT, itemId INT)
AS $$
SELECT auto_id, mapId, patch, itemId
FROM
	MapUnpurchasableItems
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllMapUnpurchasableItems"();
CREATE OR REPLACE FUNCTION "getAllMapUnpurchasableItems"()
RETURNS TABLE(auto_id INT, mapId INT, patch TEXT, itemId INT)  AS $$
	SELECT auto_id, mapId, patch, itemId
	FROM MapUnpurchasableItems
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMapUnpurchasableItems" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteMapUnpurchasableItems" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM MapUnpurchasableItems WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------MapUnpurchasableItems-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventWardPlaced" (gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, creatorId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventWardPlaced" (gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, creatorId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventWardPlaced
		WHERE
			GameTimelineFrameEventWardPlaced.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventWardPlaced (gameId, type, _timestamp, wardType, creatorId)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventWardPlaced" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, creatorId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventWardPlaced" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, creatorId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventWardPlaced
SET 	gameId=$2, type=$3, _timestamp=$4, wardType=$5, creatorId=$6
	WHERE id=GameTimelineFrameEventWardPlaced.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventWardPlaced" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventWardPlaced" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, creatorId INT)
AS $$
SELECT auto_id, gameId, type, _timestamp, wardType, creatorId
FROM
	GameTimelineFrameEventWardPlaced
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventWardPlaced"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventWardPlaced"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, creatorId INT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, wardType, creatorId
	FROM GameTimelineFrameEventWardPlaced
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventWardPlaced" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventWardPlaced" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventWardPlaced WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventWardPlaced-------------------

DROP FUNCTION IF EXISTS "addGameStatsParticipantRunes" (gameId TEXT, participantId INT, runeId INT, rank INT);
CREATE OR REPLACE FUNCTION "addGameStatsParticipantRunes" (gameId TEXT, participantId INT, runeId INT, rank INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameStatsParticipantRunes
		WHERE
			GameStatsParticipantRunes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameStatsParticipantRunes (gameId, participantId, runeId, rank)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameStatsParticipantRunes" (auto_id INT, gameId TEXT, participantId INT, runeId INT, rank INT);
CREATE OR REPLACE FUNCTION "editGameStatsParticipantRunes" (auto_id INT, gameId TEXT, participantId INT, runeId INT, rank INT)
	RETURNS VOID
AS $$
UPDATE
	GameStatsParticipantRunes
SET 	gameId=$2, participantId=$3, runeId=$4, rank=$5
	WHERE id=GameStatsParticipantRunes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameStatsParticipantRunes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameStatsParticipantRunes" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, participantId INT, runeId INT, rank INT)
AS $$
SELECT auto_id, gameId, participantId, runeId, rank
FROM
	GameStatsParticipantRunes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameStatsParticipantRunes"();
CREATE OR REPLACE FUNCTION "getAllGameStatsParticipantRunes"()
RETURNS TABLE(auto_id INT, gameId TEXT, participantId INT, runeId INT, rank INT)  AS $$
	SELECT auto_id, gameId, participantId, runeId, rank
	FROM GameStatsParticipantRunes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameStatsParticipantRunes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameStatsParticipantRunes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameStatsParticipantRunes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameStatsParticipantRunes-------------------

DROP FUNCTION IF EXISTS "addChampionTitles" (championId INT, patch TEXT, languageCode TEXT, title TEXT);
CREATE OR REPLACE FUNCTION "addChampionTitles" (championId INT, patch TEXT, languageCode TEXT, title TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionTitles
		WHERE
			ChampionTitles.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionTitles (championId, patch, languageCode, title)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionTitles" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, title TEXT);
CREATE OR REPLACE FUNCTION "editChampionTitles" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, title TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionTitles
SET 	championId=$2, patch=$3, languageCode=$4, title=$5
	WHERE id=ChampionTitles.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionTitles" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionTitles" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, title TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, title
FROM
	ChampionTitles
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionTitles"();
CREATE OR REPLACE FUNCTION "getAllChampionTitles"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, title TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, title
	FROM ChampionTitles
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionTitles" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionTitles" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionTitles WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionTitles-------------------

DROP FUNCTION IF EXISTS "addTournamentBracketMatchTypes" (tournamentId TEXT, bracketId TEXT, type TEXT, bestOf INT);
CREATE OR REPLACE FUNCTION "addTournamentBracketMatchTypes" (tournamentId TEXT, bracketId TEXT, type TEXT, bestOf INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TournamentBracketMatchTypes
		WHERE
			TournamentBracketMatchTypes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TournamentBracketMatchTypes (tournamentId, bracketId, type, bestOf)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournamentBracketMatchTypes" (auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, bestOf INT);
CREATE OR REPLACE FUNCTION "editTournamentBracketMatchTypes" (auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, bestOf INT)
	RETURNS VOID
AS $$
UPDATE
	TournamentBracketMatchTypes
SET 	tournamentId=$2, bracketId=$3, type=$4, bestOf=$5
	WHERE id=TournamentBracketMatchTypes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTournamentBracketMatchTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTournamentBracketMatchTypes" (auto_id INT)
	RETURNS TABLE (auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, bestOf INT)
AS $$
SELECT auto_id, tournamentId, bracketId, type, bestOf
FROM
	TournamentBracketMatchTypes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTournamentBracketMatchTypes"();
CREATE OR REPLACE FUNCTION "getAllTournamentBracketMatchTypes"()
RETURNS TABLE(auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, bestOf INT)  AS $$
	SELECT auto_id, tournamentId, bracketId, type, bestOf
	FROM TournamentBracketMatchTypes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournamentBracketMatchTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTournamentBracketMatchTypes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TournamentBracketMatchTypes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TournamentBracketMatchTypes-------------------

DROP FUNCTION IF EXISTS "addItemImages" (itemId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addItemImages" (itemId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemImages
		WHERE
			ItemImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemImages (itemId, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemImages" (auto_id INT, itemId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editItemImages" (auto_id INT, itemId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	ItemImages
SET 	itemId=$2, patch=$3, fullURL=$4, spriteURL=$5, x=$6, y=$7, w=$8, h=$9
	WHERE id=ItemImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, itemId, patch, fullURL, spriteURL, x, y, w, h
FROM
	ItemImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemImages"();
CREATE OR REPLACE FUNCTION "getAllItemImages"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, itemId, patch, fullURL, spriteURL, x, y, w, h
	FROM ItemImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemImages-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventTypes" (type TEXT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventTypes" (type TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventTypes
		WHERE
			GameTimelineFrameEventTypes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventTypes (type)
		VALUES ($1)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventTypes" (auto_id INT, type TEXT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventTypes" (auto_id INT, type TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventTypes
SET 	type=$2
	WHERE id=GameTimelineFrameEventTypes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventTypes" (auto_id INT)
	RETURNS TABLE (auto_id INT, type TEXT)
AS $$
SELECT auto_id, type
FROM
	GameTimelineFrameEventTypes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventTypes"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventTypes"()
RETURNS TABLE(auto_id INT, type TEXT)  AS $$
	SELECT auto_id, type
	FROM GameTimelineFrameEventTypes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventTypes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventTypes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventTypes-------------------

DROP FUNCTION IF EXISTS "addSummonerSpellImages" (summonerId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addSummonerSpellImages" (summonerId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			SummonerSpellImages
		WHERE
			SummonerSpellImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO SummonerSpellImages (summonerId, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editSummonerSpellImages" (auto_id INT, summonerId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editSummonerSpellImages" (auto_id INT, summonerId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	SummonerSpellImages
SET 	summonerId=$2, patch=$3, fullURL=$4, spriteURL=$5, x=$6, y=$7, w=$8, h=$9
	WHERE id=SummonerSpellImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSummonerSpellImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getSummonerSpellImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, summonerId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, summonerId, patch, fullURL, spriteURL, x, y, w, h
FROM
	SummonerSpellImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllSummonerSpellImages"();
CREATE OR REPLACE FUNCTION "getAllSummonerSpellImages"()
RETURNS TABLE(auto_id INT, summonerId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, summonerId, patch, fullURL, spriteURL, x, y, w, h
	FROM SummonerSpellImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteSummonerSpellImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteSummonerSpellImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM SummonerSpellImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------SummonerSpellImages-------------------

DROP FUNCTION IF EXISTS "addRuneNames" (runeId INT, patch TEXT, languageCode TEXT, runeName TEXT);
CREATE OR REPLACE FUNCTION "addRuneNames" (runeId INT, patch TEXT, languageCode TEXT, runeName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RuneNames
		WHERE
			RuneNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RuneNames (runeId, patch, languageCode, runeName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRuneNames" (auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeName TEXT);
CREATE OR REPLACE FUNCTION "editRuneNames" (auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeName TEXT)
	RETURNS VOID
AS $$
UPDATE
	RuneNames
SET 	runeId=$2, patch=$3, languageCode=$4, runeName=$5
	WHERE id=RuneNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRuneNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRuneNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeName TEXT)
AS $$
SELECT auto_id, runeId, patch, languageCode, runeName
FROM
	RuneNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRuneNames"();
CREATE OR REPLACE FUNCTION "getAllRuneNames"()
RETURNS TABLE(auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeName TEXT)  AS $$
	SELECT auto_id, runeId, patch, languageCode, runeName
	FROM RuneNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRuneNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRuneNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RuneNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RuneNames-------------------

DROP FUNCTION IF EXISTS "addMasteries" (id INT, patch TEXT, ranks INT, prereq INT, branchName TEXT, columnIndex INT, rowIndex INT);
CREATE OR REPLACE FUNCTION "addMasteries" (id INT, patch TEXT, ranks INT, prereq INT, branchName TEXT, columnIndex INT, rowIndex INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Masteries
		WHERE
			Masteries.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Masteries (id, patch, ranks, prereq, branchName, columnIndex, rowIndex)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMasteries" (auto_id INT, id INT, patch TEXT, ranks INT, prereq INT, branchName TEXT, columnIndex INT, rowIndex INT);
CREATE OR REPLACE FUNCTION "editMasteries" (auto_id INT, id INT, patch TEXT, ranks INT, prereq INT, branchName TEXT, columnIndex INT, rowIndex INT)
	RETURNS VOID
AS $$
UPDATE
	Masteries
SET 	id=$2, patch=$3, ranks=$4, prereq=$5, branchName=$6, columnIndex=$7, rowIndex=$8
	WHERE id=Masteries.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getMasteries" (auto_id INT);
CREATE OR REPLACE FUNCTION "getMasteries" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, patch TEXT, ranks INT, prereq INT, branchName TEXT, columnIndex INT, rowIndex INT)
AS $$
SELECT auto_id, id, patch, ranks, prereq, branchName, columnIndex, rowIndex
FROM
	Masteries
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllMasteries"();
CREATE OR REPLACE FUNCTION "getAllMasteries"()
RETURNS TABLE(auto_id INT, id INT, patch TEXT, ranks INT, prereq INT, branchName TEXT, columnIndex INT, rowIndex INT)  AS $$
	SELECT auto_id, id, patch, ranks, prereq, branchName, columnIndex, rowIndex
	FROM Masteries
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMasteries" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteMasteries" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Masteries WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Masteries-------------------

DROP FUNCTION IF EXISTS "addRunesReforgedRuneNames" (runesReforgedRuneId INT, patch TEXT, languageCode TEXT, runesReforgedRuneName TEXT);
CREATE OR REPLACE FUNCTION "addRunesReforgedRuneNames" (runesReforgedRuneId INT, patch TEXT, languageCode TEXT, runesReforgedRuneName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RunesReforgedRuneNames
		WHERE
			RunesReforgedRuneNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RunesReforgedRuneNames (runesReforgedRuneId, patch, languageCode, runesReforgedRuneName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRunesReforgedRuneNames" (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, runesReforgedRuneName TEXT);
CREATE OR REPLACE FUNCTION "editRunesReforgedRuneNames" (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, runesReforgedRuneName TEXT)
	RETURNS VOID
AS $$
UPDATE
	RunesReforgedRuneNames
SET 	runesReforgedRuneId=$2, patch=$3, languageCode=$4, runesReforgedRuneName=$5
	WHERE id=RunesReforgedRuneNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRunesReforgedRuneNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRunesReforgedRuneNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, runesReforgedRuneName TEXT)
AS $$
SELECT auto_id, runesReforgedRuneId, patch, languageCode, runesReforgedRuneName
FROM
	RunesReforgedRuneNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRunesReforgedRuneNames"();
CREATE OR REPLACE FUNCTION "getAllRunesReforgedRuneNames"()
RETURNS TABLE(auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, runesReforgedRuneName TEXT)  AS $$
	SELECT auto_id, runesReforgedRuneId, patch, languageCode, runesReforgedRuneName
	FROM RunesReforgedRuneNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRunesReforgedRuneNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRunesReforgedRuneNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RunesReforgedRuneNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RunesReforgedRuneNames-------------------

DROP FUNCTION IF EXISTS "addTeamStatsHistories" (id TEXT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT);
CREATE OR REPLACE FUNCTION "addTeamStatsHistories" (id TEXT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamStatsHistories
		WHERE
			TeamStatsHistories.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamStatsHistories (id, _timestamp, assists, deaths, kills, win, matchId, teamId, opponentTeamId, gameId)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamStatsHistories" (auto_id INT, id TEXT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT);
CREATE OR REPLACE FUNCTION "editTeamStatsHistories" (auto_id INT, id TEXT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)
	RETURNS VOID
AS $$
UPDATE
	TeamStatsHistories
SET 	id=$2, _timestamp=$3, assists=$4, deaths=$5, kills=$6, win=$7, matchId=$8, teamId=$9, opponentTeamId=$10, gameId=$11
	WHERE id=TeamStatsHistories.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamStatsHistories" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamStatsHistories" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)
AS $$
SELECT auto_id, id, _timestamp, assists, deaths, kills, win, matchId, teamId, opponentTeamId, gameId
FROM
	TeamStatsHistories
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamStatsHistories"();
CREATE OR REPLACE FUNCTION "getAllTeamStatsHistories"()
RETURNS TABLE(auto_id INT, id TEXT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)  AS $$
	SELECT auto_id, id, _timestamp, assists, deaths, kills, win, matchId, teamId, opponentTeamId, gameId
	FROM TeamStatsHistories
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamStatsHistories" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamStatsHistories" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamStatsHistories WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamStatsHistories-------------------

DROP FUNCTION IF EXISTS "addChampionSpellImages" (championId INT, spellId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addChampionSpellImages" (championId INT, spellId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellImages
		WHERE
			ChampionSpellImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellImages (championId, spellId, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellImages" (auto_id INT, championId INT, spellId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editChampionSpellImages" (auto_id INT, championId INT, spellId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellImages
SET 	championId=$2, spellId=$3, patch=$4, fullURL=$5, spriteURL=$6, x=$7, y=$8, w=$9, h=$10
	WHERE id=ChampionSpellImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, spellId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, championId, spellId, patch, fullURL, spriteURL, x, y, w, h
FROM
	ChampionSpellImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellImages"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellImages"()
RETURNS TABLE(auto_id INT, championId INT, spellId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, championId, spellId, patch, fullURL, spriteURL, x, y, w, h
	FROM ChampionSpellImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellImages-------------------

DROP FUNCTION IF EXISTS "addGameStatsParticipantStats" (gameId TEXT, participantId INT, win BOOLEAN, item0 INT, item1 INT, item2 INT, item3 INT, item4 INT, item5 INT, item6 INT, kills INT, deaths INT, assists INT, largestKillingSpree INT, largestMultiKill INT, killingSpree INT, longestTimeSpentLiving INT, doubleKills INT, tripleKills INT, quadraKills INT, pentaKills INT, unrealKills INT, totalDamageDealt INT, magicDamageDealt INT, physicalDamageDealt INT, ruteDamageDealt INT, largestCriticalStrike INT, totalDamageDealtToChampions INT, magicDamageDealtToChampions INT, physicalDamageDealtToChampions INT, trueDamageDealtToChampions INT, totalHeal INT, totalUnitsHealed INT, damageSelfMitigated INT, damageDealtToObjectives INT, damageDealtToTurrets INT, visionScore INT, timeCCingOthers INT, totalDamageTaken INT, magicalDamageTaken INT, physicalDamageTaken INT, trueDamageTaken INT, goldEarned INT, goldSpent INT, turretKills INT, inhibitorKills INT, totalMinionsKilled INT, neutralMinionsKilled INT, neutralMinionsKilledTeamJungle INT, neutralMinionsKilledEnemyJungle INT, totalTimeCrowdControlDealt INT, champLevel INT, visionWardsBoughtInGame INT, sightWardsBoughtInGame INT, wardsPlaced INT, wardsKilled INT, firstBloodKill BOOLEAN, firstBloodAssist BOOLEAN, firstTowerKill BOOLEAN, firstTowerAssist BOOLEAN, firstInhibitorKill BOOLEAN, firstInhibitorAssist BOOLEAN, combatPlayerScore INT, objectivePlayerScore INT, totalPlayerScore INT, totalScoreRank INT, playerScore0 INT, playerScore1 INT, playerScore2 INT, playerScore3 INT, playerScore4 INT, playerScore5 INT, playerScore6 INT, playerScore7 INT, playerScore8 INT, playerScore9 INT);
CREATE OR REPLACE FUNCTION "addGameStatsParticipantStats" (gameId TEXT, participantId INT, win BOOLEAN, item0 INT, item1 INT, item2 INT, item3 INT, item4 INT, item5 INT, item6 INT, kills INT, deaths INT, assists INT, largestKillingSpree INT, largestMultiKill INT, killingSpree INT, longestTimeSpentLiving INT, doubleKills INT, tripleKills INT, quadraKills INT, pentaKills INT, unrealKills INT, totalDamageDealt INT, magicDamageDealt INT, physicalDamageDealt INT, ruteDamageDealt INT, largestCriticalStrike INT, totalDamageDealtToChampions INT, magicDamageDealtToChampions INT, physicalDamageDealtToChampions INT, trueDamageDealtToChampions INT, totalHeal INT, totalUnitsHealed INT, damageSelfMitigated INT, damageDealtToObjectives INT, damageDealtToTurrets INT, visionScore INT, timeCCingOthers INT, totalDamageTaken INT, magicalDamageTaken INT, physicalDamageTaken INT, trueDamageTaken INT, goldEarned INT, goldSpent INT, turretKills INT, inhibitorKills INT, totalMinionsKilled INT, neutralMinionsKilled INT, neutralMinionsKilledTeamJungle INT, neutralMinionsKilledEnemyJungle INT, totalTimeCrowdControlDealt INT, champLevel INT, visionWardsBoughtInGame INT, sightWardsBoughtInGame INT, wardsPlaced INT, wardsKilled INT, firstBloodKill BOOLEAN, firstBloodAssist BOOLEAN, firstTowerKill BOOLEAN, firstTowerAssist BOOLEAN, firstInhibitorKill BOOLEAN, firstInhibitorAssist BOOLEAN, combatPlayerScore INT, objectivePlayerScore INT, totalPlayerScore INT, totalScoreRank INT, playerScore0 INT, playerScore1 INT, playerScore2 INT, playerScore3 INT, playerScore4 INT, playerScore5 INT, playerScore6 INT, playerScore7 INT, playerScore8 INT, playerScore9 INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameStatsParticipantStats
		WHERE
			GameStatsParticipantStats.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameStatsParticipantStats (gameId, participantId, win, item0, item1, item2, item3, item4, item5, item6, kills, deaths, assists, largestKillingSpree, largestMultiKill, killingSpree, longestTimeSpentLiving, doubleKills, tripleKills, quadraKills, pentaKills, unrealKills, totalDamageDealt, magicDamageDealt, physicalDamageDealt, ruteDamageDealt, largestCriticalStrike, totalDamageDealtToChampions, magicDamageDealtToChampions, physicalDamageDealtToChampions, trueDamageDealtToChampions, totalHeal, totalUnitsHealed, damageSelfMitigated, damageDealtToObjectives, damageDealtToTurrets, visionScore, timeCCingOthers, totalDamageTaken, magicalDamageTaken, physicalDamageTaken, trueDamageTaken, goldEarned, goldSpent, turretKills, inhibitorKills, totalMinionsKilled, neutralMinionsKilled, neutralMinionsKilledTeamJungle, neutralMinionsKilledEnemyJungle, totalTimeCrowdControlDealt, champLevel, visionWardsBoughtInGame, sightWardsBoughtInGame, wardsPlaced, wardsKilled, firstBloodKill, firstBloodAssist, firstTowerKill, firstTowerAssist, firstInhibitorKill, firstInhibitorAssist, combatPlayerScore, objectivePlayerScore, totalPlayerScore, totalScoreRank, playerScore0, playerScore1, playerScore2, playerScore3, playerScore4, playerScore5, playerScore6, playerScore7, playerScore8, playerScore9)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $70, $71, $72, $73, $74, $75, $76)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameStatsParticipantStats" (auto_id INT, gameId TEXT, participantId INT, win BOOLEAN, item0 INT, item1 INT, item2 INT, item3 INT, item4 INT, item5 INT, item6 INT, kills INT, deaths INT, assists INT, largestKillingSpree INT, largestMultiKill INT, killingSpree INT, longestTimeSpentLiving INT, doubleKills INT, tripleKills INT, quadraKills INT, pentaKills INT, unrealKills INT, totalDamageDealt INT, magicDamageDealt INT, physicalDamageDealt INT, ruteDamageDealt INT, largestCriticalStrike INT, totalDamageDealtToChampions INT, magicDamageDealtToChampions INT, physicalDamageDealtToChampions INT, trueDamageDealtToChampions INT, totalHeal INT, totalUnitsHealed INT, damageSelfMitigated INT, damageDealtToObjectives INT, damageDealtToTurrets INT, visionScore INT, timeCCingOthers INT, totalDamageTaken INT, magicalDamageTaken INT, physicalDamageTaken INT, trueDamageTaken INT, goldEarned INT, goldSpent INT, turretKills INT, inhibitorKills INT, totalMinionsKilled INT, neutralMinionsKilled INT, neutralMinionsKilledTeamJungle INT, neutralMinionsKilledEnemyJungle INT, totalTimeCrowdControlDealt INT, champLevel INT, visionWardsBoughtInGame INT, sightWardsBoughtInGame INT, wardsPlaced INT, wardsKilled INT, firstBloodKill BOOLEAN, firstBloodAssist BOOLEAN, firstTowerKill BOOLEAN, firstTowerAssist BOOLEAN, firstInhibitorKill BOOLEAN, firstInhibitorAssist BOOLEAN, combatPlayerScore INT, objectivePlayerScore INT, totalPlayerScore INT, totalScoreRank INT, playerScore0 INT, playerScore1 INT, playerScore2 INT, playerScore3 INT, playerScore4 INT, playerScore5 INT, playerScore6 INT, playerScore7 INT, playerScore8 INT, playerScore9 INT);
CREATE OR REPLACE FUNCTION "editGameStatsParticipantStats" (auto_id INT, gameId TEXT, participantId INT, win BOOLEAN, item0 INT, item1 INT, item2 INT, item3 INT, item4 INT, item5 INT, item6 INT, kills INT, deaths INT, assists INT, largestKillingSpree INT, largestMultiKill INT, killingSpree INT, longestTimeSpentLiving INT, doubleKills INT, tripleKills INT, quadraKills INT, pentaKills INT, unrealKills INT, totalDamageDealt INT, magicDamageDealt INT, physicalDamageDealt INT, ruteDamageDealt INT, largestCriticalStrike INT, totalDamageDealtToChampions INT, magicDamageDealtToChampions INT, physicalDamageDealtToChampions INT, trueDamageDealtToChampions INT, totalHeal INT, totalUnitsHealed INT, damageSelfMitigated INT, damageDealtToObjectives INT, damageDealtToTurrets INT, visionScore INT, timeCCingOthers INT, totalDamageTaken INT, magicalDamageTaken INT, physicalDamageTaken INT, trueDamageTaken INT, goldEarned INT, goldSpent INT, turretKills INT, inhibitorKills INT, totalMinionsKilled INT, neutralMinionsKilled INT, neutralMinionsKilledTeamJungle INT, neutralMinionsKilledEnemyJungle INT, totalTimeCrowdControlDealt INT, champLevel INT, visionWardsBoughtInGame INT, sightWardsBoughtInGame INT, wardsPlaced INT, wardsKilled INT, firstBloodKill BOOLEAN, firstBloodAssist BOOLEAN, firstTowerKill BOOLEAN, firstTowerAssist BOOLEAN, firstInhibitorKill BOOLEAN, firstInhibitorAssist BOOLEAN, combatPlayerScore INT, objectivePlayerScore INT, totalPlayerScore INT, totalScoreRank INT, playerScore0 INT, playerScore1 INT, playerScore2 INT, playerScore3 INT, playerScore4 INT, playerScore5 INT, playerScore6 INT, playerScore7 INT, playerScore8 INT, playerScore9 INT)
	RETURNS VOID
AS $$
UPDATE
	GameStatsParticipantStats
SET 	gameId=$2, participantId=$3, win=$4, item0=$5, item1=$6, item2=$7, item3=$8, item4=$9, item5=$10, item6=$11, kills=$12, deaths=$13, assists=$14, largestKillingSpree=$15, largestMultiKill=$16, killingSpree=$17, longestTimeSpentLiving=$18, doubleKills=$19, tripleKills=$20, quadraKills=$21, pentaKills=$22, unrealKills=$23, totalDamageDealt=$24, magicDamageDealt=$25, physicalDamageDealt=$26, ruteDamageDealt=$27, largestCriticalStrike=$28, totalDamageDealtToChampions=$29, magicDamageDealtToChampions=$30, physicalDamageDealtToChampions=$31, trueDamageDealtToChampions=$32, totalHeal=$33, totalUnitsHealed=$34, damageSelfMitigated=$35, damageDealtToObjectives=$36, damageDealtToTurrets=$37, visionScore=$38, timeCCingOthers=$39, totalDamageTaken=$40, magicalDamageTaken=$41, physicalDamageTaken=$42, trueDamageTaken=$43, goldEarned=$44, goldSpent=$45, turretKills=$46, inhibitorKills=$47, totalMinionsKilled=$48, neutralMinionsKilled=$49, neutralMinionsKilledTeamJungle=$50, neutralMinionsKilledEnemyJungle=$51, totalTimeCrowdControlDealt=$52, champLevel=$53, visionWardsBoughtInGame=$54, sightWardsBoughtInGame=$55, wardsPlaced=$56, wardsKilled=$57, firstBloodKill=$58, firstBloodAssist=$59, firstTowerKill=$60, firstTowerAssist=$61, firstInhibitorKill=$62, firstInhibitorAssist=$63, combatPlayerScore=$64, objectivePlayerScore=$65, totalPlayerScore=$66, totalScoreRank=$67, playerScore0=$68, playerScore1=$69, playerScore2=$70, playerScore3=$71, playerScore4=$72, playerScore5=$73, playerScore6=$74, playerScore7=$75, playerScore8=$76, playerScore9=$77
	WHERE id=GameStatsParticipantStats.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameStatsParticipantStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameStatsParticipantStats" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, participantId INT, win BOOLEAN, item0 INT, item1 INT, item2 INT, item3 INT, item4 INT, item5 INT, item6 INT, kills INT, deaths INT, assists INT, largestKillingSpree INT, largestMultiKill INT, killingSpree INT, longestTimeSpentLiving INT, doubleKills INT, tripleKills INT, quadraKills INT, pentaKills INT, unrealKills INT, totalDamageDealt INT, magicDamageDealt INT, physicalDamageDealt INT, ruteDamageDealt INT, largestCriticalStrike INT, totalDamageDealtToChampions INT, magicDamageDealtToChampions INT, physicalDamageDealtToChampions INT, trueDamageDealtToChampions INT, totalHeal INT, totalUnitsHealed INT, damageSelfMitigated INT, damageDealtToObjectives INT, damageDealtToTurrets INT, visionScore INT, timeCCingOthers INT, totalDamageTaken INT, magicalDamageTaken INT, physicalDamageTaken INT, trueDamageTaken INT, goldEarned INT, goldSpent INT, turretKills INT, inhibitorKills INT, totalMinionsKilled INT, neutralMinionsKilled INT, neutralMinionsKilledTeamJungle INT, neutralMinionsKilledEnemyJungle INT, totalTimeCrowdControlDealt INT, champLevel INT, visionWardsBoughtInGame INT, sightWardsBoughtInGame INT, wardsPlaced INT, wardsKilled INT, firstBloodKill BOOLEAN, firstBloodAssist BOOLEAN, firstTowerKill BOOLEAN, firstTowerAssist BOOLEAN, firstInhibitorKill BOOLEAN, firstInhibitorAssist BOOLEAN, combatPlayerScore INT, objectivePlayerScore INT, totalPlayerScore INT, totalScoreRank INT, playerScore0 INT, playerScore1 INT, playerScore2 INT, playerScore3 INT, playerScore4 INT, playerScore5 INT, playerScore6 INT, playerScore7 INT, playerScore8 INT, playerScore9 INT)
AS $$
SELECT auto_id, gameId, participantId, win, item0, item1, item2, item3, item4, item5, item6, kills, deaths, assists, largestKillingSpree, largestMultiKill, killingSpree, longestTimeSpentLiving, doubleKills, tripleKills, quadraKills, pentaKills, unrealKills, totalDamageDealt, magicDamageDealt, physicalDamageDealt, ruteDamageDealt, largestCriticalStrike, totalDamageDealtToChampions, magicDamageDealtToChampions, physicalDamageDealtToChampions, trueDamageDealtToChampions, totalHeal, totalUnitsHealed, damageSelfMitigated, damageDealtToObjectives, damageDealtToTurrets, visionScore, timeCCingOthers, totalDamageTaken, magicalDamageTaken, physicalDamageTaken, trueDamageTaken, goldEarned, goldSpent, turretKills, inhibitorKills, totalMinionsKilled, neutralMinionsKilled, neutralMinionsKilledTeamJungle, neutralMinionsKilledEnemyJungle, totalTimeCrowdControlDealt, champLevel, visionWardsBoughtInGame, sightWardsBoughtInGame, wardsPlaced, wardsKilled, firstBloodKill, firstBloodAssist, firstTowerKill, firstTowerAssist, firstInhibitorKill, firstInhibitorAssist, combatPlayerScore, objectivePlayerScore, totalPlayerScore, totalScoreRank, playerScore0, playerScore1, playerScore2, playerScore3, playerScore4, playerScore5, playerScore6, playerScore7, playerScore8, playerScore9
FROM
	GameStatsParticipantStats
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameStatsParticipantStats"();
CREATE OR REPLACE FUNCTION "getAllGameStatsParticipantStats"()
RETURNS TABLE(auto_id INT, gameId TEXT, participantId INT, win BOOLEAN, item0 INT, item1 INT, item2 INT, item3 INT, item4 INT, item5 INT, item6 INT, kills INT, deaths INT, assists INT, largestKillingSpree INT, largestMultiKill INT, killingSpree INT, longestTimeSpentLiving INT, doubleKills INT, tripleKills INT, quadraKills INT, pentaKills INT, unrealKills INT, totalDamageDealt INT, magicDamageDealt INT, physicalDamageDealt INT, ruteDamageDealt INT, largestCriticalStrike INT, totalDamageDealtToChampions INT, magicDamageDealtToChampions INT, physicalDamageDealtToChampions INT, trueDamageDealtToChampions INT, totalHeal INT, totalUnitsHealed INT, damageSelfMitigated INT, damageDealtToObjectives INT, damageDealtToTurrets INT, visionScore INT, timeCCingOthers INT, totalDamageTaken INT, magicalDamageTaken INT, physicalDamageTaken INT, trueDamageTaken INT, goldEarned INT, goldSpent INT, turretKills INT, inhibitorKills INT, totalMinionsKilled INT, neutralMinionsKilled INT, neutralMinionsKilledTeamJungle INT, neutralMinionsKilledEnemyJungle INT, totalTimeCrowdControlDealt INT, champLevel INT, visionWardsBoughtInGame INT, sightWardsBoughtInGame INT, wardsPlaced INT, wardsKilled INT, firstBloodKill BOOLEAN, firstBloodAssist BOOLEAN, firstTowerKill BOOLEAN, firstTowerAssist BOOLEAN, firstInhibitorKill BOOLEAN, firstInhibitorAssist BOOLEAN, combatPlayerScore INT, objectivePlayerScore INT, totalPlayerScore INT, totalScoreRank INT, playerScore0 INT, playerScore1 INT, playerScore2 INT, playerScore3 INT, playerScore4 INT, playerScore5 INT, playerScore6 INT, playerScore7 INT, playerScore8 INT, playerScore9 INT)  AS $$
	SELECT auto_id, gameId, participantId, win, item0, item1, item2, item3, item4, item5, item6, kills, deaths, assists, largestKillingSpree, largestMultiKill, killingSpree, longestTimeSpentLiving, doubleKills, tripleKills, quadraKills, pentaKills, unrealKills, totalDamageDealt, magicDamageDealt, physicalDamageDealt, ruteDamageDealt, largestCriticalStrike, totalDamageDealtToChampions, magicDamageDealtToChampions, physicalDamageDealtToChampions, trueDamageDealtToChampions, totalHeal, totalUnitsHealed, damageSelfMitigated, damageDealtToObjectives, damageDealtToTurrets, visionScore, timeCCingOthers, totalDamageTaken, magicalDamageTaken, physicalDamageTaken, trueDamageTaken, goldEarned, goldSpent, turretKills, inhibitorKills, totalMinionsKilled, neutralMinionsKilled, neutralMinionsKilledTeamJungle, neutralMinionsKilledEnemyJungle, totalTimeCrowdControlDealt, champLevel, visionWardsBoughtInGame, sightWardsBoughtInGame, wardsPlaced, wardsKilled, firstBloodKill, firstBloodAssist, firstTowerKill, firstTowerAssist, firstInhibitorKill, firstInhibitorAssist, combatPlayerScore, objectivePlayerScore, totalPlayerScore, totalScoreRank, playerScore0, playerScore1, playerScore2, playerScore3, playerScore4, playerScore5, playerScore6, playerScore7, playerScore8, playerScore9
	FROM GameStatsParticipantStats
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameStatsParticipantStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameStatsParticipantStats" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameStatsParticipantStats WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameStatsParticipantStats-------------------

DROP FUNCTION IF EXISTS "addGameStatTeams" (gameId TEXT, teamId INT, win BOOLEAN, firstBlood BOOLEAN, firstTower BOOLEAN, firstInhibitor BOOLEAN, firstBaron BOOLEAN, firstDragon BOOLEAN, firstRiftHerald BOOLEAN, towerKills INT, inhibitorKills INT, baronKils INT, dragonKills INT, vilemawKills INT, riftHeraldKills INT, dominionVictoryScore INT);
CREATE OR REPLACE FUNCTION "addGameStatTeams" (gameId TEXT, teamId INT, win BOOLEAN, firstBlood BOOLEAN, firstTower BOOLEAN, firstInhibitor BOOLEAN, firstBaron BOOLEAN, firstDragon BOOLEAN, firstRiftHerald BOOLEAN, towerKills INT, inhibitorKills INT, baronKils INT, dragonKills INT, vilemawKills INT, riftHeraldKills INT, dominionVictoryScore INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameStatTeams
		WHERE
			GameStatTeams.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameStatTeams (gameId, teamId, win, firstBlood, firstTower, firstInhibitor, firstBaron, firstDragon, firstRiftHerald, towerKills, inhibitorKills, baronKils, dragonKills, vilemawKills, riftHeraldKills, dominionVictoryScore)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameStatTeams" (auto_id INT, gameId TEXT, teamId INT, win BOOLEAN, firstBlood BOOLEAN, firstTower BOOLEAN, firstInhibitor BOOLEAN, firstBaron BOOLEAN, firstDragon BOOLEAN, firstRiftHerald BOOLEAN, towerKills INT, inhibitorKills INT, baronKils INT, dragonKills INT, vilemawKills INT, riftHeraldKills INT, dominionVictoryScore INT);
CREATE OR REPLACE FUNCTION "editGameStatTeams" (auto_id INT, gameId TEXT, teamId INT, win BOOLEAN, firstBlood BOOLEAN, firstTower BOOLEAN, firstInhibitor BOOLEAN, firstBaron BOOLEAN, firstDragon BOOLEAN, firstRiftHerald BOOLEAN, towerKills INT, inhibitorKills INT, baronKils INT, dragonKills INT, vilemawKills INT, riftHeraldKills INT, dominionVictoryScore INT)
	RETURNS VOID
AS $$
UPDATE
	GameStatTeams
SET 	gameId=$2, teamId=$3, win=$4, firstBlood=$5, firstTower=$6, firstInhibitor=$7, firstBaron=$8, firstDragon=$9, firstRiftHerald=$10, towerKills=$11, inhibitorKills=$12, baronKils=$13, dragonKills=$14, vilemawKills=$15, riftHeraldKills=$16, dominionVictoryScore=$17
	WHERE id=GameStatTeams.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameStatTeams" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameStatTeams" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, teamId INT, win BOOLEAN, firstBlood BOOLEAN, firstTower BOOLEAN, firstInhibitor BOOLEAN, firstBaron BOOLEAN, firstDragon BOOLEAN, firstRiftHerald BOOLEAN, towerKills INT, inhibitorKills INT, baronKils INT, dragonKills INT, vilemawKills INT, riftHeraldKills INT, dominionVictoryScore INT)
AS $$
SELECT auto_id, gameId, teamId, win, firstBlood, firstTower, firstInhibitor, firstBaron, firstDragon, firstRiftHerald, towerKills, inhibitorKills, baronKils, dragonKills, vilemawKills, riftHeraldKills, dominionVictoryScore
FROM
	GameStatTeams
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameStatTeams"();
CREATE OR REPLACE FUNCTION "getAllGameStatTeams"()
RETURNS TABLE(auto_id INT, gameId TEXT, teamId INT, win BOOLEAN, firstBlood BOOLEAN, firstTower BOOLEAN, firstInhibitor BOOLEAN, firstBaron BOOLEAN, firstDragon BOOLEAN, firstRiftHerald BOOLEAN, towerKills INT, inhibitorKills INT, baronKils INT, dragonKills INT, vilemawKills INT, riftHeraldKills INT, dominionVictoryScore INT)  AS $$
	SELECT auto_id, gameId, teamId, win, firstBlood, firstTower, firstInhibitor, firstBaron, firstDragon, firstRiftHerald, towerKills, inhibitorKills, baronKils, dragonKills, vilemawKills, riftHeraldKills, dominionVictoryScore
	FROM GameStatTeams
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameStatTeams" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameStatTeams" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameStatTeams WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameStatTeams-------------------

DROP FUNCTION IF EXISTS "addChampionStats" (championId INT, patch TEXT, hp INT, hpPerLevel INT, mp INT, mpPerLevel INT, moveSpeed INT, armor INT, armorPerLevel NUMERIC, spellBlock NUMERIC, spellBlockPerLevel NUMERIC, attackRange NUMERIC, hpRegen NUMERIC, hpRegenPerLevel NUMERIC, mpRegen NUMERIC, mpRegenPerLevel NUMERIC, crit NUMERIC, critPerLevel NUMERIC, attackDamage NUMERIC, attackSpeedOffset NUMERIC, attackSpeedPerLevel NUMERIC);
CREATE OR REPLACE FUNCTION "addChampionStats" (championId INT, patch TEXT, hp INT, hpPerLevel INT, mp INT, mpPerLevel INT, moveSpeed INT, armor INT, armorPerLevel NUMERIC, spellBlock NUMERIC, spellBlockPerLevel NUMERIC, attackRange NUMERIC, hpRegen NUMERIC, hpRegenPerLevel NUMERIC, mpRegen NUMERIC, mpRegenPerLevel NUMERIC, crit NUMERIC, critPerLevel NUMERIC, attackDamage NUMERIC, attackSpeedOffset NUMERIC, attackSpeedPerLevel NUMERIC)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionStats
		WHERE
			ChampionStats.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionStats (championId, patch, hp, hpPerLevel, mp, mpPerLevel, moveSpeed, armor, armorPerLevel, spellBlock, spellBlockPerLevel, attackRange, hpRegen, hpRegenPerLevel, mpRegen, mpRegenPerLevel, crit, critPerLevel, attackDamage, attackSpeedOffset, attackSpeedPerLevel)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionStats" (auto_id INT, championId INT, patch TEXT, hp INT, hpPerLevel INT, mp INT, mpPerLevel INT, moveSpeed INT, armor INT, armorPerLevel NUMERIC, spellBlock NUMERIC, spellBlockPerLevel NUMERIC, attackRange NUMERIC, hpRegen NUMERIC, hpRegenPerLevel NUMERIC, mpRegen NUMERIC, mpRegenPerLevel NUMERIC, crit NUMERIC, critPerLevel NUMERIC, attackDamage NUMERIC, attackSpeedOffset NUMERIC, attackSpeedPerLevel NUMERIC);
CREATE OR REPLACE FUNCTION "editChampionStats" (auto_id INT, championId INT, patch TEXT, hp INT, hpPerLevel INT, mp INT, mpPerLevel INT, moveSpeed INT, armor INT, armorPerLevel NUMERIC, spellBlock NUMERIC, spellBlockPerLevel NUMERIC, attackRange NUMERIC, hpRegen NUMERIC, hpRegenPerLevel NUMERIC, mpRegen NUMERIC, mpRegenPerLevel NUMERIC, crit NUMERIC, critPerLevel NUMERIC, attackDamage NUMERIC, attackSpeedOffset NUMERIC, attackSpeedPerLevel NUMERIC)
	RETURNS VOID
AS $$
UPDATE
	ChampionStats
SET 	championId=$2, patch=$3, hp=$4, hpPerLevel=$5, mp=$6, mpPerLevel=$7, moveSpeed=$8, armor=$9, armorPerLevel=$10, spellBlock=$11, spellBlockPerLevel=$12, attackRange=$13, hpRegen=$14, hpRegenPerLevel=$15, mpRegen=$16, mpRegenPerLevel=$17, crit=$18, critPerLevel=$19, attackDamage=$20, attackSpeedOffset=$21, attackSpeedPerLevel=$22
	WHERE id=ChampionStats.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionStats" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, hp INT, hpPerLevel INT, mp INT, mpPerLevel INT, moveSpeed INT, armor INT, armorPerLevel NUMERIC, spellBlock NUMERIC, spellBlockPerLevel NUMERIC, attackRange NUMERIC, hpRegen NUMERIC, hpRegenPerLevel NUMERIC, mpRegen NUMERIC, mpRegenPerLevel NUMERIC, crit NUMERIC, critPerLevel NUMERIC, attackDamage NUMERIC, attackSpeedOffset NUMERIC, attackSpeedPerLevel NUMERIC)
AS $$
SELECT auto_id, championId, patch, hp, hpPerLevel, mp, mpPerLevel, moveSpeed, armor, armorPerLevel, spellBlock, spellBlockPerLevel, attackRange, hpRegen, hpRegenPerLevel, mpRegen, mpRegenPerLevel, crit, critPerLevel, attackDamage, attackSpeedOffset, attackSpeedPerLevel
FROM
	ChampionStats
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionStats"();
CREATE OR REPLACE FUNCTION "getAllChampionStats"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, hp INT, hpPerLevel INT, mp INT, mpPerLevel INT, moveSpeed INT, armor INT, armorPerLevel NUMERIC, spellBlock NUMERIC, spellBlockPerLevel NUMERIC, attackRange NUMERIC, hpRegen NUMERIC, hpRegenPerLevel NUMERIC, mpRegen NUMERIC, mpRegenPerLevel NUMERIC, crit NUMERIC, critPerLevel NUMERIC, attackDamage NUMERIC, attackSpeedOffset NUMERIC, attackSpeedPerLevel NUMERIC)  AS $$
	SELECT auto_id, championId, patch, hp, hpPerLevel, mp, mpPerLevel, moveSpeed, armor, armorPerLevel, spellBlock, spellBlockPerLevel, attackRange, hpRegen, hpRegenPerLevel, mpRegen, mpRegenPerLevel, crit, critPerLevel, attackDamage, attackSpeedOffset, attackSpeedPerLevel
	FROM ChampionStats
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionStats" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionStats WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionStats-------------------

DROP FUNCTION IF EXISTS "addTournamentBracketTypes" (tournamentId TEXT, bracketId TEXT, type TEXT, rounds INT);
CREATE OR REPLACE FUNCTION "addTournamentBracketTypes" (tournamentId TEXT, bracketId TEXT, type TEXT, rounds INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TournamentBracketTypes
		WHERE
			TournamentBracketTypes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TournamentBracketTypes (tournamentId, bracketId, type, rounds)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournamentBracketTypes" (auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, rounds INT);
CREATE OR REPLACE FUNCTION "editTournamentBracketTypes" (auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, rounds INT)
	RETURNS VOID
AS $$
UPDATE
	TournamentBracketTypes
SET 	tournamentId=$2, bracketId=$3, type=$4, rounds=$5
	WHERE id=TournamentBracketTypes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTournamentBracketTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTournamentBracketTypes" (auto_id INT)
	RETURNS TABLE (auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, rounds INT)
AS $$
SELECT auto_id, tournamentId, bracketId, type, rounds
FROM
	TournamentBracketTypes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTournamentBracketTypes"();
CREATE OR REPLACE FUNCTION "getAllTournamentBracketTypes"()
RETURNS TABLE(auto_id INT, tournamentId TEXT, bracketId TEXT, type TEXT, rounds INT)  AS $$
	SELECT auto_id, tournamentId, bracketId, type, rounds
	FROM TournamentBracketTypes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournamentBracketTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTournamentBracketTypes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TournamentBracketTypes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TournamentBracketTypes-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventItemPurchased" (gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventItemPurchased" (gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventItemPurchased
		WHERE
			GameTimelineFrameEventItemPurchased.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventItemPurchased (gameId, type, _timestamp, itemId, participantId)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventItemPurchased" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventItemPurchased" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventItemPurchased
SET 	gameId=$2, type=$3, _timestamp=$4, itemId=$5, participantId=$6
	WHERE id=GameTimelineFrameEventItemPurchased.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventItemPurchased" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventItemPurchased" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
AS $$
SELECT auto_id, gameId, type, _timestamp, itemId, participantId
FROM
	GameTimelineFrameEventItemPurchased
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventItemPurchased"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventItemPurchased"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, itemId, participantId
	FROM GameTimelineFrameEventItemPurchased
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventItemPurchased" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventItemPurchased" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventItemPurchased WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventItemPurchased-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventWardTypes" (wardType TEXT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventWardTypes" (wardType TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventWardTypes
		WHERE
			GameTimelineFrameEventWardTypes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventWardTypes (wardType)
		VALUES ($1)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventWardTypes" (auto_id INT, wardType TEXT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventWardTypes" (auto_id INT, wardType TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventWardTypes
SET 	wardType=$2
	WHERE id=GameTimelineFrameEventWardTypes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventWardTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventWardTypes" (auto_id INT)
	RETURNS TABLE (auto_id INT, wardType TEXT)
AS $$
SELECT auto_id, wardType
FROM
	GameTimelineFrameEventWardTypes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventWardTypes"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventWardTypes"()
RETURNS TABLE(auto_id INT, wardType TEXT)  AS $$
	SELECT auto_id, wardType
	FROM GameTimelineFrameEventWardTypes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventWardTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventWardTypes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventWardTypes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventWardTypes-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventBuildingKillAssists" (gameId TEXT, buildingKillEvent INT, assistingParticipantId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventBuildingKillAssists" (gameId TEXT, buildingKillEvent INT, assistingParticipantId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventBuildingKillAssists
		WHERE
			GameTimelineFrameEventBuildingKillAssists.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventBuildingKillAssists (gameId, buildingKillEvent, assistingParticipantId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventBuildingKillAssists" (auto_id INT, gameId TEXT, buildingKillEvent INT, assistingParticipantId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventBuildingKillAssists" (auto_id INT, gameId TEXT, buildingKillEvent INT, assistingParticipantId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventBuildingKillAssists
SET 	gameId=$2, buildingKillEvent=$3, assistingParticipantId=$4
	WHERE id=GameTimelineFrameEventBuildingKillAssists.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventBuildingKillAssists" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventBuildingKillAssists" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, buildingKillEvent INT, assistingParticipantId INT)
AS $$
SELECT auto_id, gameId, buildingKillEvent, assistingParticipantId
FROM
	GameTimelineFrameEventBuildingKillAssists
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventBuildingKillAssists"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventBuildingKillAssists"()
RETURNS TABLE(auto_id INT, gameId TEXT, buildingKillEvent INT, assistingParticipantId INT)  AS $$
	SELECT auto_id, gameId, buildingKillEvent, assistingParticipantId
	FROM GameTimelineFrameEventBuildingKillAssists
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventBuildingKillAssists" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventBuildingKillAssists" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventBuildingKillAssists WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventBuildingKillAssists-------------------

DROP FUNCTION IF EXISTS "addChampionAllyTips" (championId INT, patch TEXT, languageCode TEXT, tip TEXT);
CREATE OR REPLACE FUNCTION "addChampionAllyTips" (championId INT, patch TEXT, languageCode TEXT, tip TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionAllyTips
		WHERE
			ChampionAllyTips.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionAllyTips (championId, patch, languageCode, tip)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionAllyTips" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT);
CREATE OR REPLACE FUNCTION "editChampionAllyTips" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionAllyTips
SET 	championId=$2, patch=$3, languageCode=$4, tip=$5
	WHERE id=ChampionAllyTips.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionAllyTips" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionAllyTips" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, tip
FROM
	ChampionAllyTips
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionAllyTips"();
CREATE OR REPLACE FUNCTION "getAllChampionAllyTips"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, tip
	FROM ChampionAllyTips
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionAllyTips" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionAllyTips" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionAllyTips WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionAllyTips-------------------

DROP FUNCTION IF EXISTS "addTeamPlayers" (teamId INT, playerId INT);
CREATE OR REPLACE FUNCTION "addTeamPlayers" (teamId INT, playerId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamPlayers
		WHERE
			TeamPlayers.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamPlayers (teamId, playerId)
		VALUES ($1, $2)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamPlayers" (auto_id INT, teamId INT, playerId INT);
CREATE OR REPLACE FUNCTION "editTeamPlayers" (auto_id INT, teamId INT, playerId INT)
	RETURNS VOID
AS $$
UPDATE
	TeamPlayers
SET 	teamId=$2, playerId=$3
	WHERE id=TeamPlayers.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamPlayers" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamPlayers" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, playerId INT)
AS $$
SELECT auto_id, teamId, playerId
FROM
	TeamPlayers
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamPlayers"();
CREATE OR REPLACE FUNCTION "getAllTeamPlayers"()
RETURNS TABLE(auto_id INT, teamId INT, playerId INT)  AS $$
	SELECT auto_id, teamId, playerId
	FROM TeamPlayers
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamPlayers" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamPlayers" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamPlayers WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamPlayers-------------------

DROP FUNCTION IF EXISTS "addChampionInfos" (championId INT, patch TEXT, attack INT, defense INT, magic INT, dificulty INT);
CREATE OR REPLACE FUNCTION "addChampionInfos" (championId INT, patch TEXT, attack INT, defense INT, magic INT, dificulty INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionInfos
		WHERE
			ChampionInfos.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionInfos (championId, patch, attack, defense, magic, dificulty)
		VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionInfos" (auto_id INT, championId INT, patch TEXT, attack INT, defense INT, magic INT, dificulty INT);
CREATE OR REPLACE FUNCTION "editChampionInfos" (auto_id INT, championId INT, patch TEXT, attack INT, defense INT, magic INT, dificulty INT)
	RETURNS VOID
AS $$
UPDATE
	ChampionInfos
SET 	championId=$2, patch=$3, attack=$4, defense=$5, magic=$6, dificulty=$7
	WHERE id=ChampionInfos.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionInfos" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionInfos" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, attack INT, defense INT, magic INT, dificulty INT)
AS $$
SELECT auto_id, championId, patch, attack, defense, magic, dificulty
FROM
	ChampionInfos
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionInfos"();
CREATE OR REPLACE FUNCTION "getAllChampionInfos"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, attack INT, defense INT, magic INT, dificulty INT)  AS $$
	SELECT auto_id, championId, patch, attack, defense, magic, dificulty
	FROM ChampionInfos
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionInfos" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionInfos" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionInfos WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionInfos-------------------

DROP FUNCTION IF EXISTS "addTeamBios" (teamId INT, languageCode TEXT, bio TEXT);
CREATE OR REPLACE FUNCTION "addTeamBios" (teamId INT, languageCode TEXT, bio TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamBios
		WHERE
			TeamBios.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamBios (teamId, languageCode, bio)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamBios" (auto_id INT, teamId INT, languageCode TEXT, bio TEXT);
CREATE OR REPLACE FUNCTION "editTeamBios" (auto_id INT, teamId INT, languageCode TEXT, bio TEXT)
	RETURNS VOID
AS $$
UPDATE
	TeamBios
SET 	teamId=$2, languageCode=$3, bio=$4
	WHERE id=TeamBios.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamBios" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamBios" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, languageCode TEXT, bio TEXT)
AS $$
SELECT auto_id, teamId, languageCode, bio
FROM
	TeamBios
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamBios"();
CREATE OR REPLACE FUNCTION "getAllTeamBios"()
RETURNS TABLE(auto_id INT, teamId INT, languageCode TEXT, bio TEXT)  AS $$
	SELECT auto_id, teamId, languageCode, bio
	FROM TeamBios
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamBios" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamBios" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamBios WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamBios-------------------

DROP FUNCTION IF EXISTS "addTeamRosterStatsChampions" (teamId INT, playerId INT, championId INT);
CREATE OR REPLACE FUNCTION "addTeamRosterStatsChampions" (teamId INT, playerId INT, championId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamRosterStatsChampions
		WHERE
			TeamRosterStatsChampions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamRosterStatsChampions (teamId, playerId, championId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamRosterStatsChampions" (auto_id INT, teamId INT, playerId INT, championId INT);
CREATE OR REPLACE FUNCTION "editTeamRosterStatsChampions" (auto_id INT, teamId INT, playerId INT, championId INT)
	RETURNS VOID
AS $$
UPDATE
	TeamRosterStatsChampions
SET 	teamId=$2, playerId=$3, championId=$4
	WHERE id=TeamRosterStatsChampions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamRosterStatsChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamRosterStatsChampions" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, playerId INT, championId INT)
AS $$
SELECT auto_id, teamId, playerId, championId
FROM
	TeamRosterStatsChampions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamRosterStatsChampions"();
CREATE OR REPLACE FUNCTION "getAllTeamRosterStatsChampions"()
RETURNS TABLE(auto_id INT, teamId INT, playerId INT, championId INT)  AS $$
	SELECT auto_id, teamId, playerId, championId
	FROM TeamRosterStatsChampions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamRosterStatsChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamRosterStatsChampions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamRosterStatsChampions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamRosterStatsChampions-------------------

DROP FUNCTION IF EXISTS "addTournamentBracketRosters" (tournamentId TEXT, bracketId TEXT, roster TEXT);
CREATE OR REPLACE FUNCTION "addTournamentBracketRosters" (tournamentId TEXT, bracketId TEXT, roster TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TournamentBracketRosters
		WHERE
			TournamentBracketRosters.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TournamentBracketRosters (tournamentId, bracketId, roster)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournamentBracketRosters" (auto_id INT, tournamentId TEXT, bracketId TEXT, roster TEXT);
CREATE OR REPLACE FUNCTION "editTournamentBracketRosters" (auto_id INT, tournamentId TEXT, bracketId TEXT, roster TEXT)
	RETURNS VOID
AS $$
UPDATE
	TournamentBracketRosters
SET 	tournamentId=$2, bracketId=$3, roster=$4
	WHERE id=TournamentBracketRosters.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTournamentBracketRosters" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTournamentBracketRosters" (auto_id INT)
	RETURNS TABLE (auto_id INT, tournamentId TEXT, bracketId TEXT, roster TEXT)
AS $$
SELECT auto_id, tournamentId, bracketId, roster
FROM
	TournamentBracketRosters
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTournamentBracketRosters"();
CREATE OR REPLACE FUNCTION "getAllTournamentBracketRosters"()
RETURNS TABLE(auto_id INT, tournamentId TEXT, bracketId TEXT, roster TEXT)  AS $$
	SELECT auto_id, tournamentId, bracketId, roster
	FROM TournamentBracketRosters
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournamentBracketRosters" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTournamentBracketRosters" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TournamentBracketRosters WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TournamentBracketRosters-------------------

DROP FUNCTION IF EXISTS "addRunesReforgedRuneLongDescriptions" (runesReforgedRuneId INT, patch TEXT, languageCode TEXT, longDescription TEXT);
CREATE OR REPLACE FUNCTION "addRunesReforgedRuneLongDescriptions" (runesReforgedRuneId INT, patch TEXT, languageCode TEXT, longDescription TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RunesReforgedRuneLongDescriptions
		WHERE
			RunesReforgedRuneLongDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RunesReforgedRuneLongDescriptions (runesReforgedRuneId, patch, languageCode, longDescription)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRunesReforgedRuneLongDescriptions" (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, longDescription TEXT);
CREATE OR REPLACE FUNCTION "editRunesReforgedRuneLongDescriptions" (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, longDescription TEXT)
	RETURNS VOID
AS $$
UPDATE
	RunesReforgedRuneLongDescriptions
SET 	runesReforgedRuneId=$2, patch=$3, languageCode=$4, longDescription=$5
	WHERE id=RunesReforgedRuneLongDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRunesReforgedRuneLongDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRunesReforgedRuneLongDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, longDescription TEXT)
AS $$
SELECT auto_id, runesReforgedRuneId, patch, languageCode, longDescription
FROM
	RunesReforgedRuneLongDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRunesReforgedRuneLongDescriptions"();
CREATE OR REPLACE FUNCTION "getAllRunesReforgedRuneLongDescriptions"()
RETURNS TABLE(auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, longDescription TEXT)  AS $$
	SELECT auto_id, runesReforgedRuneId, patch, languageCode, longDescription
	FROM RunesReforgedRuneLongDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRunesReforgedRuneLongDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRunesReforgedRuneLongDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RunesReforgedRuneLongDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RunesReforgedRuneLongDescriptions-------------------

DROP FUNCTION IF EXISTS "addTournaments" (id TEXT, title TEXT, tournamentDescription TEXT, leagueId INT);
CREATE OR REPLACE FUNCTION "addTournaments" (id TEXT, title TEXT, tournamentDescription TEXT, leagueId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Tournaments
		WHERE
			Tournaments.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Tournaments (id, title, tournamentDescription, leagueId)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournaments" (auto_id INT, id TEXT, title TEXT, tournamentDescription TEXT, leagueId INT);
CREATE OR REPLACE FUNCTION "editTournaments" (auto_id INT, id TEXT, title TEXT, tournamentDescription TEXT, leagueId INT)
	RETURNS VOID
AS $$
UPDATE
	Tournaments
SET 	id=$2, title=$3, tournamentDescription=$4, leagueId=$5
	WHERE id=Tournaments.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTournaments" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTournaments" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, title TEXT, tournamentDescription TEXT, leagueId INT)
AS $$
SELECT auto_id, id, title, tournamentDescription, leagueId
FROM
	Tournaments
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTournaments"();
CREATE OR REPLACE FUNCTION "getAllTournaments"()
RETURNS TABLE(auto_id INT, id TEXT, title TEXT, tournamentDescription TEXT, leagueId INT)  AS $$
	SELECT auto_id, id, title, tournamentDescription, leagueId
	FROM Tournaments
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournaments" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTournaments" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Tournaments WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Tournaments-------------------

DROP FUNCTION IF EXISTS "addPlayerSocialNetworks " (playerId INT, networkName TEXT, url TEXT);
CREATE OR REPLACE FUNCTION "addPlayerSocialNetworks " (playerId INT, networkName TEXT, url TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			PlayerSocialNetworks 
		WHERE
			PlayerSocialNetworks .auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO PlayerSocialNetworks  (playerId, networkName, url)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayerSocialNetworks " (auto_id INT, playerId INT, networkName TEXT, url TEXT);
CREATE OR REPLACE FUNCTION "editPlayerSocialNetworks " (auto_id INT, playerId INT, networkName TEXT, url TEXT)
	RETURNS VOID
AS $$
UPDATE
	PlayerSocialNetworks 
SET 	playerId=$2, networkName=$3, url=$4
	WHERE id=PlayerSocialNetworks .auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayerSocialNetworks " (auto_id INT);
CREATE OR REPLACE FUNCTION "getPlayerSocialNetworks " (auto_id INT)
	RETURNS TABLE (auto_id INT, playerId INT, networkName TEXT, url TEXT)
AS $$
SELECT auto_id, playerId, networkName, url
FROM
	PlayerSocialNetworks 
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPlayerSocialNetworks "();
CREATE OR REPLACE FUNCTION "getAllPlayerSocialNetworks "()
RETURNS TABLE(auto_id INT, playerId INT, networkName TEXT, url TEXT)  AS $$
	SELECT auto_id, playerId, networkName, url
	FROM PlayerSocialNetworks 
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayerSocialNetworks " (auto_id INT);
CREATE OR REPLACE FUNCTION "deletePlayerSocialNetworks " (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM PlayerSocialNetworks  WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------PlayerSocialNetworks -------------------

DROP FUNCTION IF EXISTS "addChampionSquareImages" (championId INT, patch TEXT, imageURL TEXT);
CREATE OR REPLACE FUNCTION "addChampionSquareImages" (championId INT, patch TEXT, imageURL TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSquareImages
		WHERE
			ChampionSquareImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSquareImages (championId, patch, imageURL)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSquareImages" (auto_id INT, championId INT, patch TEXT, imageURL TEXT);
CREATE OR REPLACE FUNCTION "editChampionSquareImages" (auto_id INT, championId INT, patch TEXT, imageURL TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSquareImages
SET 	championId=$2, patch=$3, imageURL=$4
	WHERE id=ChampionSquareImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSquareImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSquareImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, imageURL TEXT)
AS $$
SELECT auto_id, championId, patch, imageURL
FROM
	ChampionSquareImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSquareImages"();
CREATE OR REPLACE FUNCTION "getAllChampionSquareImages"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, imageURL TEXT)  AS $$
	SELECT auto_id, championId, patch, imageURL
	FROM ChampionSquareImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSquareImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSquareImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSquareImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSquareImages-------------------

DROP FUNCTION IF EXISTS "addPlayerStatsHistories" (id TEXT, playerId INT, championId INT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, csPerTenMinutes NUMERIC, kdaRatio NUMERIC, killParticipation INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT);
CREATE OR REPLACE FUNCTION "addPlayerStatsHistories" (id TEXT, playerId INT, championId INT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, csPerTenMinutes NUMERIC, kdaRatio NUMERIC, killParticipation INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			PlayerStatsHistories
		WHERE
			PlayerStatsHistories.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO PlayerStatsHistories (id, playerId, championId, _timestamp, assists, deaths, kills, csPerTenMinutes, kdaRatio, killParticipation, win, matchId, teamId, opponentTeamId, gameId)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayerStatsHistories" (auto_id INT, id TEXT, playerId INT, championId INT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, csPerTenMinutes NUMERIC, kdaRatio NUMERIC, killParticipation INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT);
CREATE OR REPLACE FUNCTION "editPlayerStatsHistories" (auto_id INT, id TEXT, playerId INT, championId INT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, csPerTenMinutes NUMERIC, kdaRatio NUMERIC, killParticipation INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)
	RETURNS VOID
AS $$
UPDATE
	PlayerStatsHistories
SET 	id=$2, playerId=$3, championId=$4, _timestamp=$5, assists=$6, deaths=$7, kills=$8, csPerTenMinutes=$9, kdaRatio=$10, killParticipation=$11, win=$12, matchId=$13, teamId=$14, opponentTeamId=$15, gameId=$16
	WHERE id=PlayerStatsHistories.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayerStatsHistories" (auto_id INT);
CREATE OR REPLACE FUNCTION "getPlayerStatsHistories" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, playerId INT, championId INT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, csPerTenMinutes NUMERIC, kdaRatio NUMERIC, killParticipation INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)
AS $$
SELECT auto_id, id, playerId, championId, _timestamp, assists, deaths, kills, csPerTenMinutes, kdaRatio, killParticipation, win, matchId, teamId, opponentTeamId, gameId
FROM
	PlayerStatsHistories
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPlayerStatsHistories"();
CREATE OR REPLACE FUNCTION "getAllPlayerStatsHistories"()
RETURNS TABLE(auto_id INT, id TEXT, playerId INT, championId INT, _timestamp NUMERIC, assists INT, deaths INT, kills INT, csPerTenMinutes NUMERIC, kdaRatio NUMERIC, killParticipation INT, win BOOLEAN, matchId TEXT, teamId INT, opponentTeamId INT, gameId TEXT)  AS $$
	SELECT auto_id, id, playerId, championId, _timestamp, assists, deaths, kills, csPerTenMinutes, kdaRatio, killParticipation, win, matchId, teamId, opponentTeamId, gameId
	FROM PlayerStatsHistories
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayerStatsHistories" (auto_id INT);
CREATE OR REPLACE FUNCTION "deletePlayerStatsHistories" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM PlayerStatsHistories WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------PlayerStatsHistories-------------------

DROP FUNCTION IF EXISTS "addTeamRosterStats" (teamId INT, playerId INT, gamesPlayed INT, averageAssists NUMERIC, averageDeaths NUMERIC, averageKills NUMERIC, averageKillParticipation NUMERIC, summonerName TEXT);
CREATE OR REPLACE FUNCTION "addTeamRosterStats" (teamId INT, playerId INT, gamesPlayed INT, averageAssists NUMERIC, averageDeaths NUMERIC, averageKills NUMERIC, averageKillParticipation NUMERIC, summonerName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamRosterStats
		WHERE
			TeamRosterStats.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamRosterStats (teamId, playerId, gamesPlayed, averageAssists, averageDeaths, averageKills, averageKillParticipation, summonerName)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamRosterStats" (auto_id INT, teamId INT, playerId INT, gamesPlayed INT, averageAssists NUMERIC, averageDeaths NUMERIC, averageKills NUMERIC, averageKillParticipation NUMERIC, summonerName TEXT);
CREATE OR REPLACE FUNCTION "editTeamRosterStats" (auto_id INT, teamId INT, playerId INT, gamesPlayed INT, averageAssists NUMERIC, averageDeaths NUMERIC, averageKills NUMERIC, averageKillParticipation NUMERIC, summonerName TEXT)
	RETURNS VOID
AS $$
UPDATE
	TeamRosterStats
SET 	teamId=$2, playerId=$3, gamesPlayed=$4, averageAssists=$5, averageDeaths=$6, averageKills=$7, averageKillParticipation=$8, summonerName=$9
	WHERE id=TeamRosterStats.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamRosterStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamRosterStats" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, playerId INT, gamesPlayed INT, averageAssists NUMERIC, averageDeaths NUMERIC, averageKills NUMERIC, averageKillParticipation NUMERIC, summonerName TEXT)
AS $$
SELECT auto_id, teamId, playerId, gamesPlayed, averageAssists, averageDeaths, averageKills, averageKillParticipation, summonerName
FROM
	TeamRosterStats
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamRosterStats"();
CREATE OR REPLACE FUNCTION "getAllTeamRosterStats"()
RETURNS TABLE(auto_id INT, teamId INT, playerId INT, gamesPlayed INT, averageAssists NUMERIC, averageDeaths NUMERIC, averageKills NUMERIC, averageKillParticipation NUMERIC, summonerName TEXT)  AS $$
	SELECT auto_id, teamId, playerId, gamesPlayed, averageAssists, averageDeaths, averageKills, averageKillParticipation, summonerName
	FROM TeamRosterStats
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamRosterStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamRosterStats" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamRosterStats WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamRosterStats-------------------

DROP FUNCTION IF EXISTS "addChampionNames" (championId INT, patch TEXT, languageCode TEXT, championName TEXT);
CREATE OR REPLACE FUNCTION "addChampionNames" (championId INT, patch TEXT, languageCode TEXT, championName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionNames
		WHERE
			ChampionNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionNames (championId, patch, languageCode, championName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionNames" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championName TEXT);
CREATE OR REPLACE FUNCTION "editChampionNames" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championName TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionNames
SET 	championId=$2, patch=$3, languageCode=$4, championName=$5
	WHERE id=ChampionNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championName TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, championName
FROM
	ChampionNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionNames"();
CREATE OR REPLACE FUNCTION "getAllChampionNames"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, championName TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, championName
	FROM ChampionNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionNames-------------------

DROP FUNCTION IF EXISTS "addSummonerSpellModes" (summonerId INT, patch TEXT, mode TEXT);
CREATE OR REPLACE FUNCTION "addSummonerSpellModes" (summonerId INT, patch TEXT, mode TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			SummonerSpellModes
		WHERE
			SummonerSpellModes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO SummonerSpellModes (summonerId, patch, mode)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editSummonerSpellModes" (auto_id INT, summonerId INT, patch TEXT, mode TEXT);
CREATE OR REPLACE FUNCTION "editSummonerSpellModes" (auto_id INT, summonerId INT, patch TEXT, mode TEXT)
	RETURNS VOID
AS $$
UPDATE
	SummonerSpellModes
SET 	summonerId=$2, patch=$3, mode=$4
	WHERE id=SummonerSpellModes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSummonerSpellModes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getSummonerSpellModes" (auto_id INT)
	RETURNS TABLE (auto_id INT, summonerId INT, patch TEXT, mode TEXT)
AS $$
SELECT auto_id, summonerId, patch, mode
FROM
	SummonerSpellModes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllSummonerSpellModes"();
CREATE OR REPLACE FUNCTION "getAllSummonerSpellModes"()
RETURNS TABLE(auto_id INT, summonerId INT, patch TEXT, mode TEXT)  AS $$
	SELECT auto_id, summonerId, patch, mode
	FROM SummonerSpellModes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteSummonerSpellModes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteSummonerSpellModes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM SummonerSpellModes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------SummonerSpellModes-------------------

DROP FUNCTION IF EXISTS "addChampionSkins" (id INT, championId INT, languageCode TEXT, championSkinsname TEXT, num INT, hasChromas BOOLEAN);
CREATE OR REPLACE FUNCTION "addChampionSkins" (id INT, championId INT, languageCode TEXT, championSkinsname TEXT, num INT, hasChromas BOOLEAN)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSkins
		WHERE
			ChampionSkins.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSkins (id, championId, languageCode, championSkinsname, num, hasChromas)
		VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSkins" (auto_id INT, id INT, championId INT, languageCode TEXT, championSkinsname TEXT, num INT, hasChromas BOOLEAN);
CREATE OR REPLACE FUNCTION "editChampionSkins" (auto_id INT, id INT, championId INT, languageCode TEXT, championSkinsname TEXT, num INT, hasChromas BOOLEAN)
	RETURNS VOID
AS $$
UPDATE
	ChampionSkins
SET 	id=$2, championId=$3, languageCode=$4, championSkinsname=$5, num=$6, hasChromas=$7
	WHERE id=ChampionSkins.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSkins" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSkins" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, championId INT, languageCode TEXT, championSkinsname TEXT, num INT, hasChromas BOOLEAN)
AS $$
SELECT auto_id, id, championId, languageCode, championSkinsname, num, hasChromas
FROM
	ChampionSkins
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSkins"();
CREATE OR REPLACE FUNCTION "getAllChampionSkins"()
RETURNS TABLE(auto_id INT, id INT, championId INT, languageCode TEXT, championSkinsname TEXT, num INT, hasChromas BOOLEAN)  AS $$
	SELECT auto_id, id, championId, languageCode, championSkinsname, num, hasChromas
	FROM ChampionSkins
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSkins" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSkins" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSkins WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSkins-------------------

DROP FUNCTION IF EXISTS "addChampionPassiveImages" (championId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addChampionPassiveImages" (championId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionPassiveImages
		WHERE
			ChampionPassiveImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionPassiveImages (championId, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionPassiveImages" (auto_id INT, championId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editChampionPassiveImages" (auto_id INT, championId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	ChampionPassiveImages
SET 	championId=$2, patch=$3, fullURL=$4, spriteURL=$5, x=$6, y=$7, w=$8, h=$9
	WHERE id=ChampionPassiveImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionPassiveImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionPassiveImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, championId, patch, fullURL, spriteURL, x, y, w, h
FROM
	ChampionPassiveImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionPassiveImages"();
CREATE OR REPLACE FUNCTION "getAllChampionPassiveImages"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, championId, patch, fullURL, spriteURL, x, y, w, h
	FROM ChampionPassiveImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionPassiveImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionPassiveImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionPassiveImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionPassiveImages-------------------

DROP FUNCTION IF EXISTS "addItemNames" (itemId INT, patch TEXT, languageCode TEXT, itemName TEXT);
CREATE OR REPLACE FUNCTION "addItemNames" (itemId INT, patch TEXT, languageCode TEXT, itemName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemNames
		WHERE
			ItemNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemNames (itemId, patch, languageCode, itemName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemNames" (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemName TEXT);
CREATE OR REPLACE FUNCTION "editItemNames" (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemName TEXT)
	RETURNS VOID
AS $$
UPDATE
	ItemNames
SET 	itemId=$2, patch=$3, languageCode=$4, itemName=$5
	WHERE id=ItemNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemName TEXT)
AS $$
SELECT auto_id, itemId, patch, languageCode, itemName
FROM
	ItemNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemNames"();
CREATE OR REPLACE FUNCTION "getAllItemNames"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemName TEXT)  AS $$
	SELECT auto_id, itemId, patch, languageCode, itemName
	FROM ItemNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemNames-------------------

DROP FUNCTION IF EXISTS "addItems" (patch TEXT, id INT, requiredChampion INT, inStore BOOLEAN, baseGold INT, purchasable BOOLEAN, totalGold INT, sellGold INT, hideFromAll BOOLEAN, specialRecipie INT);
CREATE OR REPLACE FUNCTION "addItems" (patch TEXT, id INT, requiredChampion INT, inStore BOOLEAN, baseGold INT, purchasable BOOLEAN, totalGold INT, sellGold INT, hideFromAll BOOLEAN, specialRecipie INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Items
		WHERE
			Items.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Items (patch, id, requiredChampion, inStore, baseGold, purchasable, totalGold, sellGold, hideFromAll, specialRecipie)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItems" (auto_id INT, patch TEXT, id INT, requiredChampion INT, inStore BOOLEAN, baseGold INT, purchasable BOOLEAN, totalGold INT, sellGold INT, hideFromAll BOOLEAN, specialRecipie INT);
CREATE OR REPLACE FUNCTION "editItems" (auto_id INT, patch TEXT, id INT, requiredChampion INT, inStore BOOLEAN, baseGold INT, purchasable BOOLEAN, totalGold INT, sellGold INT, hideFromAll BOOLEAN, specialRecipie INT)
	RETURNS VOID
AS $$
UPDATE
	Items
SET 	patch=$2, id=$3, requiredChampion=$4, inStore=$5, baseGold=$6, purchasable=$7, totalGold=$8, sellGold=$9, hideFromAll=$10, specialRecipie=$11
	WHERE id=Items.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItems" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItems" (auto_id INT)
	RETURNS TABLE (auto_id INT, patch TEXT, id INT, requiredChampion INT, inStore BOOLEAN, baseGold INT, purchasable BOOLEAN, totalGold INT, sellGold INT, hideFromAll BOOLEAN, specialRecipie INT)
AS $$
SELECT auto_id, patch, id, requiredChampion, inStore, baseGold, purchasable, totalGold, sellGold, hideFromAll, specialRecipie
FROM
	Items
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItems"();
CREATE OR REPLACE FUNCTION "getAllItems"()
RETURNS TABLE(auto_id INT, patch TEXT, id INT, requiredChampion INT, inStore BOOLEAN, baseGold INT, purchasable BOOLEAN, totalGold INT, sellGold INT, hideFromAll BOOLEAN, specialRecipie INT)  AS $$
	SELECT auto_id, patch, id, requiredChampion, inStore, baseGold, purchasable, totalGold, sellGold, hideFromAll, specialRecipie
	FROM Items
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItems" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItems" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Items WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Items-------------------

DROP FUNCTION IF EXISTS "addChampionPassiveDescriptions" (championId INT, patch TEXT, languageCode TEXT, ChampionPassiveDescription TEXT);
CREATE OR REPLACE FUNCTION "addChampionPassiveDescriptions" (championId INT, patch TEXT, languageCode TEXT, ChampionPassiveDescription TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionPassiveDescriptions
		WHERE
			ChampionPassiveDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionPassiveDescriptions (championId, patch, languageCode, ChampionPassiveDescription)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionPassiveDescriptions" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, ChampionPassiveDescription TEXT);
CREATE OR REPLACE FUNCTION "editChampionPassiveDescriptions" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, ChampionPassiveDescription TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionPassiveDescriptions
SET 	championId=$2, patch=$3, languageCode=$4, ChampionPassiveDescription=$5
	WHERE id=ChampionPassiveDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionPassiveDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionPassiveDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, ChampionPassiveDescription TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, ChampionPassiveDescription
FROM
	ChampionPassiveDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionPassiveDescriptions"();
CREATE OR REPLACE FUNCTION "getAllChampionPassiveDescriptions"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, ChampionPassiveDescription TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, ChampionPassiveDescription
	FROM ChampionPassiveDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionPassiveDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionPassiveDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionPassiveDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionPassiveDescriptions-------------------

DROP FUNCTION IF EXISTS "addChampionSpellEffects" (championId INT, spellId INT, patch TEXT, effectIndex INT, effectBurnValue TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpellEffects" (championId INT, spellId INT, patch TEXT, effectIndex INT, effectBurnValue TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellEffects
		WHERE
			ChampionSpellEffects.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellEffects (championId, spellId, patch, effectIndex, effectBurnValue)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellEffects" (auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effectBurnValue TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpellEffects" (auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effectBurnValue TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellEffects
SET 	championId=$2, spellId=$3, patch=$4, effectIndex=$5, effectBurnValue=$6
	WHERE id=ChampionSpellEffects.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellEffects" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellEffects" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effectBurnValue TEXT)
AS $$
SELECT auto_id, championId, spellId, patch, effectIndex, effectBurnValue
FROM
	ChampionSpellEffects
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellEffects"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellEffects"()
RETURNS TABLE(auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effectBurnValue TEXT)  AS $$
	SELECT auto_id, championId, spellId, patch, effectIndex, effectBurnValue
	FROM ChampionSpellEffects
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellEffects" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellEffects" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellEffects WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellEffects-------------------

DROP FUNCTION IF EXISTS "addChampionSprites" (championId INT, patch TEXT, imageURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addChampionSprites" (championId INT, patch TEXT, imageURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSprites
		WHERE
			ChampionSprites.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSprites (championId, patch, imageURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSprites" (auto_id INT, championId INT, patch TEXT, imageURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editChampionSprites" (auto_id INT, championId INT, patch TEXT, imageURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSprites
SET 	championId=$2, patch=$3, imageURL=$4, x=$5, y=$6, w=$7, h=$8
	WHERE id=ChampionSprites.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSprites" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSprites" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, imageURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, championId, patch, imageURL, x, y, w, h
FROM
	ChampionSprites
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSprites"();
CREATE OR REPLACE FUNCTION "getAllChampionSprites"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, imageURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, championId, patch, imageURL, x, y, w, h
	FROM ChampionSprites
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSprites" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSprites" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSprites WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSprites-------------------

DROP FUNCTION IF EXISTS "addGameTimelines" (gameId TEXT, frameInterval INT);
CREATE OR REPLACE FUNCTION "addGameTimelines" (gameId TEXT, frameInterval INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelines
		WHERE
			GameTimelines.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelines (gameId, frameInterval)
		VALUES ($1, $2)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelines" (auto_id INT, gameId TEXT, frameInterval INT);
CREATE OR REPLACE FUNCTION "editGameTimelines" (auto_id INT, gameId TEXT, frameInterval INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelines
SET 	gameId=$2, frameInterval=$3
	WHERE id=GameTimelines.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelines" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelines" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, frameInterval INT)
AS $$
SELECT auto_id, gameId, frameInterval
FROM
	GameTimelines
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelines"();
CREATE OR REPLACE FUNCTION "getAllGameTimelines"()
RETURNS TABLE(auto_id INT, gameId TEXT, frameInterval INT)  AS $$
	SELECT auto_id, gameId, frameInterval
	FROM GameTimelines
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelines" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelines" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelines WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelines-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventSkillLevelUp" (gameId TEXT, type TEXT, _timestamp INT, skillSlot INT, participantId INT, levelUpType TEXT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventSkillLevelUp" (gameId TEXT, type TEXT, _timestamp INT, skillSlot INT, participantId INT, levelUpType TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventSkillLevelUp
		WHERE
			GameTimelineFrameEventSkillLevelUp.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventSkillLevelUp (gameId, type, _timestamp, skillSlot, participantId, levelUpType)
		VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventSkillLevelUp" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, skillSlot INT, participantId INT, levelUpType TEXT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventSkillLevelUp" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, skillSlot INT, participantId INT, levelUpType TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventSkillLevelUp
SET 	gameId=$2, type=$3, _timestamp=$4, skillSlot=$5, participantId=$6, levelUpType=$7
	WHERE id=GameTimelineFrameEventSkillLevelUp.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventSkillLevelUp" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventSkillLevelUp" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, skillSlot INT, participantId INT, levelUpType TEXT)
AS $$
SELECT auto_id, gameId, type, _timestamp, skillSlot, participantId, levelUpType
FROM
	GameTimelineFrameEventSkillLevelUp
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventSkillLevelUp"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventSkillLevelUp"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, skillSlot INT, participantId INT, levelUpType TEXT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, skillSlot, participantId, levelUpType
	FROM GameTimelineFrameEventSkillLevelUp
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventSkillLevelUp" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventSkillLevelUp" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventSkillLevelUp WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventSkillLevelUp-------------------

DROP FUNCTION IF EXISTS "addItemBuildIntos" (itemId INT, patch TEXT, intoItemId INT);
CREATE OR REPLACE FUNCTION "addItemBuildIntos" (itemId INT, patch TEXT, intoItemId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemBuildIntos
		WHERE
			ItemBuildIntos.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemBuildIntos (itemId, patch, intoItemId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemBuildIntos" (auto_id INT, itemId INT, patch TEXT, intoItemId INT);
CREATE OR REPLACE FUNCTION "editItemBuildIntos" (auto_id INT, itemId INT, patch TEXT, intoItemId INT)
	RETURNS VOID
AS $$
UPDATE
	ItemBuildIntos
SET 	itemId=$2, patch=$3, intoItemId=$4
	WHERE id=ItemBuildIntos.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemBuildIntos" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemBuildIntos" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, intoItemId INT)
AS $$
SELECT auto_id, itemId, patch, intoItemId
FROM
	ItemBuildIntos
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemBuildIntos"();
CREATE OR REPLACE FUNCTION "getAllItemBuildIntos"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, intoItemId INT)  AS $$
	SELECT auto_id, itemId, patch, intoItemId
	FROM ItemBuildIntos
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemBuildIntos" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemBuildIntos" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemBuildIntos WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemBuildIntos-------------------

DROP FUNCTION IF EXISTS "addLeagues" (id INT, gId TEXT, leagueName TEXT, logoURL TEXT);
CREATE OR REPLACE FUNCTION "addLeagues" (id INT, gId TEXT, leagueName TEXT, logoURL TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Leagues
		WHERE
			Leagues.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Leagues (id, gId, leagueName, logoURL)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLeagues" (auto_id INT, id INT, gId TEXT, leagueName TEXT, logoURL TEXT);
CREATE OR REPLACE FUNCTION "editLeagues" (auto_id INT, id INT, gId TEXT, leagueName TEXT, logoURL TEXT)
	RETURNS VOID
AS $$
UPDATE
	Leagues
SET 	id=$2, gId=$3, leagueName=$4, logoURL=$5
	WHERE id=Leagues.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLeagues" (auto_id INT);
CREATE OR REPLACE FUNCTION "getLeagues" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, gId TEXT, leagueName TEXT, logoURL TEXT)
AS $$
SELECT auto_id, id, gId, leagueName, logoURL
FROM
	Leagues
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllLeagues"();
CREATE OR REPLACE FUNCTION "getAllLeagues"()
RETURNS TABLE(auto_id INT, id INT, gId TEXT, leagueName TEXT, logoURL TEXT)  AS $$
	SELECT auto_id, id, gId, leagueName, logoURL
	FROM Leagues
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLeagues" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteLeagues" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Leagues WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Leagues-------------------

DROP FUNCTION IF EXISTS "addVideos" (id INT, tournamentId TEXT, gameId TEXT, matchId TEXT, url TEXT, locale TEXT);
CREATE OR REPLACE FUNCTION "addVideos" (id INT, tournamentId TEXT, gameId TEXT, matchId TEXT, url TEXT, locale TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Videos
		WHERE
			Videos.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Videos (id, tournamentId, gameId, matchId, url, locale)
		VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editVideos" (auto_id INT, id INT, tournamentId TEXT, gameId TEXT, matchId TEXT, url TEXT, locale TEXT);
CREATE OR REPLACE FUNCTION "editVideos" (auto_id INT, id INT, tournamentId TEXT, gameId TEXT, matchId TEXT, url TEXT, locale TEXT)
	RETURNS VOID
AS $$
UPDATE
	Videos
SET 	id=$2, tournamentId=$3, gameId=$4, matchId=$5, url=$6, locale=$7
	WHERE id=Videos.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getVideos" (auto_id INT);
CREATE OR REPLACE FUNCTION "getVideos" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, tournamentId TEXT, gameId TEXT, matchId TEXT, url TEXT, locale TEXT)
AS $$
SELECT auto_id, id, tournamentId, gameId, matchId, url, locale
FROM
	Videos
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllVideos"();
CREATE OR REPLACE FUNCTION "getAllVideos"()
RETURNS TABLE(auto_id INT, id INT, tournamentId TEXT, gameId TEXT, matchId TEXT, url TEXT, locale TEXT)  AS $$
	SELECT auto_id, id, tournamentId, gameId, matchId, url, locale
	FROM Videos
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteVideos" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteVideos" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Videos WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Videos-------------------

DROP FUNCTION IF EXISTS "addMasteryDescriptions" (masteryId INT, patch TEXT, languageCode TEXT, masteryDescription TEXT, descriptionIndex INT);
CREATE OR REPLACE FUNCTION "addMasteryDescriptions" (masteryId INT, patch TEXT, languageCode TEXT, masteryDescription TEXT, descriptionIndex INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			MasteryDescriptions
		WHERE
			MasteryDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO MasteryDescriptions (masteryId, patch, languageCode, masteryDescription, descriptionIndex)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMasteryDescriptions" (auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryDescription TEXT, descriptionIndex INT);
CREATE OR REPLACE FUNCTION "editMasteryDescriptions" (auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryDescription TEXT, descriptionIndex INT)
	RETURNS VOID
AS $$
UPDATE
	MasteryDescriptions
SET 	masteryId=$2, patch=$3, languageCode=$4, masteryDescription=$5, descriptionIndex=$6
	WHERE id=MasteryDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getMasteryDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getMasteryDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryDescription TEXT, descriptionIndex INT)
AS $$
SELECT auto_id, masteryId, patch, languageCode, masteryDescription, descriptionIndex
FROM
	MasteryDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllMasteryDescriptions"();
CREATE OR REPLACE FUNCTION "getAllMasteryDescriptions"()
RETURNS TABLE(auto_id INT, masteryId INT, patch TEXT, languageCode TEXT, masteryDescription TEXT, descriptionIndex INT)  AS $$
	SELECT auto_id, masteryId, patch, languageCode, masteryDescription, descriptionIndex
	FROM MasteryDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMasteryDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteMasteryDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM MasteryDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------MasteryDescriptions-------------------

DROP FUNCTION IF EXISTS "addTeamSubs" (teamId INT, playerId INT);
CREATE OR REPLACE FUNCTION "addTeamSubs" (teamId INT, playerId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamSubs
		WHERE
			TeamSubs.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamSubs (teamId, playerId)
		VALUES ($1, $2)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamSubs" (auto_id INT, teamId INT, playerId INT);
CREATE OR REPLACE FUNCTION "editTeamSubs" (auto_id INT, teamId INT, playerId INT)
	RETURNS VOID
AS $$
UPDATE
	TeamSubs
SET 	teamId=$2, playerId=$3
	WHERE id=TeamSubs.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamSubs" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamSubs" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, playerId INT)
AS $$
SELECT auto_id, teamId, playerId
FROM
	TeamSubs
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamSubs"();
CREATE OR REPLACE FUNCTION "getAllTeamSubs"()
RETURNS TABLE(auto_id INT, teamId INT, playerId INT)  AS $$
	SELECT auto_id, teamId, playerId
	FROM TeamSubs
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamSubs" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamSubs" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamSubs WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamSubs-------------------

DROP FUNCTION IF EXISTS "addLeagueTournamentRecords" (id TEXT, tournamentId TEXT, bracketId TEXT, roster TEXT, wins INT, losses INT, ties INT, score INT);
CREATE OR REPLACE FUNCTION "addLeagueTournamentRecords" (id TEXT, tournamentId TEXT, bracketId TEXT, roster TEXT, wins INT, losses INT, ties INT, score INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			LeagueTournamentRecords
		WHERE
			LeagueTournamentRecords.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO LeagueTournamentRecords (id, tournamentId, bracketId, roster, wins, losses, ties, score)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLeagueTournamentRecords" (auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, roster TEXT, wins INT, losses INT, ties INT, score INT);
CREATE OR REPLACE FUNCTION "editLeagueTournamentRecords" (auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, roster TEXT, wins INT, losses INT, ties INT, score INT)
	RETURNS VOID
AS $$
UPDATE
	LeagueTournamentRecords
SET 	id=$2, tournamentId=$3, bracketId=$4, roster=$5, wins=$6, losses=$7, ties=$8, score=$9
	WHERE id=LeagueTournamentRecords.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLeagueTournamentRecords" (auto_id INT);
CREATE OR REPLACE FUNCTION "getLeagueTournamentRecords" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, roster TEXT, wins INT, losses INT, ties INT, score INT)
AS $$
SELECT auto_id, id, tournamentId, bracketId, roster, wins, losses, ties, score
FROM
	LeagueTournamentRecords
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllLeagueTournamentRecords"();
CREATE OR REPLACE FUNCTION "getAllLeagueTournamentRecords"()
RETURNS TABLE(auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, roster TEXT, wins INT, losses INT, ties INT, score INT)  AS $$
	SELECT auto_id, id, tournamentId, bracketId, roster, wins, losses, ties, score
	FROM LeagueTournamentRecords
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLeagueTournamentRecords" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteLeagueTournamentRecords" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM LeagueTournamentRecords WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------LeagueTournamentRecords-------------------

DROP FUNCTION IF EXISTS "addRuneStats" (runeId INT, patch TEXT, stat INT, statValue NUMERIC);
CREATE OR REPLACE FUNCTION "addRuneStats" (runeId INT, patch TEXT, stat INT, statValue NUMERIC)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RuneStats
		WHERE
			RuneStats.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RuneStats (runeId, patch, stat, statValue)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRuneStats" (auto_id INT, runeId INT, patch TEXT, stat INT, statValue NUMERIC);
CREATE OR REPLACE FUNCTION "editRuneStats" (auto_id INT, runeId INT, patch TEXT, stat INT, statValue NUMERIC)
	RETURNS VOID
AS $$
UPDATE
	RuneStats
SET 	runeId=$2, patch=$3, stat=$4, statValue=$5
	WHERE id=RuneStats.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRuneStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRuneStats" (auto_id INT)
	RETURNS TABLE (auto_id INT, runeId INT, patch TEXT, stat INT, statValue NUMERIC)
AS $$
SELECT auto_id, runeId, patch, stat, statValue
FROM
	RuneStats
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRuneStats"();
CREATE OR REPLACE FUNCTION "getAllRuneStats"()
RETURNS TABLE(auto_id INT, runeId INT, patch TEXT, stat INT, statValue NUMERIC)  AS $$
	SELECT auto_id, runeId, patch, stat, statValue
	FROM RuneStats
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRuneStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRuneStats" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RuneStats WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RuneStats-------------------

DROP FUNCTION IF EXISTS "addRunesReforgedName" (runesReforgedId INT, patch TEXT, languageCode TEXT, runesReforgedName TEXT);
CREATE OR REPLACE FUNCTION "addRunesReforgedName" (runesReforgedId INT, patch TEXT, languageCode TEXT, runesReforgedName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RunesReforgedName
		WHERE
			RunesReforgedName.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RunesReforgedName (runesReforgedId, patch, languageCode, runesReforgedName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRunesReforgedName" (auto_id INT, runesReforgedId INT, patch TEXT, languageCode TEXT, runesReforgedName TEXT);
CREATE OR REPLACE FUNCTION "editRunesReforgedName" (auto_id INT, runesReforgedId INT, patch TEXT, languageCode TEXT, runesReforgedName TEXT)
	RETURNS VOID
AS $$
UPDATE
	RunesReforgedName
SET 	runesReforgedId=$2, patch=$3, languageCode=$4, runesReforgedName=$5
	WHERE id=RunesReforgedName.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRunesReforgedName" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRunesReforgedName" (auto_id INT)
	RETURNS TABLE (auto_id INT, runesReforgedId INT, patch TEXT, languageCode TEXT, runesReforgedName TEXT)
AS $$
SELECT auto_id, runesReforgedId, patch, languageCode, runesReforgedName
FROM
	RunesReforgedName
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRunesReforgedName"();
CREATE OR REPLACE FUNCTION "getAllRunesReforgedName"()
RETURNS TABLE(auto_id INT, runesReforgedId INT, patch TEXT, languageCode TEXT, runesReforgedName TEXT)  AS $$
	SELECT auto_id, runesReforgedId, patch, languageCode, runesReforgedName
	FROM RunesReforgedName
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRunesReforgedName" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRunesReforgedName" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RunesReforgedName WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RunesReforgedName-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameParticipantFrames" (gameId TEXT, participantId INT, xPosition INT, yPosition INT, currentGold INT, totalGold INT, level INT, xp INT, minionsKilled INT, jungleMinionsKilled INT, dominionScore INT, teamScore INT, _timestamp INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameParticipantFrames" (gameId TEXT, participantId INT, xPosition INT, yPosition INT, currentGold INT, totalGold INT, level INT, xp INT, minionsKilled INT, jungleMinionsKilled INT, dominionScore INT, teamScore INT, _timestamp INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameParticipantFrames
		WHERE
			GameTimelineFrameParticipantFrames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameParticipantFrames (gameId, participantId, xPosition, yPosition, currentGold, totalGold, level, xp, minionsKilled, jungleMinionsKilled, dominionScore, teamScore, _timestamp)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameParticipantFrames" (auto_id INT, gameId TEXT, participantId INT, xPosition INT, yPosition INT, currentGold INT, totalGold INT, level INT, xp INT, minionsKilled INT, jungleMinionsKilled INT, dominionScore INT, teamScore INT, _timestamp INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameParticipantFrames" (auto_id INT, gameId TEXT, participantId INT, xPosition INT, yPosition INT, currentGold INT, totalGold INT, level INT, xp INT, minionsKilled INT, jungleMinionsKilled INT, dominionScore INT, teamScore INT, _timestamp INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameParticipantFrames
SET 	gameId=$2, participantId=$3, xPosition=$4, yPosition=$5, currentGold=$6, totalGold=$7, level=$8, xp=$9, minionsKilled=$10, jungleMinionsKilled=$11, dominionScore=$12, teamScore=$13, _timestamp=$14
	WHERE id=GameTimelineFrameParticipantFrames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameParticipantFrames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameParticipantFrames" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, participantId INT, xPosition INT, yPosition INT, currentGold INT, totalGold INT, level INT, xp INT, minionsKilled INT, jungleMinionsKilled INT, dominionScore INT, teamScore INT, _timestamp INT)
AS $$
SELECT auto_id, gameId, participantId, xPosition, yPosition, currentGold, totalGold, level, xp, minionsKilled, jungleMinionsKilled, dominionScore, teamScore, _timestamp
FROM
	GameTimelineFrameParticipantFrames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameParticipantFrames"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameParticipantFrames"()
RETURNS TABLE(auto_id INT, gameId TEXT, participantId INT, xPosition INT, yPosition INT, currentGold INT, totalGold INT, level INT, xp INT, minionsKilled INT, jungleMinionsKilled INT, dominionScore INT, teamScore INT, _timestamp INT)  AS $$
	SELECT auto_id, gameId, participantId, xPosition, yPosition, currentGold, totalGold, level, xp, minionsKilled, jungleMinionsKilled, dominionScore, teamScore, _timestamp
	FROM GameTimelineFrameParticipantFrames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameParticipantFrames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameParticipantFrames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameParticipantFrames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameParticipantFrames-------------------

DROP FUNCTION IF EXISTS "addRunes" (id INT, patch TEXT, tier INT, type TEXT, colloq TEXT, plaintext TEXT);
CREATE OR REPLACE FUNCTION "addRunes" (id INT, patch TEXT, tier INT, type TEXT, colloq TEXT, plaintext TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Runes
		WHERE
			Runes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Runes (id, patch, tier, type, colloq, plaintext)
		VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRunes" (auto_id INT, id INT, patch TEXT, tier INT, type TEXT, colloq TEXT, plaintext TEXT);
CREATE OR REPLACE FUNCTION "editRunes" (auto_id INT, id INT, patch TEXT, tier INT, type TEXT, colloq TEXT, plaintext TEXT)
	RETURNS VOID
AS $$
UPDATE
	Runes
SET 	id=$2, patch=$3, tier=$4, type=$5, colloq=$6, plaintext=$7
	WHERE id=Runes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRunes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRunes" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, patch TEXT, tier INT, type TEXT, colloq TEXT, plaintext TEXT)
AS $$
SELECT auto_id, id, patch, tier, type, colloq, plaintext
FROM
	Runes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRunes"();
CREATE OR REPLACE FUNCTION "getAllRunes"()
RETURNS TABLE(auto_id INT, id INT, patch TEXT, tier INT, type TEXT, colloq TEXT, plaintext TEXT)  AS $$
	SELECT auto_id, id, patch, tier, type, colloq, plaintext
	FROM Runes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRunes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRunes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Runes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Runes-------------------

DROP FUNCTION IF EXISTS "addItemPlaintexts" (itemId INT, patch TEXT, languageCode TEXT, plaintext TEXT);
CREATE OR REPLACE FUNCTION "addItemPlaintexts" (itemId INT, patch TEXT, languageCode TEXT, plaintext TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemPlaintexts
		WHERE
			ItemPlaintexts.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemPlaintexts (itemId, patch, languageCode, plaintext)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemPlaintexts" (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, plaintext TEXT);
CREATE OR REPLACE FUNCTION "editItemPlaintexts" (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, plaintext TEXT)
	RETURNS VOID
AS $$
UPDATE
	ItemPlaintexts
SET 	itemId=$2, patch=$3, languageCode=$4, plaintext=$5
	WHERE id=ItemPlaintexts.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemPlaintexts" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemPlaintexts" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, plaintext TEXT)
AS $$
SELECT auto_id, itemId, patch, languageCode, plaintext
FROM
	ItemPlaintexts
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemPlaintexts"();
CREATE OR REPLACE FUNCTION "getAllItemPlaintexts"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, languageCode TEXT, plaintext TEXT)  AS $$
	SELECT auto_id, itemId, patch, languageCode, plaintext
	FROM ItemPlaintexts
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemPlaintexts" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemPlaintexts" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemPlaintexts WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemPlaintexts-------------------

DROP FUNCTION IF EXISTS "addChampionSplashImages" (championId INT, patch TEXT, skinId INT, imageURL TEXT);
CREATE OR REPLACE FUNCTION "addChampionSplashImages" (championId INT, patch TEXT, skinId INT, imageURL TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSplashImages
		WHERE
			ChampionSplashImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSplashImages (championId, patch, skinId, imageURL)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSplashImages" (auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT);
CREATE OR REPLACE FUNCTION "editChampionSplashImages" (auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSplashImages
SET 	championId=$2, patch=$3, skinId=$4, imageURL=$5
	WHERE id=ChampionSplashImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSplashImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSplashImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT)
AS $$
SELECT auto_id, championId, patch, skinId, imageURL
FROM
	ChampionSplashImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSplashImages"();
CREATE OR REPLACE FUNCTION "getAllChampionSplashImages"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT)  AS $$
	SELECT auto_id, championId, patch, skinId, imageURL
	FROM ChampionSplashImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSplashImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSplashImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSplashImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSplashImages-------------------

DROP FUNCTION IF EXISTS "addTeamStarters" (teamId INT, playerId INT);
CREATE OR REPLACE FUNCTION "addTeamStarters" (teamId INT, playerId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamStarters
		WHERE
			TeamStarters.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamStarters (teamId, playerId)
		VALUES ($1, $2)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamStarters" (auto_id INT, teamId INT, playerId INT);
CREATE OR REPLACE FUNCTION "editTeamStarters" (auto_id INT, teamId INT, playerId INT)
	RETURNS VOID
AS $$
UPDATE
	TeamStarters
SET 	teamId=$2, playerId=$3
	WHERE id=TeamStarters.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamStarters" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamStarters" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, playerId INT)
AS $$
SELECT auto_id, teamId, playerId
FROM
	TeamStarters
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamStarters"();
CREATE OR REPLACE FUNCTION "getAllTeamStarters"()
RETURNS TABLE(auto_id INT, teamId INT, playerId INT)  AS $$
	SELECT auto_id, teamId, playerId
	FROM TeamStarters
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamStarters" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamStarters" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamStarters WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamStarters-------------------

DROP FUNCTION IF EXISTS "addChampionBlurbs" (championId INT, patch TEXT, languageCode TEXT, blurb TEXT);
CREATE OR REPLACE FUNCTION "addChampionBlurbs" (championId INT, patch TEXT, languageCode TEXT, blurb TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionBlurbs
		WHERE
			ChampionBlurbs.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionBlurbs (championId, patch, languageCode, blurb)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionBlurbs" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, blurb TEXT);
CREATE OR REPLACE FUNCTION "editChampionBlurbs" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, blurb TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionBlurbs
SET 	championId=$2, patch=$3, languageCode=$4, blurb=$5
	WHERE id=ChampionBlurbs.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionBlurbs" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionBlurbs" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, blurb TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, blurb
FROM
	ChampionBlurbs
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionBlurbs"();
CREATE OR REPLACE FUNCTION "getAllChampionBlurbs"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, blurb TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, blurb
	FROM ChampionBlurbs
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionBlurbs" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionBlurbs" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionBlurbs WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionBlurbs-------------------

DROP FUNCTION IF EXISTS "addSummonerSpells" (id TEXT, patch TEXT, maxRank INT, cooldownBurn TEXT, costBurn TEXT, summonerLevel INT, costType TEXT, maxAmmo INT, rangeBurn TEXT, resource TEXT);
CREATE OR REPLACE FUNCTION "addSummonerSpells" (id TEXT, patch TEXT, maxRank INT, cooldownBurn TEXT, costBurn TEXT, summonerLevel INT, costType TEXT, maxAmmo INT, rangeBurn TEXT, resource TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			SummonerSpells
		WHERE
			SummonerSpells.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO SummonerSpells (id, patch, maxRank, cooldownBurn, costBurn, summonerLevel, costType, maxAmmo, rangeBurn, resource)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editSummonerSpells" (auto_id INT, id TEXT, patch TEXT, maxRank INT, cooldownBurn TEXT, costBurn TEXT, summonerLevel INT, costType TEXT, maxAmmo INT, rangeBurn TEXT, resource TEXT);
CREATE OR REPLACE FUNCTION "editSummonerSpells" (auto_id INT, id TEXT, patch TEXT, maxRank INT, cooldownBurn TEXT, costBurn TEXT, summonerLevel INT, costType TEXT, maxAmmo INT, rangeBurn TEXT, resource TEXT)
	RETURNS VOID
AS $$
UPDATE
	SummonerSpells
SET 	id=$2, patch=$3, maxRank=$4, cooldownBurn=$5, costBurn=$6, summonerLevel=$7, costType=$8, maxAmmo=$9, rangeBurn=$10, resource=$11
	WHERE id=SummonerSpells.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSummonerSpells" (auto_id INT);
CREATE OR REPLACE FUNCTION "getSummonerSpells" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, patch TEXT, maxRank INT, cooldownBurn TEXT, costBurn TEXT, summonerLevel INT, costType TEXT, maxAmmo INT, rangeBurn TEXT, resource TEXT)
AS $$
SELECT auto_id, id, patch, maxRank, cooldownBurn, costBurn, summonerLevel, costType, maxAmmo, rangeBurn, resource
FROM
	SummonerSpells
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllSummonerSpells"();
CREATE OR REPLACE FUNCTION "getAllSummonerSpells"()
RETURNS TABLE(auto_id INT, id TEXT, patch TEXT, maxRank INT, cooldownBurn TEXT, costBurn TEXT, summonerLevel INT, costType TEXT, maxAmmo INT, rangeBurn TEXT, resource TEXT)  AS $$
	SELECT auto_id, id, patch, maxRank, cooldownBurn, costBurn, summonerLevel, costType, maxAmmo, rangeBurn, resource
	FROM SummonerSpells
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteSummonerSpells" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteSummonerSpells" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM SummonerSpells WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------SummonerSpells-------------------

DROP FUNCTION IF EXISTS "addMaps" (id INT, patch TEXT, mapsName TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addMaps" (id INT, patch TEXT, mapsName TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Maps
		WHERE
			Maps.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Maps (id, patch, mapsName, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMaps" (auto_id INT, id INT, patch TEXT, mapsName TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editMaps" (auto_id INT, id INT, patch TEXT, mapsName TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	Maps
SET 	id=$2, patch=$3, mapsName=$4, fullURL=$5, spriteURL=$6, x=$7, y=$8, w=$9, h=$10
	WHERE id=Maps.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getMaps" (auto_id INT);
CREATE OR REPLACE FUNCTION "getMaps" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, patch TEXT, mapsName TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, id, patch, mapsName, fullURL, spriteURL, x, y, w, h
FROM
	Maps
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllMaps"();
CREATE OR REPLACE FUNCTION "getAllMaps"()
RETURNS TABLE(auto_id INT, id INT, patch TEXT, mapsName TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, id, patch, mapsName, fullURL, spriteURL, x, y, w, h
	FROM Maps
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMaps" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteMaps" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Maps WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Maps-------------------

DROP FUNCTION IF EXISTS "addSummonerSpellNames" (summonerId INT, patch TEXT, languageCode TEXT, summonerSpellName TEXT);
CREATE OR REPLACE FUNCTION "addSummonerSpellNames" (summonerId INT, patch TEXT, languageCode TEXT, summonerSpellName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			SummonerSpellNames
		WHERE
			SummonerSpellNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO SummonerSpellNames (summonerId, patch, languageCode, summonerSpellName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editSummonerSpellNames" (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpellName TEXT);
CREATE OR REPLACE FUNCTION "editSummonerSpellNames" (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpellName TEXT)
	RETURNS VOID
AS $$
UPDATE
	SummonerSpellNames
SET 	summonerId=$2, patch=$3, languageCode=$4, summonerSpellName=$5
	WHERE id=SummonerSpellNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSummonerSpellNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getSummonerSpellNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpellName TEXT)
AS $$
SELECT auto_id, summonerId, patch, languageCode, summonerSpellName
FROM
	SummonerSpellNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllSummonerSpellNames"();
CREATE OR REPLACE FUNCTION "getAllSummonerSpellNames"()
RETURNS TABLE(auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpellName TEXT)  AS $$
	SELECT auto_id, summonerId, patch, languageCode, summonerSpellName
	FROM SummonerSpellNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteSummonerSpellNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteSummonerSpellNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM SummonerSpellNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------SummonerSpellNames-------------------

DROP FUNCTION IF EXISTS "addChampionLoadingImages" (championId INT, patch TEXT, skinId INT, imageURL TEXT);
CREATE OR REPLACE FUNCTION "addChampionLoadingImages" (championId INT, patch TEXT, skinId INT, imageURL TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionLoadingImages
		WHERE
			ChampionLoadingImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionLoadingImages (championId, patch, skinId, imageURL)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionLoadingImages" (auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT);
CREATE OR REPLACE FUNCTION "editChampionLoadingImages" (auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionLoadingImages
SET 	championId=$2, patch=$3, skinId=$4, imageURL=$5
	WHERE id=ChampionLoadingImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionLoadingImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionLoadingImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT)
AS $$
SELECT auto_id, championId, patch, skinId, imageURL
FROM
	ChampionLoadingImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionLoadingImages"();
CREATE OR REPLACE FUNCTION "getAllChampionLoadingImages"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, skinId INT, imageURL TEXT)  AS $$
	SELECT auto_id, championId, patch, skinId, imageURL
	FROM ChampionLoadingImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionLoadingImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionLoadingImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionLoadingImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionLoadingImages-------------------

DROP FUNCTION IF EXISTS "addTournamentBrackets" (id TEXT, tournamentBracketsName TEXT, groupPosition INT, groupName TEXT);
CREATE OR REPLACE FUNCTION "addTournamentBrackets" (id TEXT, tournamentBracketsName TEXT, groupPosition INT, groupName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TournamentBrackets
		WHERE
			TournamentBrackets.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TournamentBrackets (id, tournamentBracketsName, groupPosition, groupName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournamentBrackets" (auto_id INT, id TEXT, tournamentBracketsName TEXT, groupPosition INT, groupName TEXT);
CREATE OR REPLACE FUNCTION "editTournamentBrackets" (auto_id INT, id TEXT, tournamentBracketsName TEXT, groupPosition INT, groupName TEXT)
	RETURNS VOID
AS $$
UPDATE
	TournamentBrackets
SET 	id=$2, tournamentBracketsName=$3, groupPosition=$4, groupName=$5
	WHERE id=TournamentBrackets.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTournamentBrackets" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTournamentBrackets" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, tournamentBracketsName TEXT, groupPosition INT, groupName TEXT)
AS $$
SELECT auto_id, id, tournamentBracketsName, groupPosition, groupName
FROM
	TournamentBrackets
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTournamentBrackets"();
CREATE OR REPLACE FUNCTION "getAllTournamentBrackets"()
RETURNS TABLE(auto_id INT, id TEXT, tournamentBracketsName TEXT, groupPosition INT, groupName TEXT)  AS $$
	SELECT auto_id, id, tournamentBracketsName, groupPosition, groupName
	FROM TournamentBrackets
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournamentBrackets" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTournamentBrackets" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TournamentBrackets WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TournamentBrackets-------------------

DROP FUNCTION IF EXISTS "addMatches" (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT);
CREATE OR REPLACE FUNCTION "addMatches" (id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Matches
		WHERE
			Matches.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Matches (id, tournamentId, bracketId, matchesName, position)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMatches" (auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT);
CREATE OR REPLACE FUNCTION "editMatches" (auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)
	RETURNS VOID
AS $$
UPDATE
	Matches
SET 	id=$2, tournamentId=$3, bracketId=$4, matchesName=$5, position=$6
	WHERE id=Matches.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getMatches" (auto_id INT);
CREATE OR REPLACE FUNCTION "getMatches" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)
AS $$
SELECT auto_id, id, tournamentId, bracketId, matchesName, position
FROM
	Matches
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllMatches"();
CREATE OR REPLACE FUNCTION "getAllMatches"()
RETURNS TABLE(auto_id INT, id TEXT, tournamentId TEXT, bracketId TEXT, matchesName TEXT, position INT)  AS $$
	SELECT auto_id, id, tournamentId, bracketId, matchesName, position
	FROM Matches
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMatches" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteMatches" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Matches WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Matches-------------------

DROP FUNCTION IF EXISTS "addChampionSpellDescriptions" (championId INT, patch TEXT, languageCode TEXT, championSpelldescription TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpellDescriptions" (championId INT, patch TEXT, languageCode TEXT, championSpelldescription TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellDescriptions
		WHERE
			ChampionSpellDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellDescriptions (championId, patch, languageCode, championSpelldescription)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellDescriptions" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championSpelldescription TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpellDescriptions" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championSpelldescription TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellDescriptions
SET 	championId=$2, patch=$3, languageCode=$4, championSpelldescription=$5
	WHERE id=ChampionSpellDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championSpelldescription TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, championSpelldescription
FROM
	ChampionSpellDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellDescriptions"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellDescriptions"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, championSpelldescription TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, championSpelldescription
	FROM ChampionSpellDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellDescriptions-------------------

DROP FUNCTION IF EXISTS "addChampionPassiveNames" (championId INT, patch TEXT, languageCode TEXT, championPassiveName TEXT);
CREATE OR REPLACE FUNCTION "addChampionPassiveNames" (championId INT, patch TEXT, languageCode TEXT, championPassiveName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionPassiveNames
		WHERE
			ChampionPassiveNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionPassiveNames (championId, patch, languageCode, championPassiveName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionPassiveNames" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championPassiveName TEXT);
CREATE OR REPLACE FUNCTION "editChampionPassiveNames" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championPassiveName TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionPassiveNames
SET 	championId=$2, patch=$3, languageCode=$4, championPassiveName=$5
	WHERE id=ChampionPassiveNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionPassiveNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionPassiveNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, championPassiveName TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, championPassiveName
FROM
	ChampionPassiveNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionPassiveNames"();
CREATE OR REPLACE FUNCTION "getAllChampionPassiveNames"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, championPassiveName TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, championPassiveName
	FROM ChampionPassiveNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionPassiveNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionPassiveNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionPassiveNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionPassiveNames-------------------

DROP FUNCTION IF EXISTS "addRunesReforgedRunes" (id INT, key TEXT, runesReforgedId INT, patch TEXT, slotIndex INT, iconURL TEXT);
CREATE OR REPLACE FUNCTION "addRunesReforgedRunes" (id INT, key TEXT, runesReforgedId INT, patch TEXT, slotIndex INT, iconURL TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RunesReforgedRunes
		WHERE
			RunesReforgedRunes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RunesReforgedRunes (id, key, runesReforgedId, patch, slotIndex, iconURL)
		VALUES ($1, $2, $3, $4, $5, $6)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRunesReforgedRunes" (auto_id INT, id INT, key TEXT, runesReforgedId INT, patch TEXT, slotIndex INT, iconURL TEXT);
CREATE OR REPLACE FUNCTION "editRunesReforgedRunes" (auto_id INT, id INT, key TEXT, runesReforgedId INT, patch TEXT, slotIndex INT, iconURL TEXT)
	RETURNS VOID
AS $$
UPDATE
	RunesReforgedRunes
SET 	id=$2, key=$3, runesReforgedId=$4, patch=$5, slotIndex=$6, iconURL=$7
	WHERE id=RunesReforgedRunes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRunesReforgedRunes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRunesReforgedRunes" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, key TEXT, runesReforgedId INT, patch TEXT, slotIndex INT, iconURL TEXT)
AS $$
SELECT auto_id, id, key, runesReforgedId, patch, slotIndex, iconURL
FROM
	RunesReforgedRunes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRunesReforgedRunes"();
CREATE OR REPLACE FUNCTION "getAllRunesReforgedRunes"()
RETURNS TABLE(auto_id INT, id INT, key TEXT, runesReforgedId INT, patch TEXT, slotIndex INT, iconURL TEXT)  AS $$
	SELECT auto_id, id, key, runesReforgedId, patch, slotIndex, iconURL
	FROM RunesReforgedRunes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRunesReforgedRunes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRunesReforgedRunes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RunesReforgedRunes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RunesReforgedRunes-------------------

DROP FUNCTION IF EXISTS "addRuneDescriptions" (runeId INT, patch TEXT, languageCode TEXT, runeDescriptionsName TEXT);
CREATE OR REPLACE FUNCTION "addRuneDescriptions" (runeId INT, patch TEXT, languageCode TEXT, runeDescriptionsName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RuneDescriptions
		WHERE
			RuneDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RuneDescriptions (runeId, patch, languageCode, runeDescriptionsName)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRuneDescriptions" (auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeDescriptionsName TEXT);
CREATE OR REPLACE FUNCTION "editRuneDescriptions" (auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeDescriptionsName TEXT)
	RETURNS VOID
AS $$
UPDATE
	RuneDescriptions
SET 	runeId=$2, patch=$3, languageCode=$4, runeDescriptionsName=$5
	WHERE id=RuneDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRuneDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRuneDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeDescriptionsName TEXT)
AS $$
SELECT auto_id, runeId, patch, languageCode, runeDescriptionsName
FROM
	RuneDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRuneDescriptions"();
CREATE OR REPLACE FUNCTION "getAllRuneDescriptions"()
RETURNS TABLE(auto_id INT, runeId INT, patch TEXT, languageCode TEXT, runeDescriptionsName TEXT)  AS $$
	SELECT auto_id, runeId, patch, languageCode, runeDescriptionsName
	FROM RuneDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRuneDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRuneDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RuneDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RuneDescriptions-------------------

DROP FUNCTION IF EXISTS "addGameStatsParticipants" (gameId TEXT, participantId INT, summonerName TEXT, profileIcon INT, teamId INT, championId INT, spell1Id INT, spell2Id INT);
CREATE OR REPLACE FUNCTION "addGameStatsParticipants" (gameId TEXT, participantId INT, summonerName TEXT, profileIcon INT, teamId INT, championId INT, spell1Id INT, spell2Id INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameStatsParticipants
		WHERE
			GameStatsParticipants.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameStatsParticipants (gameId, participantId, summonerName, profileIcon, teamId, championId, spell1Id, spell2Id)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameStatsParticipants" (auto_id INT, gameId TEXT, participantId INT, summonerName TEXT, profileIcon INT, teamId INT, championId INT, spell1Id INT, spell2Id INT);
CREATE OR REPLACE FUNCTION "editGameStatsParticipants" (auto_id INT, gameId TEXT, participantId INT, summonerName TEXT, profileIcon INT, teamId INT, championId INT, spell1Id INT, spell2Id INT)
	RETURNS VOID
AS $$
UPDATE
	GameStatsParticipants
SET 	gameId=$2, participantId=$3, summonerName=$4, profileIcon=$5, teamId=$6, championId=$7, spell1Id=$8, spell2Id=$9
	WHERE id=GameStatsParticipants.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameStatsParticipants" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameStatsParticipants" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, participantId INT, summonerName TEXT, profileIcon INT, teamId INT, championId INT, spell1Id INT, spell2Id INT)
AS $$
SELECT auto_id, gameId, participantId, summonerName, profileIcon, teamId, championId, spell1Id, spell2Id
FROM
	GameStatsParticipants
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameStatsParticipants"();
CREATE OR REPLACE FUNCTION "getAllGameStatsParticipants"()
RETURNS TABLE(auto_id INT, gameId TEXT, participantId INT, summonerName TEXT, profileIcon INT, teamId INT, championId INT, spell1Id INT, spell2Id INT)  AS $$
	SELECT auto_id, gameId, participantId, summonerName, profileIcon, teamId, championId, spell1Id, spell2Id
	FROM GameStatsParticipants
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameStatsParticipants" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameStatsParticipants" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameStatsParticipants WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameStatsParticipants-------------------

DROP FUNCTION IF EXISTS "addChampions" (patch TEXT, id INT, parType TEXT);
CREATE OR REPLACE FUNCTION "addChampions" (patch TEXT, id INT, parType TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Champions
		WHERE
			Champions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Champions (patch, id, parType)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampions" (auto_id INT, patch TEXT, id INT, parType TEXT);
CREATE OR REPLACE FUNCTION "editChampions" (auto_id INT, patch TEXT, id INT, parType TEXT)
	RETURNS VOID
AS $$
UPDATE
	Champions
SET 	patch=$2, id=$3, parType=$4
	WHERE id=Champions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampions" (auto_id INT)
	RETURNS TABLE (auto_id INT, patch TEXT, id INT, parType TEXT)
AS $$
SELECT auto_id, patch, id, parType
FROM
	Champions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampions"();
CREATE OR REPLACE FUNCTION "getAllChampions"()
RETURNS TABLE(auto_id INT, patch TEXT, id INT, parType TEXT)  AS $$
	SELECT auto_id, patch, id, parType
	FROM Champions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Champions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Champions-------------------

DROP FUNCTION IF EXISTS "addSummonerSpellTooltips" (summonerId INT, patch TEXT, languageCode TEXT, tooltip TEXT);
CREATE OR REPLACE FUNCTION "addSummonerSpellTooltips" (summonerId INT, patch TEXT, languageCode TEXT, tooltip TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			SummonerSpellTooltips
		WHERE
			SummonerSpellTooltips.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO SummonerSpellTooltips (summonerId, patch, languageCode, tooltip)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editSummonerSpellTooltips" (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, tooltip TEXT);
CREATE OR REPLACE FUNCTION "editSummonerSpellTooltips" (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, tooltip TEXT)
	RETURNS VOID
AS $$
UPDATE
	SummonerSpellTooltips
SET 	summonerId=$2, patch=$3, languageCode=$4, tooltip=$5
	WHERE id=SummonerSpellTooltips.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSummonerSpellTooltips" (auto_id INT);
CREATE OR REPLACE FUNCTION "getSummonerSpellTooltips" (auto_id INT)
	RETURNS TABLE (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, tooltip TEXT)
AS $$
SELECT auto_id, summonerId, patch, languageCode, tooltip
FROM
	SummonerSpellTooltips
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllSummonerSpellTooltips"();
CREATE OR REPLACE FUNCTION "getAllSummonerSpellTooltips"()
RETURNS TABLE(auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, tooltip TEXT)  AS $$
	SELECT auto_id, summonerId, patch, languageCode, tooltip
	FROM SummonerSpellTooltips
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteSummonerSpellTooltips" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteSummonerSpellTooltips" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM SummonerSpellTooltips WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------SummonerSpellTooltips-------------------

DROP FUNCTION IF EXISTS "addPlayerStatsSummaries" (playerId INT, kdsRatio NUMERIC, kdaRatioRank INT, csPerTenMinutes NUMERIC, csPerTenMinutesRank INT, killParticipation NUMERIC, killParticipationRank INT, mostPlayedChampionsId TEXT);
CREATE OR REPLACE FUNCTION "addPlayerStatsSummaries" (playerId INT, kdsRatio NUMERIC, kdaRatioRank INT, csPerTenMinutes NUMERIC, csPerTenMinutesRank INT, killParticipation NUMERIC, killParticipationRank INT, mostPlayedChampionsId TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			PlayerStatsSummaries
		WHERE
			PlayerStatsSummaries.id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO PlayerStatsSummaries (playerId, kdsRatio, kdaRatioRank, csPerTenMinutes, csPerTenMinutesRank, killParticipation, killParticipationRank, mostPlayedChampionsId)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING id INTO _id
		RETURN _id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayerStatsSummaries" (id INT, playerId INT, kdsRatio NUMERIC, kdaRatioRank INT, csPerTenMinutes NUMERIC, csPerTenMinutesRank INT, killParticipation NUMERIC, killParticipationRank INT, mostPlayedChampionsId TEXT);
CREATE OR REPLACE FUNCTION "editPlayerStatsSummaries" (id INT, playerId INT, kdsRatio NUMERIC, kdaRatioRank INT, csPerTenMinutes NUMERIC, csPerTenMinutesRank INT, killParticipation NUMERIC, killParticipationRank INT, mostPlayedChampionsId TEXT)
	RETURNS VOID
AS $$
UPDATE
	PlayerStatsSummaries
SET 	playerId=$2, kdsRatio=$3, kdaRatioRank=$4, csPerTenMinutes=$5, csPerTenMinutesRank=$6, killParticipation=$7, killParticipationRank=$8, mostPlayedChampionsId=$9
	WHERE id=PlayerStatsSummaries.id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayerStatsSummaries" (id INT);
CREATE OR REPLACE FUNCTION "getPlayerStatsSummaries" (id INT)
	RETURNS TABLE (id INT, playerId INT, kdsRatio NUMERIC, kdaRatioRank INT, csPerTenMinutes NUMERIC, csPerTenMinutesRank INT, killParticipation NUMERIC, killParticipationRank INT, mostPlayedChampionsId TEXT)
AS $$
SELECT id, playerId, kdsRatio, kdaRatioRank, csPerTenMinutes, csPerTenMinutesRank, killParticipation, killParticipationRank, mostPlayedChampionsId
FROM
	PlayerStatsSummaries
	WHERE id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPlayerStatsSummaries"();
CREATE OR REPLACE FUNCTION "getAllPlayerStatsSummaries"()
RETURNS TABLE(id INT, playerId INT, kdsRatio NUMERIC, kdaRatioRank INT, csPerTenMinutes NUMERIC, csPerTenMinutesRank INT, killParticipation NUMERIC, killParticipationRank INT, mostPlayedChampionsId TEXT)  AS $$
	SELECT id, playerId, kdsRatio, kdaRatioRank, csPerTenMinutes, csPerTenMinutesRank, killParticipation, killParticipationRank, mostPlayedChampionsId
	FROM PlayerStatsSummaries
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayerStatsSummaries" (id INT);
CREATE OR REPLACE FUNCTION "deletePlayerStatsSummaries" (id INT)
	RETURNS VOID
AS $$ DELETE FROM PlayerStatsSummaries WHERE id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------PlayerStatsSummaries-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventWardKill" (gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, killerId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventWardKill" (gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, killerId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventWardKill
		WHERE
			GameTimelineFrameEventWardKill.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventWardKill (gameId, type, _timestamp, wardType, killerId)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventWardKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, killerId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventWardKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, killerId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventWardKill
SET 	gameId=$2, type=$3, _timestamp=$4, wardType=$5, killerId=$6
	WHERE id=GameTimelineFrameEventWardKill.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventWardKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventWardKill" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, killerId INT)
AS $$
SELECT auto_id, gameId, type, _timestamp, wardType, killerId
FROM
	GameTimelineFrameEventWardKill
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventWardKill"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventWardKill"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, wardType TEXT, killerId INT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, wardType, killerId
	FROM GameTimelineFrameEventWardKill
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventWardKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventWardKill" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventWardKill WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventWardKill-------------------

DROP FUNCTION IF EXISTS "addChampionSpellNames" (championId INT, spellId INT, patch TEXT, languageCode TEXT, championSpellNamesName TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpellNames" (championId INT, spellId INT, patch TEXT, languageCode TEXT, championSpellNamesName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellNames
		WHERE
			ChampionSpellNames.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellNames (championId, spellId, patch, languageCode, championSpellNamesName)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellNames" (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, championSpellNamesName TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpellNames" (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, championSpellNamesName TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellNames
SET 	championId=$2, spellId=$3, patch=$4, languageCode=$5, championSpellNamesName=$6
	WHERE id=ChampionSpellNames.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellNames" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, championSpellNamesName TEXT)
AS $$
SELECT auto_id, championId, spellId, patch, languageCode, championSpellNamesName
FROM
	ChampionSpellNames
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellNames"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellNames"()
RETURNS TABLE(auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, championSpellNamesName TEXT)  AS $$
	SELECT auto_id, championId, spellId, patch, languageCode, championSpellNamesName
	FROM ChampionSpellNames
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellNames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellNames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellNames WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellNames-------------------

DROP FUNCTION IF EXISTS "addLanguageItems" (languageCode TEXT, patch TEXT, languageItem TEXT);
CREATE OR REPLACE FUNCTION "addLanguageItems" (languageCode TEXT, patch TEXT, languageItem TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			LanguageItems
		WHERE
			LanguageItems.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO LanguageItems (languageCode, patch, languageItem)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLanguageItems" (auto_id INT, languageCode TEXT, patch TEXT, languageItem TEXT);
CREATE OR REPLACE FUNCTION "editLanguageItems" (auto_id INT, languageCode TEXT, patch TEXT, languageItem TEXT)
	RETURNS VOID
AS $$
UPDATE
	LanguageItems
SET 	languageCode=$2, patch=$3, languageItem=$4
	WHERE id=LanguageItems.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLanguageItems" (auto_id INT);
CREATE OR REPLACE FUNCTION "getLanguageItems" (auto_id INT)
	RETURNS TABLE (auto_id INT, languageCode TEXT, patch TEXT, languageItem TEXT)
AS $$
SELECT auto_id, languageCode, patch, languageItem
FROM
	LanguageItems
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllLanguageItems"();
CREATE OR REPLACE FUNCTION "getAllLanguageItems"()
RETURNS TABLE(auto_id INT, languageCode TEXT, patch TEXT, languageItem TEXT)  AS $$
	SELECT auto_id, languageCode, patch, languageItem
	FROM LanguageItems
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLanguageItems" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteLanguageItems" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM LanguageItems WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------LanguageItems-------------------

DROP FUNCTION IF EXISTS "addChampionSpellTooltips" (championId INT, spellId INT, patch TEXT, languageCode TEXT, tooltip TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpellTooltips" (championId INT, spellId INT, patch TEXT, languageCode TEXT, tooltip TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellTooltips
		WHERE
			ChampionSpellTooltips.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellTooltips (championId, spellId, patch, languageCode, tooltip)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellTooltips" (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, tooltip TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpellTooltips" (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, tooltip TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellTooltips
SET 	championId=$2, spellId=$3, patch=$4, languageCode=$5, tooltip=$6
	WHERE id=ChampionSpellTooltips.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellTooltips" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellTooltips" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, tooltip TEXT)
AS $$
SELECT auto_id, championId, spellId, patch, languageCode, tooltip
FROM
	ChampionSpellTooltips
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellTooltips"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellTooltips"()
RETURNS TABLE(auto_id INT, championId INT, spellId INT, patch TEXT, languageCode TEXT, tooltip TEXT)  AS $$
	SELECT auto_id, championId, spellId, patch, languageCode, tooltip
	FROM ChampionSpellTooltips
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellTooltips" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellTooltips" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellTooltips WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellTooltips-------------------

DROP FUNCTION IF EXISTS "addSummonerSpellDescriptions" (summonerId INT, patch TEXT, languageCode TEXT, summonerSpelldescription TEXT);
CREATE OR REPLACE FUNCTION "addSummonerSpellDescriptions" (summonerId INT, patch TEXT, languageCode TEXT, summonerSpelldescription TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			SummonerSpellDescriptions
		WHERE
			SummonerSpellDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO SummonerSpellDescriptions (summonerId, patch, languageCode, summonerSpelldescription)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editSummonerSpellDescriptions" (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpelldescription TEXT);
CREATE OR REPLACE FUNCTION "editSummonerSpellDescriptions" (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpelldescription TEXT)
	RETURNS VOID
AS $$
UPDATE
	SummonerSpellDescriptions
SET 	summonerId=$2, patch=$3, languageCode=$4, summonerSpelldescription=$5
	WHERE id=SummonerSpellDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getSummonerSpellDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getSummonerSpellDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpelldescription TEXT)
AS $$
SELECT auto_id, summonerId, patch, languageCode, summonerSpelldescription
FROM
	SummonerSpellDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllSummonerSpellDescriptions"();
CREATE OR REPLACE FUNCTION "getAllSummonerSpellDescriptions"()
RETURNS TABLE(auto_id INT, summonerId INT, patch TEXT, languageCode TEXT, summonerSpelldescription TEXT)  AS $$
	SELECT auto_id, summonerId, patch, languageCode, summonerSpelldescription
	FROM SummonerSpellDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteSummonerSpellDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteSummonerSpellDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM SummonerSpellDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------SummonerSpellDescriptions-------------------

DROP FUNCTION IF EXISTS "addTournamentTeams" (id TEXT, TournamentTeamsName TEXT, teamId INT);
CREATE OR REPLACE FUNCTION "addTournamentTeams" (id TEXT, TournamentTeamsName TEXT, teamId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TournamentTeams
		WHERE
			TournamentTeams.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TournamentTeams (id, TournamentTeamsName, teamId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournamentTeams" (auto_id INT, id TEXT, TournamentTeamsName TEXT, teamId INT);
CREATE OR REPLACE FUNCTION "editTournamentTeams" (auto_id INT, id TEXT, TournamentTeamsName TEXT, teamId INT)
	RETURNS VOID
AS $$
UPDATE
	TournamentTeams
SET 	id=$2, TournamentTeamsName=$3, teamId=$4
	WHERE id=TournamentTeams.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTournamentTeams" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTournamentTeams" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, TournamentTeamsName TEXT, teamId INT)
AS $$
SELECT auto_id, id, TournamentTeamsName, teamId
FROM
	TournamentTeams
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTournamentTeams"();
CREATE OR REPLACE FUNCTION "getAllTournamentTeams"()
RETURNS TABLE(auto_id INT, id TEXT, TournamentTeamsName TEXT, teamId INT)  AS $$
	SELECT auto_id, id, TournamentTeamsName, teamId
	FROM TournamentTeams
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournamentTeams" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTournamentTeams" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TournamentTeams WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TournamentTeams-------------------

DROP FUNCTION IF EXISTS "addChampionSpells" (id TEXT, championId INT, patch TEXT, cooldownBurn TEXT, costBurn TEXT, costType TEXT, maxAmmo TEXT, rangeBurn TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpells" (id TEXT, championId INT, patch TEXT, cooldownBurn TEXT, costBurn TEXT, costType TEXT, maxAmmo TEXT, rangeBurn TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpells
		WHERE
			ChampionSpells.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpells (id, championId, patch, cooldownBurn, costBurn, costType, maxAmmo, rangeBurn)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpells" (auto_id INT, id TEXT, championId INT, patch TEXT, cooldownBurn TEXT, costBurn TEXT, costType TEXT, maxAmmo TEXT, rangeBurn TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpells" (auto_id INT, id TEXT, championId INT, patch TEXT, cooldownBurn TEXT, costBurn TEXT, costType TEXT, maxAmmo TEXT, rangeBurn TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpells
SET 	id=$2, championId=$3, patch=$4, cooldownBurn=$5, costBurn=$6, costType=$7, maxAmmo=$8, rangeBurn=$9
	WHERE id=ChampionSpells.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpells" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpells" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, championId INT, patch TEXT, cooldownBurn TEXT, costBurn TEXT, costType TEXT, maxAmmo TEXT, rangeBurn TEXT)
AS $$
SELECT auto_id, id, championId, patch, cooldownBurn, costBurn, costType, maxAmmo, rangeBurn
FROM
	ChampionSpells
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpells"();
CREATE OR REPLACE FUNCTION "getAllChampionSpells"()
RETURNS TABLE(auto_id INT, id TEXT, championId INT, patch TEXT, cooldownBurn TEXT, costBurn TEXT, costType TEXT, maxAmmo TEXT, rangeBurn TEXT)  AS $$
	SELECT auto_id, id, championId, patch, cooldownBurn, costBurn, costType, maxAmmo, rangeBurn
	FROM ChampionSpells
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpells" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpells" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpells WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpells-------------------

DROP FUNCTION IF EXISTS "addLeagueAbouts" (leagueId INT, languageCode TEXT, about TEXT);
CREATE OR REPLACE FUNCTION "addLeagueAbouts" (leagueId INT, languageCode TEXT, about TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			LeagueAbouts
		WHERE
			LeagueAbouts.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO LeagueAbouts (leagueId, languageCode, about)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLeagueAbouts" (auto_id INT, leagueId INT, languageCode TEXT, about TEXT);
CREATE OR REPLACE FUNCTION "editLeagueAbouts" (auto_id INT, leagueId INT, languageCode TEXT, about TEXT)
	RETURNS VOID
AS $$
UPDATE
	LeagueAbouts
SET 	leagueId=$2, languageCode=$3, about=$4
	WHERE id=LeagueAbouts.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLeagueAbouts" (auto_id INT);
CREATE OR REPLACE FUNCTION "getLeagueAbouts" (auto_id INT)
	RETURNS TABLE (auto_id INT, leagueId INT, languageCode TEXT, about TEXT)
AS $$
SELECT auto_id, leagueId, languageCode, about
FROM
	LeagueAbouts
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllLeagueAbouts"();
CREATE OR REPLACE FUNCTION "getAllLeagueAbouts"()
RETURNS TABLE(auto_id INT, leagueId INT, languageCode TEXT, about TEXT)  AS $$
	SELECT auto_id, leagueId, languageCode, about
	FROM LeagueAbouts
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLeagueAbouts" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteLeagueAbouts" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM LeagueAbouts WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------LeagueAbouts-------------------

DROP FUNCTION IF EXISTS "addChampionSpellLevelTipLabels" (championId INT, spellId INT, patch TEXT, labelIndex INT, label TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpellLevelTipLabels" (championId INT, spellId INT, patch TEXT, labelIndex INT, label TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellLevelTipLabels
		WHERE
			ChampionSpellLevelTipLabels.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellLevelTipLabels (championId, spellId, patch, labelIndex, label)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellLevelTipLabels" (auto_id INT, championId INT, spellId INT, patch TEXT, labelIndex INT, label TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpellLevelTipLabels" (auto_id INT, championId INT, spellId INT, patch TEXT, labelIndex INT, label TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellLevelTipLabels
SET 	championId=$2, spellId=$3, patch=$4, labelIndex=$5, label=$6
	WHERE id=ChampionSpellLevelTipLabels.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellLevelTipLabels" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellLevelTipLabels" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, spellId INT, patch TEXT, labelIndex INT, label TEXT)
AS $$
SELECT auto_id, championId, spellId, patch, labelIndex, label
FROM
	ChampionSpellLevelTipLabels
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellLevelTipLabels"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellLevelTipLabels"()
RETURNS TABLE(auto_id INT, championId INT, spellId INT, patch TEXT, labelIndex INT, label TEXT)  AS $$
	SELECT auto_id, championId, spellId, patch, labelIndex, label
	FROM ChampionSpellLevelTipLabels
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellLevelTipLabels" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellLevelTipLabels" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellLevelTipLabels WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellLevelTipLabels-------------------

DROP FUNCTION IF EXISTS "addGameStatsParticipantMasteries" (gameId TEXT, participantId INT, masteryId INT, rank INT);
CREATE OR REPLACE FUNCTION "addGameStatsParticipantMasteries" (gameId TEXT, participantId INT, masteryId INT, rank INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameStatsParticipantMasteries
		WHERE
			GameStatsParticipantMasteries.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameStatsParticipantMasteries (gameId, participantId, masteryId, rank)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameStatsParticipantMasteries" (auto_id INT, gameId TEXT, participantId INT, masteryId INT, rank INT);
CREATE OR REPLACE FUNCTION "editGameStatsParticipantMasteries" (auto_id INT, gameId TEXT, participantId INT, masteryId INT, rank INT)
	RETURNS VOID
AS $$
UPDATE
	GameStatsParticipantMasteries
SET 	gameId=$2, participantId=$3, masteryId=$4, rank=$5
	WHERE id=GameStatsParticipantMasteries.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameStatsParticipantMasteries" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameStatsParticipantMasteries" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, participantId INT, masteryId INT, rank INT)
AS $$
SELECT auto_id, gameId, participantId, masteryId, rank
FROM
	GameStatsParticipantMasteries
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameStatsParticipantMasteries"();
CREATE OR REPLACE FUNCTION "getAllGameStatsParticipantMasteries"()
RETURNS TABLE(auto_id INT, gameId TEXT, participantId INT, masteryId INT, rank INT)  AS $$
	SELECT auto_id, gameId, participantId, masteryId, rank
	FROM GameStatsParticipantMasteries
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameStatsParticipantMasteries" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameStatsParticipantMasteries" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameStatsParticipantMasteries WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameStatsParticipantMasteries-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventChampionKill" (gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, victimId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventChampionKill" (gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, victimId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventChampionKill
		WHERE
			GameTimelineFrameEventChampionKill.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventChampionKill (gameId, type, _timestamp, xPosition, yPosition, killerId, victimId)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventChampionKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, victimId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventChampionKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, victimId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventChampionKill
SET 	gameId=$2, type=$3, _timestamp=$4, xPosition=$5, yPosition=$6, killerId=$7, victimId=$8
	WHERE id=GameTimelineFrameEventChampionKill.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventChampionKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventChampionKill" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, victimId INT)
AS $$
SELECT auto_id, gameId, type, _timestamp, xPosition, yPosition, killerId, victimId
FROM
	GameTimelineFrameEventChampionKill
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventChampionKill"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventChampionKill"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, victimId INT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, xPosition, yPosition, killerId, victimId
	FROM GameTimelineFrameEventChampionKill
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventChampionKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventChampionKill" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventChampionKill WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventChampionKill-------------------

DROP FUNCTION IF EXISTS "addItemTags" (itemId INT, patch TEXT, tag TEXT);
CREATE OR REPLACE FUNCTION "addItemTags" (itemId INT, patch TEXT, tag TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemTags
		WHERE
			ItemTags.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemTags (itemId, patch, tag)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemTags" (auto_id INT, itemId INT, patch TEXT, tag TEXT);
CREATE OR REPLACE FUNCTION "editItemTags" (auto_id INT, itemId INT, patch TEXT, tag TEXT)
	RETURNS VOID
AS $$
UPDATE
	ItemTags
SET 	itemId=$2, patch=$3, tag=$4
	WHERE id=ItemTags.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemTags" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemTags" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, tag TEXT)
AS $$
SELECT auto_id, itemId, patch, tag
FROM
	ItemTags
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemTags"();
CREATE OR REPLACE FUNCTION "getAllItemTags"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, tag TEXT)  AS $$
	SELECT auto_id, itemId, patch, tag
	FROM ItemTags
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemTags" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemTags" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemTags WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemTags-------------------

DROP FUNCTION IF EXISTS "addRuneTags" (runeId INT, patch TEXT, tag TEXT);
CREATE OR REPLACE FUNCTION "addRuneTags" (runeId INT, patch TEXT, tag TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RuneTags
		WHERE
			RuneTags.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RuneTags (runeId, patch, tag)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRuneTags" (auto_id INT, runeId INT, patch TEXT, tag TEXT);
CREATE OR REPLACE FUNCTION "editRuneTags" (auto_id INT, runeId INT, patch TEXT, tag TEXT)
	RETURNS VOID
AS $$
UPDATE
	RuneTags
SET 	runeId=$2, patch=$3, tag=$4
	WHERE id=RuneTags.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRuneTags" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRuneTags" (auto_id INT)
	RETURNS TABLE (auto_id INT, runeId INT, patch TEXT, tag TEXT)
AS $$
SELECT auto_id, runeId, patch, tag
FROM
	RuneTags
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRuneTags"();
CREATE OR REPLACE FUNCTION "getAllRuneTags"()
RETURNS TABLE(auto_id INT, runeId INT, patch TEXT, tag TEXT)  AS $$
	SELECT auto_id, runeId, patch, tag
	FROM RuneTags
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRuneTags" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRuneTags" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RuneTags WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RuneTags-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventEliteMonsterSubTypes" (monsterSubType TEXT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventEliteMonsterSubTypes" (monsterSubType TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventEliteMonsterSubTypes
		WHERE
			GameTimelineFrameEventEliteMonsterSubTypes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventEliteMonsterSubTypes (monsterSubType)
		VALUES ($1)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventEliteMonsterSubTypes" (auto_id INT, monsterSubType TEXT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventEliteMonsterSubTypes" (auto_id INT, monsterSubType TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventEliteMonsterSubTypes
SET 	monsterSubType=$2
	WHERE id=GameTimelineFrameEventEliteMonsterSubTypes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventEliteMonsterSubTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventEliteMonsterSubTypes" (auto_id INT)
	RETURNS TABLE (auto_id INT, monsterSubType TEXT)
AS $$
SELECT auto_id, monsterSubType
FROM
	GameTimelineFrameEventEliteMonsterSubTypes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventEliteMonsterSubTypes"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventEliteMonsterSubTypes"()
RETURNS TABLE(auto_id INT, monsterSubType TEXT)  AS $$
	SELECT auto_id, monsterSubType
	FROM GameTimelineFrameEventEliteMonsterSubTypes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventEliteMonsterSubTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventEliteMonsterSubTypes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventEliteMonsterSubTypes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventEliteMonsterSubTypes-------------------

DROP FUNCTION IF EXISTS "addRunesReforged" (id INT, key TEXT, patch TEXT, iconURL TEXT);
CREATE OR REPLACE FUNCTION "addRunesReforged" (id INT, key TEXT, patch TEXT, iconURL TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RunesReforged
		WHERE
			RunesReforged.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RunesReforged (id, key, patch, iconURL)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRunesReforged" (auto_id INT, id INT, key TEXT, patch TEXT, iconURL TEXT);
CREATE OR REPLACE FUNCTION "editRunesReforged" (auto_id INT, id INT, key TEXT, patch TEXT, iconURL TEXT)
	RETURNS VOID
AS $$
UPDATE
	RunesReforged
SET 	id=$2, key=$3, patch=$4, iconURL=$5
	WHERE id=RunesReforged.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRunesReforged" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRunesReforged" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, key TEXT, patch TEXT, iconURL TEXT)
AS $$
SELECT auto_id, id, key, patch, iconURL
FROM
	RunesReforged
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRunesReforged"();
CREATE OR REPLACE FUNCTION "getAllRunesReforged"()
RETURNS TABLE(auto_id INT, id INT, key TEXT, patch TEXT, iconURL TEXT)  AS $$
	SELECT auto_id, id, key, patch, iconURL
	FROM RunesReforged
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRunesReforged" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRunesReforged" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RunesReforged WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RunesReforged-------------------

DROP FUNCTION IF EXISTS "addTeamStatsSummaries" (teamId INT, kdsRatio NUMERIC, kdaRatioRank INT, averageWinLength NUMERIC, averageWinLengthRank INT, firstDragonKillRatio NUMERIC, firstDragonKillRatioRank INT, firstTowerRatio NUMERIC, firstTowerRatioRank INT);
CREATE OR REPLACE FUNCTION "addTeamStatsSummaries" (teamId INT, kdsRatio NUMERIC, kdaRatioRank INT, averageWinLength NUMERIC, averageWinLengthRank INT, firstDragonKillRatio NUMERIC, firstDragonKillRatioRank INT, firstTowerRatio NUMERIC, firstTowerRatioRank INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamStatsSummaries
		WHERE
			TeamStatsSummaries.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamStatsSummaries (teamId, kdsRatio, kdaRatioRank, averageWinLength, averageWinLengthRank, firstDragonKillRatio, firstDragonKillRatioRank, firstTowerRatio, firstTowerRatioRank)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamStatsSummaries" (auto_id INT, teamId INT, kdsRatio NUMERIC, kdaRatioRank INT, averageWinLength NUMERIC, averageWinLengthRank INT, firstDragonKillRatio NUMERIC, firstDragonKillRatioRank INT, firstTowerRatio NUMERIC, firstTowerRatioRank INT);
CREATE OR REPLACE FUNCTION "editTeamStatsSummaries" (auto_id INT, teamId INT, kdsRatio NUMERIC, kdaRatioRank INT, averageWinLength NUMERIC, averageWinLengthRank INT, firstDragonKillRatio NUMERIC, firstDragonKillRatioRank INT, firstTowerRatio NUMERIC, firstTowerRatioRank INT)
	RETURNS VOID
AS $$
UPDATE
	TeamStatsSummaries
SET 	teamId=$2, kdsRatio=$3, kdaRatioRank=$4, averageWinLength=$5, averageWinLengthRank=$6, firstDragonKillRatio=$7, firstDragonKillRatioRank=$8, firstTowerRatio=$9, firstTowerRatioRank=$10
	WHERE id=TeamStatsSummaries.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamStatsSummaries" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamStatsSummaries" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, kdsRatio NUMERIC, kdaRatioRank INT, averageWinLength NUMERIC, averageWinLengthRank INT, firstDragonKillRatio NUMERIC, firstDragonKillRatioRank INT, firstTowerRatio NUMERIC, firstTowerRatioRank INT)
AS $$
SELECT auto_id, teamId, kdsRatio, kdaRatioRank, averageWinLength, averageWinLengthRank, firstDragonKillRatio, firstDragonKillRatioRank, firstTowerRatio, firstTowerRatioRank
FROM
	TeamStatsSummaries
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamStatsSummaries"();
CREATE OR REPLACE FUNCTION "getAllTeamStatsSummaries"()
RETURNS TABLE(auto_id INT, teamId INT, kdsRatio NUMERIC, kdaRatioRank INT, averageWinLength NUMERIC, averageWinLengthRank INT, firstDragonKillRatio NUMERIC, firstDragonKillRatioRank INT, firstTowerRatio NUMERIC, firstTowerRatioRank INT)  AS $$
	SELECT auto_id, teamId, kdsRatio, kdaRatioRank, averageWinLength, averageWinLengthRank, firstDragonKillRatio, firstDragonKillRatioRank, firstTowerRatio, firstTowerRatioRank
	FROM TeamStatsSummaries
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamStatsSummaries" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamStatsSummaries" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamStatsSummaries WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamStatsSummaries-------------------

DROP FUNCTION IF EXISTS "addProfileIcons" (id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addProfileIcons" (id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ProfileIcons
		WHERE
			ProfileIcons.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ProfileIcons (id, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editProfileIcons" (auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editProfileIcons" (auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	ProfileIcons
SET 	id=$2, patch=$3, fullURL=$4, spriteURL=$5, x=$6, y=$7, w=$8, h=$9
	WHERE id=ProfileIcons.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getProfileIcons" (auto_id INT);
CREATE OR REPLACE FUNCTION "getProfileIcons" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, id, patch, fullURL, spriteURL, x, y, w, h
FROM
	ProfileIcons
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllProfileIcons"();
CREATE OR REPLACE FUNCTION "getAllProfileIcons"()
RETURNS TABLE(auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, id, patch, fullURL, spriteURL, x, y, w, h
	FROM ProfileIcons
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteProfileIcons" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteProfileIcons" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ProfileIcons WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ProfileIcons-------------------

DROP FUNCTION IF EXISTS "addRunesReforgedRuneShortDescriptions" (runesReforgedRuneId INT, patch TEXT, languageCode TEXT, shortDescription TEXT);
CREATE OR REPLACE FUNCTION "addRunesReforgedRuneShortDescriptions" (runesReforgedRuneId INT, patch TEXT, languageCode TEXT, shortDescription TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RunesReforgedRuneShortDescriptions
		WHERE
			RunesReforgedRuneShortDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RunesReforgedRuneShortDescriptions (runesReforgedRuneId, patch, languageCode, shortDescription)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRunesReforgedRuneShortDescriptions" (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, shortDescription TEXT);
CREATE OR REPLACE FUNCTION "editRunesReforgedRuneShortDescriptions" (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, shortDescription TEXT)
	RETURNS VOID
AS $$
UPDATE
	RunesReforgedRuneShortDescriptions
SET 	runesReforgedRuneId=$2, patch=$3, languageCode=$4, shortDescription=$5
	WHERE id=RunesReforgedRuneShortDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRunesReforgedRuneShortDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRunesReforgedRuneShortDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, shortDescription TEXT)
AS $$
SELECT auto_id, runesReforgedRuneId, patch, languageCode, shortDescription
FROM
	RunesReforgedRuneShortDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRunesReforgedRuneShortDescriptions"();
CREATE OR REPLACE FUNCTION "getAllRunesReforgedRuneShortDescriptions"()
RETURNS TABLE(auto_id INT, runesReforgedRuneId INT, patch TEXT, languageCode TEXT, shortDescription TEXT)  AS $$
	SELECT auto_id, runesReforgedRuneId, patch, languageCode, shortDescription
	FROM RunesReforgedRuneShortDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRunesReforgedRuneShortDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRunesReforgedRuneShortDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RunesReforgedRuneShortDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RunesReforgedRuneShortDescriptions-------------------

DROP FUNCTION IF EXISTS "addItemDescriptions" (itemId INT, patch TEXT, languageCode TEXT, itemDescription TEXT);
CREATE OR REPLACE FUNCTION "addItemDescriptions" (itemId INT, patch TEXT, languageCode TEXT, itemDescription TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemDescriptions
		WHERE
			ItemDescriptions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemDescriptions (itemId, patch, languageCode, itemDescription)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemDescriptions" (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemDescription TEXT);
CREATE OR REPLACE FUNCTION "editItemDescriptions" (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemDescription TEXT)
	RETURNS VOID
AS $$
UPDATE
	ItemDescriptions
SET 	itemId=$2, patch=$3, languageCode=$4, itemDescription=$5
	WHERE id=ItemDescriptions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemDescriptions" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemDescription TEXT)
AS $$
SELECT auto_id, itemId, patch, languageCode, itemDescription
FROM
	ItemDescriptions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemDescriptions"();
CREATE OR REPLACE FUNCTION "getAllItemDescriptions"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, languageCode TEXT, itemDescription TEXT)  AS $$
	SELECT auto_id, itemId, patch, languageCode, itemDescription
	FROM ItemDescriptions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemDescriptions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemDescriptions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemDescriptions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemDescriptions-------------------

DROP FUNCTION IF EXISTS "addPlayerBios " (playerId INT, languageCode TEXT, bio TEXT);
CREATE OR REPLACE FUNCTION "addPlayerBios " (playerId INT, languageCode TEXT, bio TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			PlayerBios 
		WHERE
			PlayerBios .auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO PlayerBios  (playerId, languageCode, bio)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayerBios " (auto_id INT, playerId INT, languageCode TEXT, bio TEXT);
CREATE OR REPLACE FUNCTION "editPlayerBios " (auto_id INT, playerId INT, languageCode TEXT, bio TEXT)
	RETURNS VOID
AS $$
UPDATE
	PlayerBios 
SET 	playerId=$2, languageCode=$3, bio=$4
	WHERE id=PlayerBios .auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayerBios " (auto_id INT);
CREATE OR REPLACE FUNCTION "getPlayerBios " (auto_id INT)
	RETURNS TABLE (auto_id INT, playerId INT, languageCode TEXT, bio TEXT)
AS $$
SELECT auto_id, playerId, languageCode, bio
FROM
	PlayerBios 
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPlayerBios "();
CREATE OR REPLACE FUNCTION "getAllPlayerBios "()
RETURNS TABLE(auto_id INT, playerId INT, languageCode TEXT, bio TEXT)  AS $$
	SELECT auto_id, playerId, languageCode, bio
	FROM PlayerBios 
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayerBios " (auto_id INT);
CREATE OR REPLACE FUNCTION "deletePlayerBios " (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM PlayerBios  WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------PlayerBios -------------------

DROP FUNCTION IF EXISTS "addChampionTags" (championId INT, patch TEXT, tag TEXT);
CREATE OR REPLACE FUNCTION "addChampionTags" (championId INT, patch TEXT, tag TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionTags
		WHERE
			ChampionTags.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionTags (championId, patch, tag)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionTags" (auto_id INT, championId INT, patch TEXT, tag TEXT);
CREATE OR REPLACE FUNCTION "editChampionTags" (auto_id INT, championId INT, patch TEXT, tag TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionTags
SET 	championId=$2, patch=$3, tag=$4
	WHERE id=ChampionTags.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionTags" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionTags" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, tag TEXT)
AS $$
SELECT auto_id, championId, patch, tag
FROM
	ChampionTags
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionTags"();
CREATE OR REPLACE FUNCTION "getAllChampionTags"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, tag TEXT)  AS $$
	SELECT auto_id, championId, patch, tag
	FROM ChampionTags
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionTags" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionTags" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionTags WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionTags-------------------

DROP FUNCTION IF EXISTS "addLanguageCodes" (languageCode TEXT, languageText TEXT);
CREATE OR REPLACE FUNCTION "addLanguageCodes" (languageCode TEXT, languageText TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			LanguageCodes
		WHERE
			LanguageCodes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO LanguageCodes (languageCode, languageText)
		VALUES ($1, $2)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editLanguageCodes" (auto_id INT, languageCode TEXT, languageText TEXT);
CREATE OR REPLACE FUNCTION "editLanguageCodes" (auto_id INT, languageCode TEXT, languageText TEXT)
	RETURNS VOID
AS $$
UPDATE
	LanguageCodes
SET 	languageCode=$2, languageText=$3
	WHERE id=LanguageCodes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getLanguageCodes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getLanguageCodes" (auto_id INT)
	RETURNS TABLE (auto_id INT, languageCode TEXT, languageText TEXT)
AS $$
SELECT auto_id, languageCode, languageText
FROM
	LanguageCodes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllLanguageCodes"();
CREATE OR REPLACE FUNCTION "getAllLanguageCodes"()
RETURNS TABLE(auto_id INT, languageCode TEXT, languageText TEXT)  AS $$
	SELECT auto_id, languageCode, languageText
	FROM LanguageCodes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteLanguageCodes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteLanguageCodes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM LanguageCodes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------LanguageCodes-------------------

DROP FUNCTION IF EXISTS "addPlayerTournamentStats" (playerId INT, teamId INT, PlayerTournamentStatsName TEXT, position TEXT, teamAcronym TEXT, gamesPlayed INT, kda NUMERIC, kills INT, deaths INT, assists INT, killParticipation NUMERIC, csPerMin NUMERIC, cs INT, minutesPlayed INT);
CREATE OR REPLACE FUNCTION "addPlayerTournamentStats" (playerId INT, teamId INT, PlayerTournamentStatsName TEXT, position TEXT, teamAcronym TEXT, gamesPlayed INT, kda NUMERIC, kills INT, deaths INT, assists INT, killParticipation NUMERIC, csPerMin NUMERIC, cs INT, minutesPlayed INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			PlayerTournamentStats
		WHERE
			PlayerTournamentStats.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO PlayerTournamentStats (playerId, teamId, PlayerTournamentStatsName, position, teamAcronym, gamesPlayed, kda, kills, deaths, assists, killParticipation, csPerMin, cs, minutesPlayed)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayerTournamentStats" (auto_id INT, playerId INT, teamId INT, PlayerTournamentStatsName TEXT, position TEXT, teamAcronym TEXT, gamesPlayed INT, kda NUMERIC, kills INT, deaths INT, assists INT, killParticipation NUMERIC, csPerMin NUMERIC, cs INT, minutesPlayed INT);
CREATE OR REPLACE FUNCTION "editPlayerTournamentStats" (auto_id INT, playerId INT, teamId INT, PlayerTournamentStatsName TEXT, position TEXT, teamAcronym TEXT, gamesPlayed INT, kda NUMERIC, kills INT, deaths INT, assists INT, killParticipation NUMERIC, csPerMin NUMERIC, cs INT, minutesPlayed INT)
	RETURNS VOID
AS $$
UPDATE
	PlayerTournamentStats
SET 	playerId=$2, teamId=$3, PlayerTournamentStatsName=$4, position=$5, teamAcronym=$6, gamesPlayed=$7, kda=$8, kills=$9, deaths=$10, assists=$11, killParticipation=$12, csPerMin=$13, cs=$14, minutesPlayed=$15
	WHERE id=PlayerTournamentStats.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayerTournamentStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "getPlayerTournamentStats" (auto_id INT)
	RETURNS TABLE (auto_id INT, playerId INT, teamId INT, PlayerTournamentStatsName TEXT, position TEXT, teamAcronym TEXT, gamesPlayed INT, kda NUMERIC, kills INT, deaths INT, assists INT, killParticipation NUMERIC, csPerMin NUMERIC, cs INT, minutesPlayed INT)
AS $$
SELECT auto_id, playerId, teamId, PlayerTournamentStatsName, position, teamAcronym, gamesPlayed, kda, kills, deaths, assists, killParticipation, csPerMin, cs, minutesPlayed
FROM
	PlayerTournamentStats
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPlayerTournamentStats"();
CREATE OR REPLACE FUNCTION "getAllPlayerTournamentStats"()
RETURNS TABLE(auto_id INT, playerId INT, teamId INT, PlayerTournamentStatsName TEXT, position TEXT, teamAcronym TEXT, gamesPlayed INT, kda NUMERIC, kills INT, deaths INT, assists INT, killParticipation NUMERIC, csPerMin NUMERIC, cs INT, minutesPlayed INT)  AS $$
	SELECT auto_id, playerId, teamId, PlayerTournamentStatsName, position, teamAcronym, gamesPlayed, kda, kills, deaths, assists, killParticipation, csPerMin, cs, minutesPlayed
	FROM PlayerTournamentStats
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayerTournamentStats" (auto_id INT);
CREATE OR REPLACE FUNCTION "deletePlayerTournamentStats" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM PlayerTournamentStats WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------PlayerTournamentStats-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventEliteMonsterKill" (gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, monsterType TEXT, monsterSubType TEXT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventEliteMonsterKill" (gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, monsterType TEXT, monsterSubType TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventEliteMonsterKill
		WHERE
			GameTimelineFrameEventEliteMonsterKill.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventEliteMonsterKill (gameId, type, _timestamp, xPosition, yPosition, killerId, monsterType, monsterSubType)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventEliteMonsterKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, monsterType TEXT, monsterSubType TEXT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventEliteMonsterKill" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, monsterType TEXT, monsterSubType TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventEliteMonsterKill
SET 	gameId=$2, type=$3, _timestamp=$4, xPosition=$5, yPosition=$6, killerId=$7, monsterType=$8, monsterSubType=$9
	WHERE id=GameTimelineFrameEventEliteMonsterKill.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventEliteMonsterKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventEliteMonsterKill" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, monsterType TEXT, monsterSubType TEXT)
AS $$
SELECT auto_id, gameId, type, _timestamp, xPosition, yPosition, killerId, monsterType, monsterSubType
FROM
	GameTimelineFrameEventEliteMonsterKill
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventEliteMonsterKill"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventEliteMonsterKill"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, xPosition INT, yPosition INT, killerId INT, monsterType TEXT, monsterSubType TEXT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, xPosition, yPosition, killerId, monsterType, monsterSubType
	FROM GameTimelineFrameEventEliteMonsterKill
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventEliteMonsterKill" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventEliteMonsterKill" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventEliteMonsterKill WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventEliteMonsterKill-------------------

DROP FUNCTION IF EXISTS "addTournamentRosters" (id TEXT, turnamentRostersName TEXT, teamId INT, tournamentId TEXT);
CREATE OR REPLACE FUNCTION "addTournamentRosters" (id TEXT, turnamentRostersName TEXT, teamId INT, tournamentId TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TournamentRosters
		WHERE
			TournamentRosters.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TournamentRosters (id, turnamentRostersName, teamId, tournamentId)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTournamentRosters" (auto_id INT, id TEXT, turnamentRostersName TEXT, teamId INT, tournamentId TEXT);
CREATE OR REPLACE FUNCTION "editTournamentRosters" (auto_id INT, id TEXT, turnamentRostersName TEXT, teamId INT, tournamentId TEXT)
	RETURNS VOID
AS $$
UPDATE
	TournamentRosters
SET 	id=$2, turnamentRostersName=$3, teamId=$4, tournamentId=$5
	WHERE id=TournamentRosters.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTournamentRosters" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTournamentRosters" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, turnamentRostersName TEXT, teamId INT, tournamentId TEXT)
AS $$
SELECT auto_id, id, turnamentRostersName, teamId, tournamentId
FROM
	TournamentRosters
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTournamentRosters"();
CREATE OR REPLACE FUNCTION "getAllTournamentRosters"()
RETURNS TABLE(auto_id INT, id TEXT, turnamentRostersName TEXT, teamId INT, tournamentId TEXT)  AS $$
	SELECT auto_id, id, turnamentRostersName, teamId, tournamentId
	FROM TournamentRosters
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTournamentRosters" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTournamentRosters" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TournamentRosters WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TournamentRosters-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventItemDestroyed" (gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventItemDestroyed" (gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventItemDestroyed
		WHERE
			GameTimelineFrameEventItemDestroyed.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventItemDestroyed (gameId, type, _timestamp, itemId, participantId)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventItemDestroyed" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventItemDestroyed" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventItemDestroyed
SET 	gameId=$2, type=$3, _timestamp=$4, itemId=$5, participantId=$6
	WHERE id=GameTimelineFrameEventItemDestroyed.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventItemDestroyed" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventItemDestroyed" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
AS $$
SELECT auto_id, gameId, type, _timestamp, itemId, participantId
FROM
	GameTimelineFrameEventItemDestroyed
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventItemDestroyed"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventItemDestroyed"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, itemId, participantId
	FROM GameTimelineFrameEventItemDestroyed
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventItemDestroyed" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventItemDestroyed" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventItemDestroyed WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventItemDestroyed-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventItemSold" (gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventItemSold" (gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventItemSold
		WHERE
			GameTimelineFrameEventItemSold.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventItemSold (gameId, type, _timestamp, itemId, participantId)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventItemSold" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventItemSold" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventItemSold
SET 	gameId=$2, type=$3, _timestamp=$4, itemId=$5, participantId=$6
	WHERE id=GameTimelineFrameEventItemSold.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventItemSold" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventItemSold" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)
AS $$
SELECT auto_id, gameId, type, _timestamp, itemId, participantId
FROM
	GameTimelineFrameEventItemSold
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventItemSold"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventItemSold"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT, itemId INT, participantId INT)  AS $$
	SELECT auto_id, gameId, type, _timestamp, itemId, participantId
	FROM GameTimelineFrameEventItemSold
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventItemSold" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventItemSold" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventItemSold WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventItemSold-------------------

DROP FUNCTION IF EXISTS "addMasteryImages" (masteryId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addMasteryImages" (masteryId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			MasteryImages
		WHERE
			MasteryImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO MasteryImages (masteryId, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editMasteryImages" (auto_id INT, masteryId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editMasteryImages" (auto_id INT, masteryId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	MasteryImages
SET 	masteryId=$2, patch=$3, fullURL=$4, spriteURL=$5, x=$6, y=$7, w=$8, h=$9
	WHERE id=MasteryImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getMasteryImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getMasteryImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, masteryId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, masteryId, patch, fullURL, spriteURL, x, y, w, h
FROM
	MasteryImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllMasteryImages"();
CREATE OR REPLACE FUNCTION "getAllMasteryImages"()
RETURNS TABLE(auto_id INT, masteryId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, masteryId, patch, fullURL, spriteURL, x, y, w, h
	FROM MasteryImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteMasteryImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteMasteryImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM MasteryImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------MasteryImages-------------------

DROP FUNCTION IF EXISTS "addPlayers" (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, hometown TEXT, region INT, birthdate TIMESTAMP);
CREATE OR REPLACE FUNCTION "addPlayers" (id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, hometown TEXT, region INT, birthdate TIMESTAMP)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Players
		WHERE
			Players.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Players (id, firstName, lastName, inGameName, photoURL, hometown, region, birthdate)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editPlayers" (auto_id INT, id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, hometown TEXT, region INT, birthdate TIMESTAMP);
CREATE OR REPLACE FUNCTION "editPlayers" (auto_id INT, id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, hometown TEXT, region INT, birthdate TIMESTAMP)
	RETURNS VOID
AS $$
UPDATE
	Players
SET 	id=$2, firstName=$3, lastName=$4, inGameName=$5, photoURL=$6, hometown=$7, region=$8, birthdate=$9
	WHERE id=Players.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getPlayers" (auto_id INT);
CREATE OR REPLACE FUNCTION "getPlayers" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, hometown TEXT, region INT, birthdate TIMESTAMP)
AS $$
SELECT auto_id, id, firstName, lastName, inGameName, photoURL, hometown, region, birthdate
FROM
	Players
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllPlayers"();
CREATE OR REPLACE FUNCTION "getAllPlayers"()
RETURNS TABLE(auto_id INT, id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, hometown TEXT, region INT, birthdate TIMESTAMP)  AS $$
	SELECT auto_id, id, firstName, lastName, inGameName, photoURL, hometown, region, birthdate
	FROM Players
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deletePlayers" (auto_id INT);
CREATE OR REPLACE FUNCTION "deletePlayers" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Players WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Players-------------------

DROP FUNCTION IF EXISTS "addItemEffects" (itemId INT, patch TEXT, effectIndex INT, effectValue INT);
CREATE OR REPLACE FUNCTION "addItemEffects" (itemId INT, patch TEXT, effectIndex INT, effectValue INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ItemEffects
		WHERE
			ItemEffects.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ItemEffects (itemId, patch, effectIndex, effectValue)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editItemEffects" (auto_id INT, itemId INT, patch TEXT, effectIndex INT, effectValue INT);
CREATE OR REPLACE FUNCTION "editItemEffects" (auto_id INT, itemId INT, patch TEXT, effectIndex INT, effectValue INT)
	RETURNS VOID
AS $$
UPDATE
	ItemEffects
SET 	itemId=$2, patch=$3, effectIndex=$4, effectValue=$5
	WHERE id=ItemEffects.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getItemEffects" (auto_id INT);
CREATE OR REPLACE FUNCTION "getItemEffects" (auto_id INT)
	RETURNS TABLE (auto_id INT, itemId INT, patch TEXT, effectIndex INT, effectValue INT)
AS $$
SELECT auto_id, itemId, patch, effectIndex, effectValue
FROM
	ItemEffects
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllItemEffects"();
CREATE OR REPLACE FUNCTION "getAllItemEffects"()
RETURNS TABLE(auto_id INT, itemId INT, patch TEXT, effectIndex INT, effectValue INT)  AS $$
	SELECT auto_id, itemId, patch, effectIndex, effectValue
	FROM ItemEffects
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteItemEffects" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteItemEffects" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ItemEffects WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ItemEffects-------------------

DROP FUNCTION IF EXISTS "addGames" (id TEXT, matchId TEXT, bracketId TEXT, tournamentId TEXT, gamesName TEXT);
CREATE OR REPLACE FUNCTION "addGames" (id TEXT, matchId TEXT, bracketId TEXT, tournamentId TEXT, gamesName TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Games
		WHERE
			Games.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Games (id, matchId, bracketId, tournamentId, gamesName)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGames" (auto_id INT, id TEXT, matchId TEXT, bracketId TEXT, tournamentId TEXT, gamesName TEXT);
CREATE OR REPLACE FUNCTION "editGames" (auto_id INT, id TEXT, matchId TEXT, bracketId TEXT, tournamentId TEXT, gamesName TEXT)
	RETURNS VOID
AS $$
UPDATE
	Games
SET 	id=$2, matchId=$3, bracketId=$4, tournamentId=$5, gamesName=$6
	WHERE id=Games.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGames" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGames" (auto_id INT)
	RETURNS TABLE (auto_id INT, id TEXT, matchId TEXT, bracketId TEXT, tournamentId TEXT, gamesName TEXT)
AS $$
SELECT auto_id, id, matchId, bracketId, tournamentId, gamesName
FROM
	Games
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGames"();
CREATE OR REPLACE FUNCTION "getAllGames"()
RETURNS TABLE(auto_id INT, id TEXT, matchId TEXT, bracketId TEXT, tournamentId TEXT, gamesName TEXT)  AS $$
	SELECT auto_id, id, matchId, bracketId, tournamentId, gamesName
	FROM Games
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGames" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGames" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Games WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Games-------------------

DROP FUNCTION IF EXISTS "addChampionEnemyTips" (championId INT, patch TEXT, languageCode TEXT, tip TEXT);
CREATE OR REPLACE FUNCTION "addChampionEnemyTips" (championId INT, patch TEXT, languageCode TEXT, tip TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionEnemyTips
		WHERE
			ChampionEnemyTips.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionEnemyTips (championId, patch, languageCode, tip)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionEnemyTips" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT);
CREATE OR REPLACE FUNCTION "editChampionEnemyTips" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionEnemyTips
SET 	championId=$2, patch=$3, languageCode=$4, tip=$5
	WHERE id=ChampionEnemyTips.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionEnemyTips" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionEnemyTips" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, tip
FROM
	ChampionEnemyTips
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionEnemyTips"();
CREATE OR REPLACE FUNCTION "getAllChampionEnemyTips"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, tip TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, tip
	FROM ChampionEnemyTips
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionEnemyTips" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionEnemyTips" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionEnemyTips WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionEnemyTips-------------------

DROP FUNCTION IF EXISTS "addChampionSpellLevelTipEffects" (championId INT, spellId INT, patch TEXT, effectIndex INT, effect TEXT);
CREATE OR REPLACE FUNCTION "addChampionSpellLevelTipEffects" (championId INT, spellId INT, patch TEXT, effectIndex INT, effect TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionSpellLevelTipEffects
		WHERE
			ChampionSpellLevelTipEffects.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionSpellLevelTipEffects (championId, spellId, patch, effectIndex, effect)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionSpellLevelTipEffects" (auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effect TEXT);
CREATE OR REPLACE FUNCTION "editChampionSpellLevelTipEffects" (auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effect TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionSpellLevelTipEffects
SET 	championId=$2, spellId=$3, patch=$4, effectIndex=$5, effect=$6
	WHERE id=ChampionSpellLevelTipEffects.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionSpellLevelTipEffects" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionSpellLevelTipEffects" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effect TEXT)
AS $$
SELECT auto_id, championId, spellId, patch, effectIndex, effect
FROM
	ChampionSpellLevelTipEffects
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionSpellLevelTipEffects"();
CREATE OR REPLACE FUNCTION "getAllChampionSpellLevelTipEffects"()
RETURNS TABLE(auto_id INT, championId INT, spellId INT, patch TEXT, effectIndex INT, effect TEXT)  AS $$
	SELECT auto_id, championId, spellId, patch, effectIndex, effect
	FROM ChampionSpellLevelTipEffects
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionSpellLevelTipEffects" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionSpellLevelTipEffects" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionSpellLevelTipEffects WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionSpellLevelTipEffects-------------------

DROP FUNCTION IF EXISTS "addTeams" (id INT, teamName TEXT, photoURL TEXT, logoURL TEXT, acronym TEXT, altLogoURL TEXT, homeLeague INT);
CREATE OR REPLACE FUNCTION "addTeams" (id INT, teamName TEXT, photoURL TEXT, logoURL TEXT, acronym TEXT, altLogoURL TEXT, homeLeague INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Teams
		WHERE
			Teams.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Teams (id, teamName, photoURL, logoURL, acronym, altLogoURL, homeLeague)
		VALUES ($1, $2, $3, $4, $5, $6, $7)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeams" (auto_id INT, id INT, teamName TEXT, photoURL TEXT, logoURL TEXT, acronym TEXT, altLogoURL TEXT, homeLeague INT);
CREATE OR REPLACE FUNCTION "editTeams" (auto_id INT, id INT, teamName TEXT, photoURL TEXT, logoURL TEXT, acronym TEXT, altLogoURL TEXT, homeLeague INT)
	RETURNS VOID
AS $$
UPDATE
	Teams
SET 	id=$2, teamName=$3, photoURL=$4, logoURL=$5, acronym=$6, altLogoURL=$7, homeLeague=$8
	WHERE id=Teams.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeams" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeams" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, teamName TEXT, photoURL TEXT, logoURL TEXT, acronym TEXT, altLogoURL TEXT, homeLeague INT)
AS $$
SELECT auto_id, id, teamName, photoURL, logoURL, acronym, altLogoURL, homeLeague
FROM
	Teams
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeams"();
CREATE OR REPLACE FUNCTION "getAllTeams"()
RETURNS TABLE(auto_id INT, id INT, teamName TEXT, photoURL TEXT, logoURL TEXT, acronym TEXT, altLogoURL TEXT, homeLeague INT)  AS $$
	SELECT auto_id, id, teamName, photoURL, logoURL, acronym, altLogoURL, homeLeague
	FROM Teams
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeams" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeams" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Teams WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Teams-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventEliteMonsterKillAssists" (gameId TEXT, eliteMonsterKillEvent INT, assistingParticipantId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventEliteMonsterKillAssists" (gameId TEXT, eliteMonsterKillEvent INT, assistingParticipantId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventEliteMonsterKillAssists
		WHERE
			GameTimelineFrameEventEliteMonsterKillAssists.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventEliteMonsterKillAssists (gameId, eliteMonsterKillEvent, assistingParticipantId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventEliteMonsterKillAssists" (auto_id INT, gameId TEXT, eliteMonsterKillEvent INT, assistingParticipantId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventEliteMonsterKillAssists" (auto_id INT, gameId TEXT, eliteMonsterKillEvent INT, assistingParticipantId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventEliteMonsterKillAssists
SET 	gameId=$2, eliteMonsterKillEvent=$3, assistingParticipantId=$4
	WHERE id=GameTimelineFrameEventEliteMonsterKillAssists.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventEliteMonsterKillAssists" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventEliteMonsterKillAssists" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, eliteMonsterKillEvent INT, assistingParticipantId INT)
AS $$
SELECT auto_id, gameId, eliteMonsterKillEvent, assistingParticipantId
FROM
	GameTimelineFrameEventEliteMonsterKillAssists
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventEliteMonsterKillAssists"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventEliteMonsterKillAssists"()
RETURNS TABLE(auto_id INT, gameId TEXT, eliteMonsterKillEvent INT, assistingParticipantId INT)  AS $$
	SELECT auto_id, gameId, eliteMonsterKillEvent, assistingParticipantId
	FROM GameTimelineFrameEventEliteMonsterKillAssists
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventEliteMonsterKillAssists" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventEliteMonsterKillAssists" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventEliteMonsterKillAssists WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventEliteMonsterKillAssists-------------------

DROP FUNCTION IF EXISTS "addTeamStatsSummariesAverageDamageByPositions" (teamId INT, adc NUMERIC, support NUMERIC, solo NUMERIC, jungle NUMERIC);
CREATE OR REPLACE FUNCTION "addTeamStatsSummariesAverageDamageByPositions" (teamId INT, adc NUMERIC, support NUMERIC, solo NUMERIC, jungle NUMERIC)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			TeamStatsSummariesAverageDamageByPositions
		WHERE
			TeamStatsSummariesAverageDamageByPositions.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO TeamStatsSummariesAverageDamageByPositions (teamId, adc, support, solo, jungle)
		VALUES ($1, $2, $3, $4, $5)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editTeamStatsSummariesAverageDamageByPositions" (auto_id INT, teamId INT, adc NUMERIC, support NUMERIC, solo NUMERIC, jungle NUMERIC);
CREATE OR REPLACE FUNCTION "editTeamStatsSummariesAverageDamageByPositions" (auto_id INT, teamId INT, adc NUMERIC, support NUMERIC, solo NUMERIC, jungle NUMERIC)
	RETURNS VOID
AS $$
UPDATE
	TeamStatsSummariesAverageDamageByPositions
SET 	teamId=$2, adc=$3, support=$4, solo=$5, jungle=$6
	WHERE id=TeamStatsSummariesAverageDamageByPositions.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getTeamStatsSummariesAverageDamageByPositions" (auto_id INT);
CREATE OR REPLACE FUNCTION "getTeamStatsSummariesAverageDamageByPositions" (auto_id INT)
	RETURNS TABLE (auto_id INT, teamId INT, adc NUMERIC, support NUMERIC, solo NUMERIC, jungle NUMERIC)
AS $$
SELECT auto_id, teamId, adc, support, solo, jungle
FROM
	TeamStatsSummariesAverageDamageByPositions
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllTeamStatsSummariesAverageDamageByPositions"();
CREATE OR REPLACE FUNCTION "getAllTeamStatsSummariesAverageDamageByPositions"()
RETURNS TABLE(auto_id INT, teamId INT, adc NUMERIC, support NUMERIC, solo NUMERIC, jungle NUMERIC)  AS $$
	SELECT auto_id, teamId, adc, support, solo, jungle
	FROM TeamStatsSummariesAverageDamageByPositions
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteTeamStatsSummariesAverageDamageByPositions" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteTeamStatsSummariesAverageDamageByPositions" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM TeamStatsSummariesAverageDamageByPositions WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------TeamStatsSummariesAverageDamageByPositions-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEvents" (gameId TEXT, type TEXT, _timestamp INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEvents" (gameId TEXT, type TEXT, _timestamp INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEvents
		WHERE
			GameTimelineFrameEvents.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEvents (gameId, type, _timestamp)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEvents" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEvents" (auto_id INT, gameId TEXT, type TEXT, _timestamp INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEvents
SET 	gameId=$2, type=$3, _timestamp=$4
	WHERE id=GameTimelineFrameEvents.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEvents" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEvents" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, type TEXT, _timestamp INT)
AS $$
SELECT auto_id, gameId, type, _timestamp
FROM
	GameTimelineFrameEvents
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEvents"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEvents"()
RETURNS TABLE(auto_id INT, gameId TEXT, type TEXT, _timestamp INT)  AS $$
	SELECT auto_id, gameId, type, _timestamp
	FROM GameTimelineFrameEvents
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEvents" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEvents" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEvents WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEvents-------------------

DROP FUNCTION IF EXISTS "addRuneImages" (runeId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addRuneImages" (runeId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			RuneImages
		WHERE
			RuneImages.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO RuneImages (runeId, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editRuneImages" (auto_id INT, runeId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editRuneImages" (auto_id INT, runeId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	RuneImages
SET 	runeId=$2, patch=$3, fullURL=$4, spriteURL=$5, x=$6, y=$7, w=$8, h=$9
	WHERE id=RuneImages.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getRuneImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "getRuneImages" (auto_id INT)
	RETURNS TABLE (auto_id INT, runeId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, runeId, patch, fullURL, spriteURL, x, y, w, h
FROM
	RuneImages
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllRuneImages"();
CREATE OR REPLACE FUNCTION "getAllRuneImages"()
RETURNS TABLE(auto_id INT, runeId INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, runeId, patch, fullURL, spriteURL, x, y, w, h
	FROM RuneImages
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteRuneImages" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteRuneImages" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM RuneImages WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------RuneImages-------------------

DROP FUNCTION IF EXISTS "addStickers" (id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "addStickers" (id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			Stickers
		WHERE
			Stickers.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO Stickers (id, patch, fullURL, spriteURL, x, y, w, h)
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editStickers" (auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT);
CREATE OR REPLACE FUNCTION "editStickers" (auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
	RETURNS VOID
AS $$
UPDATE
	Stickers
SET 	id=$2, patch=$3, fullURL=$4, spriteURL=$5, x=$6, y=$7, w=$8, h=$9
	WHERE id=Stickers.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getStickers" (auto_id INT);
CREATE OR REPLACE FUNCTION "getStickers" (auto_id INT)
	RETURNS TABLE (auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)
AS $$
SELECT auto_id, id, patch, fullURL, spriteURL, x, y, w, h
FROM
	Stickers
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllStickers"();
CREATE OR REPLACE FUNCTION "getAllStickers"()
RETURNS TABLE(auto_id INT, id INT, patch TEXT, fullURL TEXT, spriteURL TEXT, x INT, y INT, w INT, h INT)  AS $$
	SELECT auto_id, id, patch, fullURL, spriteURL, x, y, w, h
	FROM Stickers
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteStickers" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteStickers" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM Stickers WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------Stickers-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventEliteMonsterTypes" (monsterType TEXT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventEliteMonsterTypes" (monsterType TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventEliteMonsterTypes
		WHERE
			GameTimelineFrameEventEliteMonsterTypes.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventEliteMonsterTypes (monsterType)
		VALUES ($1)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventEliteMonsterTypes" (auto_id INT, monsterType TEXT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventEliteMonsterTypes" (auto_id INT, monsterType TEXT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventEliteMonsterTypes
SET 	monsterType=$2
	WHERE id=GameTimelineFrameEventEliteMonsterTypes.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventEliteMonsterTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventEliteMonsterTypes" (auto_id INT)
	RETURNS TABLE (auto_id INT, monsterType TEXT)
AS $$
SELECT auto_id, monsterType
FROM
	GameTimelineFrameEventEliteMonsterTypes
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventEliteMonsterTypes"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventEliteMonsterTypes"()
RETURNS TABLE(auto_id INT, monsterType TEXT)  AS $$
	SELECT auto_id, monsterType
	FROM GameTimelineFrameEventEliteMonsterTypes
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventEliteMonsterTypes" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventEliteMonsterTypes" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventEliteMonsterTypes WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventEliteMonsterTypes-------------------

DROP FUNCTION IF EXISTS "addChampionLores" (championId INT, patch TEXT, languageCode TEXT, lore TEXT);
CREATE OR REPLACE FUNCTION "addChampionLores" (championId INT, patch TEXT, languageCode TEXT, lore TEXT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			ChampionLores
		WHERE
			ChampionLores.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO ChampionLores (championId, patch, languageCode, lore)
		VALUES ($1, $2, $3, $4)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editChampionLores" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, lore TEXT);
CREATE OR REPLACE FUNCTION "editChampionLores" (auto_id INT, championId INT, patch TEXT, languageCode TEXT, lore TEXT)
	RETURNS VOID
AS $$
UPDATE
	ChampionLores
SET 	championId=$2, patch=$3, languageCode=$4, lore=$5
	WHERE id=ChampionLores.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getChampionLores" (auto_id INT);
CREATE OR REPLACE FUNCTION "getChampionLores" (auto_id INT)
	RETURNS TABLE (auto_id INT, championId INT, patch TEXT, languageCode TEXT, lore TEXT)
AS $$
SELECT auto_id, championId, patch, languageCode, lore
FROM
	ChampionLores
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllChampionLores"();
CREATE OR REPLACE FUNCTION "getAllChampionLores"()
RETURNS TABLE(auto_id INT, championId INT, patch TEXT, languageCode TEXT, lore TEXT)  AS $$
	SELECT auto_id, championId, patch, languageCode, lore
	FROM ChampionLores
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteChampionLores" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteChampionLores" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM ChampionLores WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------ChampionLores-------------------

DROP FUNCTION IF EXISTS "addGameTimelineFrameEventChampionKillAssists" (gameId TEXT, championKillEvent INT, assistingParticipantId INT);
CREATE OR REPLACE FUNCTION "addGameTimelineFrameEventChampionKillAssists" (gameId TEXT, championKillEvent INT, assistingParticipantId INT)
	RETURNS INT
AS $BODY$
DECLARE 
	_auto_id INT;
BEGIN
	IF EXISTS (
		SELECT
			$1
		FROM
			GameTimelineFrameEventChampionKillAssists
		WHERE
			GameTimelineFrameEventChampionKillAssists.auto_id = $1) THEN
		RETURN -1;
	ELSE
		INSERT INTO GameTimelineFrameEventChampionKillAssists (gameId, championKillEvent, assistingParticipantId)
		VALUES ($1, $2, $3)
	RETURNING auto_id INTO _auto_id
		RETURN _auto_id;
	END IF;
END;
$BODY$
LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "editGameTimelineFrameEventChampionKillAssists" (auto_id INT, gameId TEXT, championKillEvent INT, assistingParticipantId INT);
CREATE OR REPLACE FUNCTION "editGameTimelineFrameEventChampionKillAssists" (auto_id INT, gameId TEXT, championKillEvent INT, assistingParticipantId INT)
	RETURNS VOID
AS $$
UPDATE
	GameTimelineFrameEventChampionKillAssists
SET 	gameId=$2, championKillEvent=$3, assistingParticipantId=$4
	WHERE id=GameTimelineFrameEventChampionKillAssists.auto_id;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getGameTimelineFrameEventChampionKillAssists" (auto_id INT);
CREATE OR REPLACE FUNCTION "getGameTimelineFrameEventChampionKillAssists" (auto_id INT)
	RETURNS TABLE (auto_id INT, gameId TEXT, championKillEvent INT, assistingParticipantId INT)
AS $$
SELECT auto_id, gameId, championKillEvent, assistingParticipantId
FROM
	GameTimelineFrameEventChampionKillAssists
	WHERE auto_id=$1
$$LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "getAllGameTimelineFrameEventChampionKillAssists"();
CREATE OR REPLACE FUNCTION "getAllGameTimelineFrameEventChampionKillAssists"()
RETURNS TABLE(auto_id INT, gameId TEXT, championKillEvent INT, assistingParticipantId INT)  AS $$
	SELECT auto_id, gameId, championKillEvent, assistingParticipantId
	FROM GameTimelineFrameEventChampionKillAssists
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;

DROP FUNCTION IF EXISTS "deleteGameTimelineFrameEventChampionKillAssists" (auto_id INT);
CREATE OR REPLACE FUNCTION "deleteGameTimelineFrameEventChampionKillAssists" (auto_id INT)
	RETURNS VOID
AS $$ DELETE FROM GameTimelineFrameEventChampionKillAssists WHERE auto_id=$1;
$$
LANGUAGE sql VOLATILE NOT LEAKPROOF;

-------------------GameTimelineFrameEventChampionKillAssists-------------------

