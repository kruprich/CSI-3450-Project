DROP TABLE IF EXISTS PlayerBios;
CREATE TABLE PlayerBios (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	languageCode TEXT,
	bio TEXT
);

DROP TABLE IF EXISTS PlayerSocialNetworks;
CREATE TABLE PlayerSocialNetworks (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	networkName TEXT,
	url TEXT
);

DROP TABLE IF EXISTS Players;
CREATE TABLE Players(
	id INT PRIMARY KEY,
	firstName TEXT,
	lastName TEXT,
	inGameName TEXT,
	photoURL TEXT,
	hometown TEXT,
	region INT,
	birthdate TIMESTAMP WITH TIME ZONE,
);

DROP TABLE IF EXISTS PlayerStatsSummaries;
CREATE TABLE PlayerStatsSummaries(
	id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players (id),
	kdsRatio NUMERIC,
	kdaRatioRank INT,
	csPerTenMinutes NUMERIC,
	csPerTenMinutesRank INT,
	killParticipation NUMERIC,
	killParticipationRank INT,
	mostPlayedChampionsId TEXT,
);

DROP TABLE IF EXISTS PlayerStatsSummariesMostPlayedChampions;
CREATE TABLE PlayerStatsSummariesMostPlayedChampions(
	auto_id SERIAL PRIMARY KEY,
	playerStatsSummaryId INT REFERENCES PlayerStatsSummaries(id),
	championId REFERENCES Champions(id),
	wins INT,
	losses INT,
	total INT,
	kdaRatioRank NUMERIC
);

DROP TABLE IF EXISTS TeamStatsSummaries;
CREATE TABLE TeamStatsSummaries(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	kdsRatio NUMERIC,
	kdaRatioRank INT,
	averageWinLength NUMERIC,
	averageWinLengthRank INT,
	firstDragonKillRatio NUMERIC,
	firstDragonKillRatioRank INT,
	firstTowerRatio NUMERIC,
	firstTowerRatioRank INT,
);

-- Percetage
DROP TABLE IF EXISTS TeamStatsSummariesAverageDamageByPositions;
CREATE TABLE TeamStatsSummariesAverageDamageByPositions(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	adc NUMERIC,
	support NUMERIC,
	solo NUMERIC,
	jungle NUMERIC,
);

DROP TABLE IF EXISTS TeamRosterStats;
CREATE TABLE TeamRosterStats(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	playerId INT REFERENCES Players(id),
	gamesPlayed INT,
	averageAssists NUMERIC,
	averageDeaths NUMERIC,
	averageKills NUMERIC,
	averageKillParticipation NUMERIC,
	summonerName TEXT
);

DROP TABLE IF EXISTS TeamRosterStatsChampions;
CREATE TABLE TeamRosterStatsChampions(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	playerId INT REFERENCES Players(id),
	championId INT REFERENCES Champions(id)
);

DROP TABLE IF EXISTS TeamStatsHistories;
CREATE TABLE TeamStatsHistories(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	_timestamp NUMERIC,
	assists INT,
	deaths INT,
	kills INT,
	win BOOLEAN,
	matchId TEXT REFERENCES Matches(id),
	teamId INT REFERENCES Teams(id),
	opponentTeamId INT REFERENCES Teams(id),
	gameId TEXT REFERENCES Games(id)
);

DROP TABLE IF EXISTS TeamStatsHistoriesChampions;
CREATE TABLE TeamStatsHistoriesChampions(
	auto_id SERIAL PRIMARY KEY,
	teamStatsHistoriesId TEXT REFERENCES TeamStatsHistories(id),
	championId INT REFERENCES Champions(id)
);

DROP TABLE IF EXISTS Team;
CREATE TABLE Teams(
 	auto_id SERIAL,
 	id INT PRIMARY KEY,
 	name TEXT,
 	photoURL TEXT,
 	logoURL TEXT,
 	acronym TEXT,
  	altLogoURL TEXT,
  	homeLeague INT REFERENCES Leagues(id)
);

DROP TABLE IF EXISTS TeamBios;
CREATE TABLE TeamBios(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	languageCode TEXT,
 	bio TEXT
);

DROP TABLE IF EXISTS TeamStarters;
CREATE TABLE TeamStarters(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
	playerId INT REFERENCES Players(id)
);

DROP TABLE IF EXISTS TeamSubs;
CREATE TABLE TeamSubs(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	playerId INT REFERENCES Players(id)
);

DROP TABLE IF EXISTS TeamPlayers;
CREATE TABLE TeamPlayers(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	playerId INT REFERENCES Players(id)
);

DROP TABLE IF EXISTS PlayerStatsHistories;
CREATE TABLE PlayerStatsHistories(
	auto_id SERIAL;
	id TEXT PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	championId INT REFERENCES Champions(id),
	_timestamp NUMERIC,
	assists INT,
	deaths INT,
	kills INT,
	csPerTenMinutes NUMERIC,
	kdaRatio NUMERIC,
	killParticipation INT,
	win BOOLEAN,
	matchId TEXT Matches(id),
	teamId INT REFERENCES Teams(id),
	opponentTeamId INT REFERENCES Teams(id),
	gameId TEXT REFERENCES Games(id),
);

