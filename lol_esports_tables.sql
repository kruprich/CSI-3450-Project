DROP TABLE IF EXISTS LanguageCodes CASCADE;
DROP TABLE IF EXISTS Patches CASCADE;
DROP TABLE IF EXISTS LanguageItems CASCADE;
DROP TABLE IF EXISTS Leagues CASCADE;
DROP TABLE IF EXISTS Tournaments CASCADE;
DROP TABLE IF EXISTS Players CASCADE;
DROP TABLE IF EXISTS Teams CASCADE;
DROP TABLE IF EXISTS TournamentBrackets CASCADE;
DROP TABLE IF EXISTS Matches CASCADE;
DROP TABLE IF EXISTS Games CASCADE;
DROP TABLE IF EXISTS Champions CASCADE;
DROP TABLE IF EXISTS Items CASCADE;
DROP TABLE IF EXISTS SummonerSpells CASCADE;
DROP TABLE IF EXISTS Maps CASCADE;
DROP TABLE IF EXISTS ProfileIcons CASCADE;
DROP TABLE IF EXISTS Stickers CASCADE;
DROP TABLE IF EXISTS Runes CASCADE;
DROP TABLE IF EXISTS RunesReforged CASCADE;
DROP TABLE IF EXISTS Masteries CASCADE;
DROP TABLE IF EXISTS PlayerTournamentStats CASCADE;
DROP TABLE IF EXISTS PlayerBios CASCADE;
DROP TABLE IF EXISTS PlayerSocialNetworks CASCADE;
DROP TABLE IF EXISTS PlayerStatsSummaries CASCADE;
DROP TABLE IF EXISTS PlayerStatsSummariesMostPlayedChampions CASCADE;
DROP TABLE IF EXISTS TeamStatsSummaries CASCADE;
DROP TABLE IF EXISTS TeamStatsSummariesAverageDamageByPositions CASCADE;
DROP TABLE IF EXISTS TeamRosterStats CASCADE;
DROP TABLE IF EXISTS TeamRosterStatsChampions CASCADE;
DROP TABLE IF EXISTS TeamStatsHistories CASCADE;
DROP TABLE IF EXISTS TeamStatsHistoriesChampions CASCADE;
DROP TABLE IF EXISTS TeamBios CASCADE;
DROP TABLE IF EXISTS TeamStarters CASCADE;
DROP TABLE IF EXISTS TeamSubs CASCADE;
DROP TABLE IF EXISTS TeamPlayers CASCADE;
DROP TABLE IF EXISTS PlayerStatsHistories CASCADE;
DROP TABLE IF EXISTS TournamentTeams CASCADE;
DROP TABLE IF EXISTS TournamentBracketTypes CASCADE;
DROP TABLE IF EXISTS TournamentBracketMatchTypes CASCADE;
DROP TABLE IF EXISTS TournamentRosters CASCADE;
DROP TABLE IF EXISTS TournamentBracketRosters CASCADE;
DROP TABLE IF EXISTS LeagueAbouts CASCADE;
DROP TABLE IF EXISTS LeagueNames CASCADE;
DROP TABLE IF EXISTS LeagueTournamentRecords CASCADE;
DROP TABLE IF EXISTS GameStats CASCADE;
DROP TABLE IF EXISTS GameStatTeams CASCADE;
DROP TABLE IF EXISTS GameStatTeamBans CASCADE;
DROP TABLE IF EXISTS GameStatsParticipants CASCADE;
DROP TABLE IF EXISTS GameStatsParticipantMasteries CASCADE;
DROP TABLE IF EXISTS GameStatsParticipantRunes CASCADE;
DROP TABLE IF EXISTS GameStatsParticipantStats CASCADE;
DROP TABLE IF EXISTS GameTimelines CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventWardTypes CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventWardPlaced CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventWardKill CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventItemPurchased CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventItemSold CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventItemDestroyed CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventSkillLevelUp CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventBuildingKill CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventBuildingKillAssists CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventChampionKill CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventChampionKillAssists CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventEliteMonsterTypes CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventEliteMonsterSubTypes CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventEliteMonsterKill CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventEliteMonsterKillAssists CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEventTypes CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameEvents CASCADE;
DROP TABLE IF EXISTS GameTimelineFrameParticipantFrames CASCADE;
DROP TABLE IF EXISTS Videos CASCADE;
DROP TABLE IF EXISTS ItemNames CASCADE;
DROP TABLE IF EXISTS ItemDescriptions CASCADE;
DROP TABLE IF EXISTS ItemPlaintexts CASCADE;
DROP TABLE IF EXISTS ItemTags CASCADE;
DROP TABLE IF EXISTS ItemEffects CASCADE;
DROP TABLE IF EXISTS ItemMaps CASCADE;
DROP TABLE IF EXISTS ItemStats CASCADE;
DROP TABLE IF EXISTS ItemBuildIntos CASCADE;
DROP TABLE IF EXISTS ItemBuiltFroms CASCADE;
DROP TABLE IF EXISTS ItemImages CASCADE;
DROP TABLE IF EXISTS ChampionNames CASCADE;
DROP TABLE IF EXISTS ChampionTitles CASCADE;
DROP TABLE IF EXISTS ChampionLores CASCADE;
DROP TABLE IF EXISTS ChampionBlurbs CASCADE;
DROP TABLE IF EXISTS ChampionAllyTips CASCADE;
DROP TABLE IF EXISTS ChampionEnemyTips CASCADE;
DROP TABLE IF EXISTS ChampionInfos CASCADE;
DROP TABLE IF EXISTS ChampionTags CASCADE;
DROP TABLE IF EXISTS ChampionStats CASCADE;
DROP TABLE IF EXISTS ChampionSkins CASCADE;
DROP TABLE IF EXISTS ChampionSquareImages CASCADE;
DROP TABLE IF EXISTS ChampionSplashImages CASCADE;
DROP TABLE IF EXISTS ChampionLoadingImages CASCADE;
DROP TABLE IF EXISTS ChampionSprites CASCADE;
DROP TABLE IF EXISTS ChampionSpells CASCADE;
DROP TABLE IF EXISTS ChampionSpellNames CASCADE;
DROP TABLE IF EXISTS ChampionSpellDescriptions CASCADE;
DROP TABLE IF EXISTS ChampionSpellTooltips CASCADE;
DROP TABLE IF EXISTS ChampionSpellResources CASCADE;
DROP TABLE IF EXISTS ChampionSpellEffects CASCADE;
DROP TABLE IF EXISTS ChampionSpellLevelTipLabels CASCADE;
DROP TABLE IF EXISTS ChampionSpellLevelTipEffects CASCADE;
DROP TABLE IF EXISTS ChampionSpellImages CASCADE;
DROP TABLE IF EXISTS ChampionPassiveNames CASCADE;
DROP TABLE IF EXISTS ChampionPassiveDescriptions CASCADE;
DROP TABLE IF EXISTS ChampionPassiveImages CASCADE;
DROP TABLE IF EXISTS RuneNames CASCADE;
DROP TABLE IF EXISTS RuneDescriptions CASCADE;
DROP TABLE IF EXISTS RuneTags CASCADE;
DROP TABLE IF EXISTS RuneStats CASCADE;
DROP TABLE IF EXISTS RuneImages CASCADE;
DROP TABLE IF EXISTS RunesReforgedName CASCADE;
DROP TABLE IF EXISTS RunesReforgedRunes CASCADE;
DROP TABLE IF EXISTS RunesReforgedRuneNames CASCADE;
DROP TABLE IF EXISTS RunesReforgedRuneShortDescriptions CASCADE;
DROP TABLE IF EXISTS RunesReforgedRuneLongDescriptions CASCADE;
DROP TABLE IF EXISTS MasteryNames CASCADE;
DROP TABLE IF EXISTS MasteryDescriptions CASCADE;
DROP TABLE IF EXISTS MasteryImages CASCADE;
DROP TABLE IF EXISTS SummonerSpellNames CASCADE;
DROP TABLE IF EXISTS SummonerSpellDescriptions CASCADE;
DROP TABLE IF EXISTS SummonerSpellTooltips CASCADE;
DROP TABLE IF EXISTS SummonerSpellModes CASCADE;
DROP TABLE IF EXISTS SummonerSpellImages CASCADE;
DROP TABLE IF EXISTS MapUnpurchasableItems CASCADE;

