DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Leagues;
DROP TABLE IF EXISTS Tournaments;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS GameTimeline;
DROP TABLE IF EXISTS GameStats;
DROP TABLE IF EXISTS Articles;
DROP TABLE IF EXISTS Marquees;
DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Streamgroups;
DROP TABLE IF EXISTS PlayerStatsHistories;
DROP TABLE IF EXISTS PlayerBios;
DROP TABLE IF EXISTS PlayerSocialNetworks;
DROP TABLE IF EXISTS PlayerStatsSummaries;
DROP TABLE IF EXISTS PlayerStatsSummariesMostPlayedChampions;

CREATE TABLE PlayerBios (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	languageCode TEXT,
	bio TEXT
);

CREATE TABLE PlayerSocialNetworks (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	networkName TEXT,
	url TEXT
);

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

CREATE TABLE PlayerStatsSummariesMostPlayedChampions(
	auto_id SERIAL PRIMARY KEY,
	playerStatsSummaryId INT REFERENCES PlayerStatsSummaries(id),
	championId REFERENCES Champions(id),
	wins INT,
	losses INT,
	total INT,
	kdaRatioRank NUMERIC
);

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
CREATE TABLE TeamStatsSummariesAverageDamageByPositions(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	adc NUMERIC,
	support NUMERIC,
	solo NUMERIC,
	jungle NUMERIC,
);

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

CREATE TABLE TeamRosterStatsChampions(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	playerId INT REFERENCES Players(id),
	championId INT REFERENCES Champions(id)
);

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

CREATE TABLE TeamStatsHistoriesChampions(
	auto_id SERIAL PRIMARY KEY,
	teamStatsHistoriesId TEXT REFERENCES TeamStatsHistories(id),
	championId INT REFERENCES Champions(id)
);

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

 CREATE TABLE TeamBios(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	languageCode TEXT,
 	bio TEXT
 );

 CREATE TABLE TeamStarters(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	playerId INT REFERENCES Players(id)
 );

 CREATE TABLE TeamSubs(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	playerId INT REFERENCES Players(id)
 );

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


CREATE TABLE Tournaments(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	title TEXT,
	description TEXT,
	leagueId INT REFERENCES Leagues(id),
);

CREATE TABLE TournamentTeams(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT, -- Acronym
	teamId INT REFERENCES Teams(id)
);

CREATE TABLE TournamentBrackets(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT,
	groupPosition INT,
	groupName TEXT,

);

CREATE TABLE TournamentBracketTypes(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	type TEXT,
	rounds INT,
);

CREATE TABLE TournamentBracketMatchTypes(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	type TEXT,
	bestOf INT,
);

CREATE TABLE TournamentBracketRosters(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	roster TEXT REFERENCES TournamentRosters(id),
);

CREATE TABLE TournamentRosters(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT,
	teamId INT REFERENCES Teams(id),
	tournamentId TEXT REFERENCES Tournaments(id)
);

CREATE TABLE LeagueAbouts(
	auto_id SERIAL PRIMARY KEY,
	leagueId INT REFERENCES Leauges(id),
 	languageCode TEXT,
 	about TEXT
);

CREATE TABLE LeagueNames(
	auto_id SERIAL PRIMARY KEY,
	leagueId INT REFERENCES Leauges(id),
 	languageCode TEXT,
 	name TEXT
);

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

CREATE TABLE Leagues(
	auto_id SERIAL,
	id INT PRIMARY KEY,
	guid TEXT,
	name TEXT,
	logoURL TEXT,
);

CREATE TABLE Matches(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	name TEXT,
	position INT,

);

CREATE TABLE Games(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	matchId TEXT REFERENCES Matches(id),
	name TEXT,
);

---------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS "addPlayer"(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE);
CREATE OR REPLACE FUNCTION "addPlayer"(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE)
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
RETURNS TABLE(id INT, firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP WITH TIME ZONE) AS $$
		SELECT id, firstName, lastName, inGameName, photoURL, region, birthdate, birthdate
		FROM Players
		WHERE id=$1
$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;
