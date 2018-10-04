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

DROP TABLE IF EXISTS PlayerBios;
CREATE TABLE PlayerBios (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	bio TEXT
);

DROP TABLE IF EXISTS PlayerSocialNetworks;
CREATE TABLE PlayerSocialNetworks (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	networkName TEXT,
	url TEXT
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

DROP TABLE IF EXISTS PlayerTournamentStats;
CREATE TABLE PlayerTournamentStats(
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	teamId INT REFERENCES Teams(id),
	name TEXT,
	position TEXT,
	teamAcronym TEXT,
	gamesPlayed INT,
	kda NUMERIC,
	kills INT,
	deaths INT,
	assists INT,
	killParticipation NUMERIC,
	csPerMin NUMERIC,
	cs INT,
	minutesPlayed INT
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
 	languageCode TEXT REFERENCES LanguageCodes(languageCode),
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
 	languageCode TEXT REFERENCES LanguageCodes(languageCode),
 	about TEXT
);

DROP TABLE IF EXISTS LeagueNames;
CREATE TABLE LeagueNames(
	auto_id SERIAL PRIMARY KEY,
	leagueId INT REFERENCES Leauges(id),
 	languageCode TEXT REFERENCES LanguageCodes(languageCode),
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

DROP TABLE IF EXISTS Videos;
CREATE TABLE Videos(
	auto_id SERIAL,
	id INT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	gameId TEXT REFERENCES Games(id),
	matchId TEXT REFERENCES Matches(id),
	url TEXT,
	locale TEXT, -- languageCode TEXT REFERENCES LanguageCodes(languageCode)
);
----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------- STATIC DATA ------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS LanguageCodes;
CREATE TABLE LanguageCodes(
	auto_id SERIAL,
	languageCode TEXT PRIMARY KEY,
	language TEXT,
);

DROP TABLE IF EXISTS Languages; --- Better name
CREATE TABLE Languages(
	auto_id SERIAL PRIMARY KEY,
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	language TEXT,
);

DROP TABLE IF EXISTS Patches;
CREATE TABLE Patches(
	auto_id SERIAL,
	patch TEXT PRIMARY KEY,
);

DROP TABLE IF EXISTS Items;
CREATE TABLE Items(
	auto_id SERIAL,
	patch TEXT PRIMARY KEY,
	id INT,
	requiredChampion INT REFERENCES Champions(id),
	inStore BOOLEAN,
	baseGold INT,
	purchasable BOOLEAN,
	totalGold INT,
	sellGold INT,
	hideFromAll BOOLEAN,
	specialRecipie INT REFERENCES .... (id)
);

DROP TABLE IF EXISTS ItemNames;
CREATE TABLE ItemNames(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Patches(patch),
	anguageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS ItemDescriptions;
CREATE TABLE ItemDescriptions(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Patches(patch),
	anguageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT,
);

DROP TABLE IF EXISTS ItemPlaintexts;
CREATE TABLE ItemPlaintexts(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Patches(patch),
	anguageCode TEXT REFERENCES LanguageCodes(languageCode),
	plaintext TEXT,
);

DROP TABLE IF EXISTS ItemTags;
CREATE TABLE ItemTags(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Items(patch),
	tag TEXT,
);

DROP TABLE IF EXISTS ItemEffects;
CREATE TABLE ItemEffects(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Items(patch),
	effectIndex INT,
	effectValue INT,
);

DROP TABLE IF EXISTS ItemMaps;
CREATE TABLE ItemMaps(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Items(patch),
	mapId INT REFERENCES Maps(id),
);

DROP TABLE IF EXISTS ItemStats;
CREATE TABLE ItemStats(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Items(patch),
	statId INT REFERENCES I.....(id),
);

DROP TABLE IF EXISTS ItemBuildIntos;
CREATE TABLE ItemBuildIntos(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Items(patch),
	intoItemId INT REFERENCES Items(id),
);

DROP TABLE IF EXISTS ItemBuiltFroms;
CREATE TABLE ItemBuiltFroms(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Items(patch),
	fromItemId INT REFERENCES Items(id),
);

DROP TABLE IF EXISTS ItemImages;
CREATE TABLE ItemImages(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(id),
	patch TEXT REFERENCES Items(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);

DROP TABLE IF EXISTS Champions;
CREATE TABLE Champions(
	auto_id SERIAL PRIMARY KEY,
	patch TEXT REFERENCES Patches(patch),
	id INT,
	parType TEXT,

);

DROP TABLE IF EXISTS ChampionNames;
CREATE TABLE ChampionNames(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS ChampionTitles;
CREATE TABLE ChampionTitles(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	title TEXT,
);

DROP TABLE IF EXISTS ChampionLores;
CREATE TABLE ChampionLores(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	lore TEXT,
);

DROP TABLE IF EXISTS ChampionBlurbs;
CREATE TABLE ChampionBlurbs(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	blurb TEXT,
);

DROP TABLE IF EXISTS ChampionAllyTips;
CREATE TABLE ChampionAllyTips(
	auto_id SERIAL PRIMARY KEY,
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tip TEXT,
);

DROP TABLE IF EXISTS ChampionEnemyTips;
CREATE TABLE ChampionEnemyTips(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tip TEXT,
);

DROP TABLE IF EXISTS ChampionInfos;
CREATE TABLE ChampionInfos(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	attack INT,
	defense INT,
	magic INT,
	dificulty INT,
);

DROP TABLE IF EXISTS ChampionTags;
CREATE TABLE ChampionTags(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch)
	tag TEXT,
);

DROP TABLE IF EXISTS ChampionStats;
CREATE TABLE ChampionStats(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch)
	hp INT,
	hpPerLevel INT,
	mp INT,
	mpPerLevel INT,
	moveSpeed INT,
	armor INT,
	armorPerLevel NUMERIC,
	spellBlock NUMERIC,
	spellBlockPerLevel NUMERIC,
	attackRange NUMERIC,
	hpRegen NUMERIC,
	hpRegenPerLevel NUMERIC,
	mpRegen NUMERIC,
	mpRegenPerLevel NUMERIC,
	crit NUMERIC,
	critPerLevel NUMERIC,
	attackDamage NUMERIC,
	attackDamage NUMERIC,
	attackSpeedOffset NUMERIC,
	attackSpeedPerLevel NUMERIC
);

DROP TABLE IF EXISTS ChampionSkins;
CREATE TABLE ChampionSkins(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
	num INT,
	hasChromas BOOLEAN,
);

DROP TABLE IF EXISTS ChampionSquareImages;
CREATE TABLE ChampionSquareImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	imageURL TEXT,
);

DROP TABLE IF EXISTS ChampionSplashImages;
CREATE TABLE ChampionSplashImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	skinId INT REFERENCES ChampionSkins(id),
	imageURL TEXT,
);

DROP TABLE IF EXISTS ChampionLoadingImages;
CREATE TABLE ChampionLoadingImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	skinId INT REFERENCES ChampionSkins(id),
	imageURL TEXT,
);