CREATE TABLE LanguageCodes(
	auto_id SERIAL,
	languageCode TEXT PRIMARY KEY,
	languageText TEXT
);

CREATE TABLE Patches(
	auto_id SERIAL,
	patch TEXT PRIMARY KEY
);

CREATE TABLE LanguageItems(
	auto_id SERIAL PRIMARY KEY,
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	patch TEXT REFERENCES Patches(patch),
	languageItem TEXT
);

CREATE TABLE Leagues(
	auto_id SERIAL,
	id INT PRIMARY KEY,
	guid TEXT,
	name TEXT,
	logoURL TEXT);

CREATE TABLE Tournaments(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	title TEXT,
	description TEXT,
	leagueId INT REFERENCES Leagues(id));

CREATE TABLE Players(
	auto_id SERIAL,
	id INT PRIMARY KEY,
	firstName TEXT,
	lastName TEXT,
	inGameName TEXT,
	photoURL TEXT,
	hometown TEXT,
	region INT,
	birthdate TIMESTAMP WITH TIME ZONE);

CREATE TABLE Teams(
 	auto_id SERIAL,
 	id INT PRIMARY KEY,
 	name TEXT,
 	photoURL TEXT,
 	logoURL TEXT,
 	acronym TEXT,
  	altLogoURL TEXT,
  	homeLeague INT REFERENCES Leagues(id));