DROP TABLE IF EXISTS Tournaments;
CREATE TABLE Tournaments(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	title TEXT,
	description TEXT,
	leagueId INT REFERENCES Leagues(id),
);

DROP TABLE IF EXISTS TournamentTeams;
CREATE TABLE TournamentTeams(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT, -- Acronym
	teamId INT REFERENCES Teams(id)
);

DROP TABLE IF EXISTS TournamentBrackets;
CREATE TABLE TournamentBrackets(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT,
	groupPosition INT,
	groupName TEXT,

);

DROP TABLE IF EXISTS TournamentBracketTypes;
CREATE TABLE TournamentBracketTypes(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	type TEXT,
	rounds INT,
);

DROP TABLE IF EXISTS TournamentBracketMatchTypes
CREATE TABLE TournamentBracketMatchTypes(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	type TEXT,
	bestOf INT,
);

DROP TABLE IF EXISTS TournamentBracketRosters;
CREATE TABLE TournamentBracketRosters(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	roster TEXT REFERENCES TournamentRosters(id),
);

DROP TABLE IF EXISTS TournamentRosters;
CREATE TABLE TournamentRosters(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT,
	teamId INT REFERENCES Teams(id),
	tournamentId TEXT REFERENCES Tournaments(id)
);

DROP TABLE IF EXISTS LeagueAbouts;
CREATE TABLE LeagueAbouts(
	auto_id SERIAL PRIMARY KEY,
	leagueId INT REFERENCES Leauges(id),
 	languageCode TEXT,
 	about TEXT
);

DROP TABLE IF EXISTS LeagueNames;
CREATE TABLE LeagueNames(
	auto_id SERIAL PRIMARY KEY,
	leagueId INT REFERENCES Leauges(id),
 	languageCode TEXT,
 	name TEXT
);

DROP TABLE IF EXISTS LeagueTournamentRecords;
CREATE TABLE LeagueTournamentRecords(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	roster TEXT REFERENCES TournamentRosters(id),
	wins INT,
	losses INT,
	ties INT,
	score INT
);

DROP TABLE IF EXISTS Leagues;
CREATE TABLE Leagues(
	auto_id SERIAL,
	id INT PRIMARY KEY,
	guid TEXT,
	name TEXT,
	logoURL TEXT,
);

DROP TABLE IF EXISTS Matches;
CREATE TABLE Matches(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	name TEXT,
	position INT,

);

DROP TABLE IF EXISTS Games;
CREATE TABLE Games(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	matchId TEXT REFERENCES Matches(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	tournamentId TEXT REFERENCES Tournaments(id),
	name TEXT,
);

DROP TABLE IF EXISTS GameStats;
CREATE TABLE GameStats(
	auto_id SERIAL,
	gameId TEXT PRIMARY KEY REFERENCES Games(id),
	platformId TEXT,
	gameCreation NUMERIC,
	gameDuration INT,
	mapId INT REFERENCES Maps(id),
	seasonId INT,
	gameVersion TEXT, -- relates to patch #
	gameMode TEXT, -- create game mode type table, ref it
);

DROP TABLE IF EXISTS GameStatTeams;
CREATE TABLE GameStatTeams(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	teamId INT, -- is 100 and 200, we can modify this to be the actual teamid
	win BOOLEAN,
	firstBlood BOOLEAN,
	firstTower BOOLEAN,
	firstInhibitor BOOLEAN,
	firstBaron BOOLEAN,
	firstDragon BOOLEAN,
	firstRiftHerald BOOLEAN,
	towerKills INT,
	inhibitorKills INT,
	baronKils INT,
	dragonKills INT,
	vilemawKills INT,
	riftHeraldKills INT,
	dominionVictoryScore INT,
);

DROP TABLE IF EXISTS GameStatTeamBans;
CREATE TABLE GameStatTeamBans(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	teamId INT REFERENCES GameStatTeams(teamId),
	championId INT REFERENCES Champions(id),
	pickTurn INT,
);

DROP TABLE IF EXISTS GameStatsParticipants;
CREATE TABLE GameStatsParticipants(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	participantId INT,
	summonerName TEXT,
	profileIcon INT,
	teamId INT,
	championId INT REFERENCES Champions(id),
	spell1Id INT REFERENCES SummonerSpells(id),
	spell2Id INT REFERENCES SummonerSpells(id),
	...
);

DROP TABLE IF EXISTS GameTimelines;
CREATE TABLE GameTimelines(
	auto_id SERIAL,
	gameId TEXT PRIMARY KEY REFERENCES Games(id),
	frameInterval INT,
);

DROP TABLE IF EXISTS GameTimelineFrameEventWardPlaced;
CREATE TABLE GameTimelineFrameEventWardPlaced(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	wardType TEXT REFERENCES GameTimelineFrameEventWardTypes(wardType),
	creatorId INT REFERENCES ...., (participantId),
);

DROP TABLE IF EXISTS GameTimelineFrameEventWardKill;
CREATE TABLE GameTimelineFrameEventWardKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	wardType TEXT REFERENCES GameTimelineFrameEventWardTypes(wardType),
	killerId INT REFERENCES ...., (participantId),
);