DROP TABLE IF EXISTS ChampionSprites;
CREATE TABLE ChampionLoadingImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	imageURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT
);

DROP TABLE IF EXISTS ChampionSpells;
CREATE TABLE ChampionSpells(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	cooldownBurn TEXT,
	costBurn TEXT,
	costType TEXT,
	maxAmmo TEXT,
	rangeBurn TEXT,

);

DROP TABLE IF EXISTS ChampionSpellNames;
CREATE TABLE ChampionSpellNames(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	spellId TEXT REFERENCES ChampionSpells(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS ChampionSpellDescriptions;
CREATE TABLE ChampionSpellDescriptions(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT,
);

DROP TABLE IF EXISTS ChampionSpellTooltips;
CREATE TABLE ChampionSpellTooltips(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	spellId TEXT REFERENCES ChampionSpells(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tooltip TEXT,
);

DROP TABLE IF EXISTS ChampionSpellResources;
CREATE TABLE ChampionSpellResources(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	spellId TEXT REFERENCES ChampionSpells(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	resource TEXT,
);

DROP TABLE IF EXISTS ChampionSpellEffects;
CREATE TABLE ChampionSpellResources(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	spellId TEXT REFERENCES ChampionSpells(id),
	patch TEXT REFERENCES Patches(patch),
	effectIndex INT,
	effectBurnValue TEXT,
);

DROP TABLE IF EXISTS ChampionSpellLevelTipLabels;
CREATE TABLE ChampionSpellLevelTipLabels(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	spellId TEXT REFERENCES ChampionSpells(id),
	patch TEXT REFERENCES Patches(patch),
	labelIndex INT,
	label TEXT
);

DROP TABLE IF EXISTS ChampionSpellLevelTipEffects;
CREATE TABLE ChampionSpellLevelTipEffects(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	spellId TEXT REFERENCES ChampionSpells(id),
	patch TEXT REFERENCES Patches(patch),
	effectIndex INT,
	effect TEXT
);

DROP TABLE IF EXISTS ChampionSpellImages;
CREATE TABLE ChampionSpellImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	spellId TEXT REFERENCES ChampionSpells(id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT, 
	w INT,
	h INT,
);

DROP TABLE IF EXISTS ChampionPassiveNames;
CREATE TABLE ChampionPassiveNames(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS ChampionPassiveDescriptions;
CREATE TABLE ChampionPassiveDescriptions(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT,
);

DROP TABLE IF EXISTS ChampionPassiveImages;
CREATE TABLE ChampionPassiveImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);

------------------------
DROP TABLE IF EXISTS Runes;
CREATE TABLE Runes(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch REFERENCES Patches(patch),
	tier INT,
	type TEXT, -- References rune types? idk just 3ish
	colloq TEXT, --??
	plaintext TEXT, --??
);

DROP TABLE IF EXISTS RuneNames;
CREATE TABLE RuneNames(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(id),
	patch REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS RuneDescriptions;
CREATE TABLE RuneDescriptions(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(id),
	patch REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS RuneTags;
CREATE TABLE RuneTags(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(id),
	patch REFERENCES Patches(patch),
	tag TEXT,
);

DROP TABLE IF EXISTS RuneStats;
CREATE TABLE RuneStats(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(id),
	patch REFERENCES Patches(patch),
	stat TEXT, -- ? Probably a better name for this
	statValue NUMERIC,
);

DROP TABLE IF EXISTS RuneImages;
CREATE TABLE RuneImages(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(id),
	patch REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);

DROP TABLE IF EXISTS RunesReforged;
CREATE TABLE RunesReforged(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	key TEXT,
	patch TEXT REFERENCES Patches(patch),
	iconURL TEXT,
);

DROP TABLE IF EXISTS RunesReforgedName;
CREATE TABLE RunesReforgedName(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedId INT REFERENCES RunesReforged(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS RunesReforgedRunes;
CREATE TABLE RunesReforgedRunes(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	key TEXT,
	runesReforgedId INT REFERENCES RunesReforged(id),
	patch TEXT REFERENCES Patches(patch),
	slotIndex INT,
	iconURL TEXT
);

DROP TABLE IF EXISTS RunesReforgedRuneNames;
CREATE TABLE RunesReforgedRuneNames(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedRuneId INT REFERENCES RunesReforgedRunes(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS RunesReforgedRuneShortDescriptions;
CREATE TABLE RunesReforgedRuneShortDescriptions(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedRuneId INT REFERENCES RunesReforgedRunes(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	shortDescription TEXT,
);

DROP TABLE IF EXISTS RunesReforgedRuneLongDescriptions;
CREATE TABLE RunesReforgedRuneLongDescriptions(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedRuneId INT REFERENCES RunesReforgedRunes(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	longDescription TEXT,
);

DROP TABLE IF EXISTS Masteries;
CREATE TABLE Masteries(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	ranks INT,
	prereq INT REFERENCES Masteries(id),
	branchName TEXT,
	columnIndex INT,
	rowIndex INT,
);

DROP TABLE IF EXISTS MasteryNames;
CREATE TABLE MasteryNames(
	auto_id SERIAL PRIMARY KEY,
	masteryId INT,
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS MasteryDescriptions;
CREATE TABLE MasteryDescriptions(
	auto_id SERIAL PRIMARY KEY,
	masteryId INT,
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT,
	descriptionIndex INT
);


DROP TABLE IF EXISTS MasteryImages;
CREATE TABLE MasteryImages(
	auto_id SERIAL PRIMARY KEY,
	masteryId INT,
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);

DROP TABLE IF EXISTS SummonerSpells;
CREATE TABLE SummonerSpells(
	auto_id SERIAL PRIMARY KEY,
	id TEXT,
	patch TEXT REFERENCES Patches(patch),
	maxRank INT,
	cooldownBurn TEXT,
	costBurn TEXT,
	summonerLevel INT,
	costType TEXT,
	maxAmmo INT,
	rangeBurn TEXT,
	resource TEXT, 
);

DROP TABLE IF EXISTS SummonerSpellNames;
CREATE TABLE SummonerSpellNames(
	auto_id SERIAL PRIMARY KEY,
	summonerId TEXT REFERENCES SummonerSpells(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
);

DROP TABLE IF EXISTS SummonerSpellDescriptions;
CREATE TABLE SummonerSpellDescriptions(
	auto_id SERIAL PRIMARY KEY,
	summonerId TEXT REFERENCES SummonerSpells(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT,
);

DROP TABLE IF EXISTS SummonerSpellTooltips;
CREATE TABLE SummonerSpellTooltips(
	auto_id SERIAL PRIMARY KEY,
	summonerId TEXT REFERENCES SummonerSpells(id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tooltip TEXT,
);


DROP TABLE IF EXISTS SummonerSpellModes;
CREATE TABLE SummonerSpellModes(
	auto_id SERIAL PRIMARY KEY,
	summonerId TEXT REFERENCES SummonerSpells(id),
	patch TEXT REFERENCES Patches(patch),
	mode TEXT,
);

DROP TABLE IF EXISTS SummonerSpellImages;
CREATE TABLE SummonerSpellImages(
	auto_id SERIAL PRIMARY KEY,
	summonerId TEXT REFERENCES SummonerSpells(id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);

DROP TABLE IF EXISTS Maps;
CREATE TABLE Maps(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	name TEXT,
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);

DROP TABLE IF EXISTS MapUnpurchasableItems;
CREATE TABLE MapUnpurchasableItems(
	auto_id SERIAL PRIMARY KEY,
	mapId INT REFERENCES Maps(id),
	patch TEXT REFERENCES Patches(patch),
	itemId INT REFERENCES Items(id),
);

DROP TABLE IF EXISTS ProfileIcons;
CREATE TABLE ProfileIcons(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);

DROP TABLE IF EXISTS Stickers;
CREATE TABLE Stickers(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT,
);