CREATE TABLE TournamentBrackets(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT,
	groupPosition INT,
	groupName TEXT);

CREATE TABLE Matches(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	name TEXT,
	position INT);

CREATE TABLE Games(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	matchId TEXT REFERENCES Matches(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	tournamentId TEXT REFERENCES Tournaments(id),
	name TEXT);

CREATE TABLE Champions(
	auto_id SERIAL PRIMARY KEY,
	patch TEXT REFERENCES Patches(patch),
	id INT,
	parType TEXT);

CREATE TABLE Items(
	auto_id SERIAL PRIMARY KEY,
	patch TEXT REFERENCES Patches(patch),
	id INT,
	requiredChampion INT REFERENCES Champions(auto_id),
	inStore BOOLEAN,
	baseGold INT,
	purchasable BOOLEAN,
	totalGold INT,
	sellGold INT,
	hideFromAll BOOLEAN,
	specialRecipie INT REFERENCES Items(auto_id));

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
	resource TEXT);

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
	h INT);

CREATE TABLE ProfileIcons(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE Stickers(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE Runes(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	tier INT,
	type TEXT,
	colloq TEXT, --??
	plaintext TEXT); --??

CREATE TABLE RunesReforged(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	key TEXT,
	patch TEXT REFERENCES Patches(patch),
	iconURL TEXT);

CREATE TABLE Masteries(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	patch TEXT REFERENCES Patches(patch),
	ranks INT,
	prereq INT REFERENCES Masteries(auto_id),
	branchName TEXT,
	columnIndex INT,
	rowIndex INT);

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
	minutesPlayed INT);

CREATE TABLE PlayerBios (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	bio TEXT);

CREATE TABLE PlayerSocialNetworks (
	auto_id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	networkName TEXT,
	url TEXT);

CREATE TABLE PlayerStatsSummaries(
	id SERIAL PRIMARY KEY,
	playerId INT REFERENCES Players (id),
	kdsRatio NUMERIC,
	kdaRatioRank INT,
	csPerTenMinutes NUMERIC,
	csPerTenMinutesRank INT,
	killParticipation NUMERIC,
	killParticipationRank INT,
	mostPlayedChampionsId TEXT);

CREATE TABLE PlayerStatsSummariesMostPlayedChampions(
	auto_id SERIAL PRIMARY KEY,
	playerStatsSummaryId INT REFERENCES PlayerStatsSummaries(id),
	championId INT REFERENCES Champions(auto_id),
	wins INT,
	losses INT,
	total INT,
	kdaRatioRank NUMERIC);

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
	firstTowerRatioRank INT);

CREATE TABLE TeamStatsSummariesAverageDamageByPositions(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	adc NUMERIC,
	support NUMERIC,
	solo NUMERIC,
	jungle NUMERIC);

CREATE TABLE TeamRosterStats(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	playerId INT REFERENCES Players(id),
	gamesPlayed INT,
	averageAssists NUMERIC,
	averageDeaths NUMERIC,
	averageKills NUMERIC,
	averageKillParticipation NUMERIC,
	summonerName TEXT);