DROP TABLE IF EXISTS GameTimelineFrameEventItemPurchased;
CREATE TABLE GameTimelineFrameEventItemPurchased(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	itemId TEXT REFERENCES Items(id),
	participantId INT REFERENCES ...., (participantId),
);

DROP TABLE IF EXISTS GameTimelineFrameEventItemSold;
CREATE TABLE GameTimelineFrameEventItemSold(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	itemId TEXT REFERENCES Items(id),
	participantId INT REFERENCES ...., (participantId),
);

DROP TABLE IF EXISTS GameTimelineFrameEventItemDestroyed;
CREATE TABLE GameTimelineFrameEventItemDestroyed(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	itemId TEXT REFERENCES Items(id),
	participantId INT REFERENCES ...., (participantId),
);

DROP TABLE IF EXISTS GameTimelineFrameEventSkillLevelUp;
CREATE TABLE GameTimelineFrameEventSkillLevelUp(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	skillSlot INT,
	participantId INT REFERENCES ...., (participantId),
	levelUpType TEXT,
);

DROP TABLE IF EXISTS GameTimelineFrameEventBuildingKill;
CREATE TABLE GameTimelineFrameEventBuildingKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	xPosition INT,
	yPosition INT,
	killerId INT REFERENCES ...., (participantId),
	teamId INT,
	buildingType TEXT,
	laneType TEXT,
	towerType TEXT,
	-- assistingParticipantsId -- Make new table
);

DROP TABLE IF EXISTS GameTimelineFrameEventChampionKill;
CREATE TABLE GameTimelineFrameEventChampionKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	xPosition INT,
	yPosition INT,
	killerId INT REFERENCES ...., (participantId),
	victimId INT REFERENCES ...., (participantId),
	-- assistingParticipantsId -- Make new table
);

DROP TABLE IF EXISTS GameTimelineFrameEventEliteMonsterKill;
CREATE TABLE GameTimelineFrameEventEliteMonsterKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	xPosition INT,
	yPosition INT,
	killerId INT REFERENCES ...., (participantId),
	monsterType TEXT,
	monsterSubType TEXT,
	-- assistingParticipantsId -- Make new table?????????
);


DROP TABLE IF EXISTS GameTimelineFrameEventEliteMonsterTypes;
CREATE TABLE GameTimelineFrameEventEliteMonsterTypes(
	auto_id SERIAL,
	monsterType TEXT PRIMARY KEY,
);

DROP TABLE IF EXISTS GameTimelineFrameEventEliteMonsterSubTypes;
CREATE TABLE GameTimelineFrameEventEliteMonsterSubTypes(
	auto_id SERIAL,
	monsterSubType TEXT PRIMARY KEY,
);


DROP TABLE IF EXISTS GameTimelineFrameEventTypes;
CREATE TABLE GameTimelineFrameEventTypes(
	auto_id SERIAL,
	type TEXT PRIMARY KEY,
);

DROP TABLE IF EXISTS GameTimelineFrameEventWardTypes;
CREATE TABLE GameTimelineFrameEventWardTypes(
	auto_id SERIAL,
	wardType TEXT PRIMARY KEY,
);

DROP TABLE IF EXISTS GameTimelineFrameEvents;
CREATE TABLE GameTimelineFrameEvents(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT REFERENCES GameTimelineFrameEventTypes(type),
	_timestamp INT,
);

DROP TABLE IF EXISTS GameTimelineFrameParticipantFrames;
CREATE TABLE GameTimelineFrameParticipantFrames(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	participantId INT, -- Maybe add/change to playerId
	xPosition INT,
	yPosition INT,
	currentGold INT,
	totalGold INT,
	level INT,
	xp INT,
	minionsKilled INT,
	jungleMinionsKilled INT,
	dominionScore INT,
	teamScore INT,
	_timestamp INT,
);


-------------------- THESE ARE EXAMPLES. THEY ARE NOT CORRECT. NEED TO BE UPDATED -------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
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

DROP FUNCTION IF EXISTS "getSpecificPlayer"(id INT);
CREATE OR REPLACE FUNCTION "getSpecificPlayer"(id INT) 
RETURNS TABLE(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP) AS $$
		SELECT id, firstName, lastName, inGameName, photoURL, region, birthdate, birthdate
		FROM Players
		WHERE id=$1
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;