CREATE TABLE TeamRosterStatsChampions(
	auto_id SERIAL PRIMARY KEY,
	teamId INT REFERENCES Teams(id),
	playerId INT REFERENCES Players(id),
	championId INT REFERENCES Champions(auto_id));

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
	gameId TEXT REFERENCES Games(id));

CREATE TABLE TeamStatsHistoriesChampions(
	auto_id SERIAL PRIMARY KEY,
	teamStatsHistoriesId TEXT REFERENCES TeamStatsHistories(id),
	championId INT REFERENCES Champions(auto_id));

CREATE TABLE TeamBios(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	languageCode TEXT REFERENCES LanguageCodes(languageCode),
 	bio TEXT);

CREATE TABLE TeamStarters(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
	playerId INT REFERENCES Players(id));

CREATE TABLE TeamSubs(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	playerId INT REFERENCES Players(id));

CREATE TABLE TeamPlayers(
 	auto_id SERIAL PRIMARY KEY,
 	teamId INT REFERENCES Teams(id),
 	playerId INT REFERENCES Players(id));

CREATE TABLE PlayerStatsHistories(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	playerId INT REFERENCES Players(id),
	championId INT REFERENCES Champions(auto_id),
	_timestamp NUMERIC,
	assists INT,
	deaths INT,
	kills INT,
	csPerTenMinutes NUMERIC,
	kdaRatio NUMERIC,
	killParticipation INT,
	win BOOLEAN,
	matchId TEXT REFERENCES Matches(id),
	teamId INT REFERENCES Teams(id),
	opponentTeamId INT REFERENCES Teams(id),
	gameId TEXT REFERENCES Games(id));

CREATE TABLE TournamentTeams(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT, -- Acronym
	teamId INT REFERENCES Teams(id));

CREATE TABLE TournamentBracketTypes(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	type TEXT,
	rounds INT);

CREATE TABLE TournamentBracketMatchTypes(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	type TEXT,
	bestOf INT);

CREATE TABLE TournamentRosters(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	name TEXT,
	teamId INT REFERENCES Teams(id),
	tournamentId TEXT REFERENCES Tournaments(id));

CREATE TABLE TournamentBracketRosters(
	auto_id SERIAL PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	roster TEXT REFERENCES TournamentRosters(id));

CREATE TABLE LeagueAbouts(
	auto_id SERIAL PRIMARY KEY,
	leagueId INT REFERENCES Leagues(id),
 	languageCode TEXT REFERENCES LanguageCodes(languageCode),
 	about TEXT);

CREATE TABLE LeagueNames(
	auto_id SERIAL PRIMARY KEY,
	leagueId INT REFERENCES Leagues(id),
 	languageCode TEXT REFERENCES LanguageCodes(languageCode),
 	name TEXT);

CREATE TABLE LeagueTournamentRecords(
	auto_id SERIAL,
	id TEXT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	bracketId TEXT REFERENCES TournamentBrackets(id),
	roster TEXT REFERENCES TournamentRosters(id),
	wins INT,
	losses INT,
	ties INT,
	score INT);

CREATE TABLE GameStats(
	auto_id SERIAL,
	gameId TEXT PRIMARY KEY REFERENCES Games(id),
	platformId TEXT,
	gameCreation NUMERIC,
	gameDuration INT,
	mapId INT REFERENCES Maps(auto_id),
	seasonId INT,
	gameVersion TEXT, -- relates to patch #
	gameMode TEXT); -- create game mode type table, ref it

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
	dominionVictoryScore INT);

CREATE TABLE GameStatTeamBans(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	teamId INT REFERENCES GameStatTeams(auto_id),
	championId INT REFERENCES Champions(auto_id),
	pickTurn INT);

CREATE TABLE GameStatsParticipants(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	participantId INT,
	summonerName TEXT,
	profileIcon INT,
	teamId INT,
	championId INT REFERENCES Champions(auto_id),
	spell1Id INT REFERENCES SummonerSpells(auto_id),
	spell2Id INT REFERENCES SummonerSpells(auto_id));

CREATE TABLE GameStatsParticipantMasteries(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	participantId INT REFERENCES GameStatsParticipants(auto_id),
	masteryId INT REFERENCES Masteries(auto_id),
	rank INT);


CREATE TABLE GameStatsParticipantRunes(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	participantId INT REFERENCES GameStatsParticipants(auto_id),
	runeId INT REFERENCES Masteries(auto_id),
	rank INT);

CREATE TABLE GameStatsParticipantStats(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	participantId INT REFERENCES GameStatsParticipants(auto_id),
	win BOOLEAN,
	item0 INT REFERENCES Items(auto_id),
	item1 INT REFERENCES Items(auto_id),
	item2 INT REFERENCES Items(auto_id),
	item3 INT REFERENCES Items(auto_id),
	item4 INT REFERENCES Items(auto_id),
	item5 INT REFERENCES Items(auto_id),
	item6 INT REFERENCES Items(auto_id),
	kills INT,
	deaths INT,
	assists INT,
	largestKillingSpree INT,
	largestMultiKill INT,
	killingSpree INT,
	longestTimeSpentLiving INT,
	doubleKills INT,
	tripleKills INT,
	quadraKills INT,
	pentaKills INT,
	unrealKills INT,
	totalDamageDealt INT,
	magicDamageDealt INT,
	physicalDamageDealt INT,
	ruteDamageDealt INT,
	largestCriticalStrike INT,
	totalDamageDealtToChampions INT,
	magicDamageDealtToChampions INT,
	physicalDamageDealtToChampions INT,
	trueDamageDealtToChampions INT,
	totalHeal INT,
	totalUnitsHealed INT,
	damageSelfMitigated INT,
	damageDealtToObjectives INT,
	damageDealtToTurrets INT,
	visionScore INT,
	timeCCingOthers INT,
	totalDamageTaken INT,
	magicalDamageTaken INT,
	physicalDamageTaken INT,
	trueDamageTaken INT,
	goldEarned INT,
	goldSpent INT,
	turretKills INT,
	inhibitorKills INT,
	totalMinionsKilled INT,
	neutralMinionsKilled INT,
	neutralMinionsKilledTeamJungle INT,
	neutralMinionsKilledEnemyJungle INT,
	totalTimeCrowdControlDealt INT,
	champLevel INT,
	visionWardsBoughtInGame INT,
	sightWardsBoughtInGame INT,
	wardsPlaced INT,
	wardsKilled INT,
	firstBloodKill BOOLEAN,
	firstBloodAssist BOOLEAN,
	firstTowerKill BOOLEAN,
	firstTowerAssist BOOLEAN,
	firstInhibitorKill BOOLEAN,
	firstInhibitorAssist BOOLEAN,
	combatPlayerScore INT,
	objectivePlayerScore INT,
	totalPlayerScore INT,
	totalScoreRank INT,
	playerScore0 INT,
	playerScore1 INT,
	playerScore2 INT,
	playerScore3 INT,
	playerScore4 INT,
	playerScore5 INT,
	playerScore6 INT,
	playerScore7 INT,
	playerScore8 INT,
	playerScore9 INT);

CREATE TABLE GameTimelines(
	auto_id SERIAL,
	gameId TEXT PRIMARY KEY REFERENCES Games(id),
	frameInterval INT);

CREATE TABLE GameTimelineFrameEventWardTypes(
	auto_id SERIAL,
	wardType TEXT PRIMARY KEY);

CREATE TABLE GameTimelineFrameEventWardPlaced(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	wardType TEXT REFERENCES GameTimelineFrameEventWardTypes(wardType),
	creatorId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventWardKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	wardType TEXT REFERENCES GameTimelineFrameEventWardTypes(wardType),
	killerId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventItemPurchased(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	itemId INT REFERENCES Items(auto_id),
	participantId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventItemSold(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	itemId INT REFERENCES Items(auto_id),
	participantId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventItemDestroyed(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	itemId INT REFERENCES Items(auto_id),
	participantId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventSkillLevelUp(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	skillSlot INT,
	participantId INT REFERENCES GameStatsParticipants(auto_id),
	levelUpType TEXT);

CREATE TABLE GameTimelineFrameEventBuildingKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	xPosition INT,
	yPosition INT,
	killerId INT REFERENCES GameStatsParticipants(auto_id),
	teamId INT,
	buildingType TEXT,
	laneType TEXT,
	towerType TEXT);

CREATE TABLE GameTimelineFrameEventBuildingKillAssists(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	buildingKillEvent INT REFERENCES GameTimelineFrameEventBuildingKill(auto_id),
	assistingParticipantId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventChampionKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	xPosition INT,
	yPosition INT,
	killerId INT REFERENCES GameStatsParticipants(auto_id),
	victimId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventChampionKillAssists(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	championKillEvent INT REFERENCES GameTimelineFrameEventChampionKill(auto_id),
	assistingParticipantId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventEliteMonsterTypes(
	auto_id SERIAL,
	monsterType TEXT PRIMARY KEY);

CREATE TABLE GameTimelineFrameEventEliteMonsterSubTypes(
	auto_id SERIAL,
	monsterSubType TEXT PRIMARY KEY);

CREATE TABLE GameTimelineFrameEventEliteMonsterKill(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT,
	_timestamp INT,
	xPosition INT,
	yPosition INT,
	killerId INT REFERENCES GameStatsParticipants(auto_id),
	monsterType TEXT REFERENCES GameTimelineFrameEventEliteMonsterTypes(monsterType),
	monsterSubType TEXT REFERENCES GameTimelineFrameEventEliteMonsterSubTypes(monsterSubType));

CREATE TABLE GameTimelineFrameEventEliteMonsterKillAssists(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	eliteMonsterKillEvent INT REFERENCES GameTimelineFrameEventEliteMonsterKill(auto_id),
	assistingParticipantId INT REFERENCES GameStatsParticipants(auto_id));

CREATE TABLE GameTimelineFrameEventTypes(
	auto_id SERIAL,
	type TEXT PRIMARY KEY);

CREATE TABLE GameTimelineFrameEvents(
	auto_id SERIAL PRIMARY KEY,
	gameId TEXT REFERENCES Games(id),
	type TEXT REFERENCES GameTimelineFrameEventTypes(type),
	_timestamp INT);

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
	_timestamp INT);

CREATE TABLE Videos(
	auto_id SERIAL,
	id INT PRIMARY KEY,
	tournamentId TEXT REFERENCES Tournaments(id),
	gameId TEXT REFERENCES Games(id),
	matchId TEXT REFERENCES Matches(id),
	url TEXT,
	locale TEXT); -- languageCode TEXT REFERENCES LanguageCodes(languageCode));

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------- STATIC DATA ------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ItemNames(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE ItemDescriptions(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT);

CREATE TABLE ItemPlaintexts(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	plaintext TEXT);

CREATE TABLE ItemTags(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	tag TEXT);

CREATE TABLE ItemEffects(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	effectIndex INT,
	effectValue INT);

CREATE TABLE ItemMaps(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	mapId INT REFERENCES Maps(auto_id));

CREATE TABLE ItemStats(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	stat INT REFERENCES LanguageItems(auto_id),
	statValue NUMERIC);

CREATE TABLE ItemBuildIntos(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	intoItemId INT REFERENCES Items(auto_id));

CREATE TABLE ItemBuiltFroms(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	fromItemId INT REFERENCES Items(auto_id));

CREATE TABLE ItemImages(
	auto_id SERIAL PRIMARY KEY,
	itemId INT REFERENCES Items(auto_id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE ChampionNames(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE ChampionTitles(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	title TEXT);

CREATE TABLE ChampionLores(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	lore TEXT);

CREATE TABLE ChampionBlurbs(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	blurb TEXT);

CREATE TABLE ChampionAllyTips(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tip TEXT);

CREATE TABLE ChampionEnemyTips(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tip TEXT);

CREATE TABLE ChampionInfos(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	attack INT,
	defense INT,
	magic INT,
	dificulty INT);

CREATE TABLE ChampionTags(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	tag TEXT);

CREATE TABLE ChampionStats(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
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
	attackSpeedOffset NUMERIC,
	attackSpeedPerLevel NUMERIC);

CREATE TABLE ChampionSkins(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	championId INT REFERENCES Champions(auto_id),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT,
	num INT,
	hasChromas BOOLEAN);

CREATE TABLE ChampionSquareImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	imageURL TEXT);

CREATE TABLE ChampionSplashImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	skinId INT REFERENCES ChampionSkins(auto_id),
	imageURL TEXT);

CREATE TABLE ChampionLoadingImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	skinId INT REFERENCES ChampionSkins(auto_id),
	imageURL TEXT);

CREATE TABLE ChampionSprites(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	imageURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE ChampionSpells(
	auto_id SERIAL PRIMARY KEY,
	id TEXT,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	cooldownBurn TEXT,
	costBurn TEXT,
	costType TEXT,
	maxAmmo TEXT,
	rangeBurn TEXT);

CREATE TABLE ChampionSpellNames(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	spellId INT REFERENCES ChampionSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE ChampionSpellDescriptions(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT);

CREATE TABLE ChampionSpellTooltips(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	spellId INT REFERENCES ChampionSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tooltip TEXT);

CREATE TABLE ChampionSpellResources(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	spellId INT REFERENCES ChampionSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	resource TEXT);

CREATE TABLE ChampionSpellEffects(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	spellId INT REFERENCES ChampionSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	effectIndex INT,
	effectBurnValue TEXT);

CREATE TABLE ChampionSpellLevelTipLabels(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	spellId INT REFERENCES ChampionSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	labelIndex INT,
	label TEXT);

CREATE TABLE ChampionSpellLevelTipEffects(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	spellId INT REFERENCES ChampionSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	effectIndex INT,
	effect TEXT);

CREATE TABLE ChampionSpellImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	spellId INT REFERENCES ChampionSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT, 
	w INT,
	h INT);

CREATE TABLE ChampionPassiveNames(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE ChampionPassiveDescriptions(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT);

CREATE TABLE ChampionPassiveImages(
	auto_id SERIAL PRIMARY KEY,
	championId INT REFERENCES Champions(auto_id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE RuneNames(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE RuneDescriptions(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE RuneTags(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	tag TEXT);

CREATE TABLE RuneStats(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	stat INT REFERENCES LanguageItems(auto_id),
	statValue NUMERIC);

CREATE TABLE RuneImages(
	auto_id SERIAL PRIMARY KEY,
	runeId INT REFERENCES Runes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE RunesReforgedName(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedId INT REFERENCES RunesReforged(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE RunesReforgedRunes(
	auto_id SERIAL PRIMARY KEY,
	id INT,
	key TEXT,
	runesReforgedId INT REFERENCES RunesReforged(auto_id),
	patch TEXT REFERENCES Patches(patch),
	slotIndex INT,
	iconURL TEXT);

CREATE TABLE RunesReforgedRuneNames(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedRuneId INT REFERENCES RunesReforgedRunes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE RunesReforgedRuneShortDescriptions(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedRuneId INT REFERENCES RunesReforgedRunes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	shortDescription TEXT);

CREATE TABLE RunesReforgedRuneLongDescriptions(
	auto_id SERIAL PRIMARY KEY,
	runesReforgedRuneId INT REFERENCES RunesReforgedRunes(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	longDescription TEXT);

CREATE TABLE MasteryNames(
	auto_id SERIAL PRIMARY KEY,
	masteryId INT REFERENCES Masteries(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE MasteryDescriptions(
	auto_id SERIAL PRIMARY KEY,
	masteryId INT REFERENCES Masteries(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT,
	descriptionIndex INT);

CREATE TABLE MasteryImages(
	auto_id SERIAL PRIMARY KEY,
	masteryId INT REFERENCES Masteries(auto_id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE SummonerSpellNames(
	auto_id SERIAL PRIMARY KEY,
	summonerId INT REFERENCES SummonerSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	name TEXT);

CREATE TABLE SummonerSpellDescriptions(
	auto_id SERIAL PRIMARY KEY,
	summonerId INT REFERENCES SummonerSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	description TEXT);

CREATE TABLE SummonerSpellTooltips(
	auto_id SERIAL PRIMARY KEY,
	summonerId INT REFERENCES SummonerSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	languageCode TEXT REFERENCES LanguageCodes(languageCode),
	tooltip TEXT);

CREATE TABLE SummonerSpellModes(
	auto_id SERIAL PRIMARY KEY,
	summonerId INT REFERENCES SummonerSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	mode TEXT);

CREATE TABLE SummonerSpellImages(
	auto_id SERIAL PRIMARY KEY,
	summonerId INT REFERENCES SummonerSpells(auto_id),
	patch TEXT REFERENCES Patches(patch),
	fullURL TEXT,
	spriteURL TEXT,
	x INT,
	y INT,
	w INT,
	h INT);

CREATE TABLE MapUnpurchasableItems(
	auto_id SERIAL PRIMARY KEY,
	mapId INT REFERENCES Maps(auto_id),
	patch TEXT REFERENCES Patches(patch),
	itemId INT REFERENCES Items(auto_id));