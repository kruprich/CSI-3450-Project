import datetime, logging, json, requests, pytz, os, urllib, time, sys, shutil, psycopg2, decimal
from requests.packages.urllib3.exceptions import InsecureRequestWarning
from datetime import datetime
from dateutil import parser
from common import *
from lol_esports_api import *
import populate_database

def handleLeague(league, json):
	print "\nHandling " + json["name"].encode('utf-8')

	if league == None:
		league = {} 
	else:
		return

	attributeSetter(league, json, ["guid", "drupalId", "abouts", "names", "createdAt"])

	league["abouts"] = {} #orm.List(type=LeagueOfLegends_Bio)
	addBio(league["abouts"], json["abouts"])
	
	league["names"] = {} #orm.List(type=LeagueOfLegends_Bio)
	addBio(league["names"], json["names"])
	populate_database.addLeague(league)

def handleTeams(allPlayersAndTeamsJSON):
	for team in allPlayersAndTeamsJSON["teams"]:
		handleTeam(populate_database.getTeam(str(team["id"])), team["slug"], str(team["id"]))

def handleTeam(team, teamSlug, teamId):

	if team == None:
		team = {}
	else:
		return

	json = getTeam(unicode(teamId.rstrip()), "0")

	if "message" in json.keys() or "error" in json.keys():
		print "\t\tSkipping team " + unicode(teamSlug).encode('utf-8')
		return

	print "\t\tHandling team " + unicode(teamSlug).encode('utf-8')

	teamsJSON = json["teams"]
	for teamJSON in teamsJSON:
		if 	teamJSON["slug"] == teamSlug and "scheduleItems" in teamJSON.keys():
			if "homeLeague" in teamJSON.keys() and teamJSON["homeLeague"] != None:
				team["homeLeague"] = int(teamJSON["homeLeague"].split("urn:rg:lolesports:global:league:league:")[1])
			attributeSetter(team, teamJSON, ["teamStatsSummary", "teamStatsHistory", "foreignIds", "guid", "scheduleItems", "homeLeague", "players", "starters", "bios", "foreignIds", "createdAt", "subs"])

			team["bios"] = {} #orm.List(type=LeagueOfLegends_Bio)
			addBio(team["bios"], teamJSON["bios"])
				
			team["starters"] = {} #orm.List(type=LeagueOfLegends_PlayerForTeams)
			team["subs"] = {} #orm.List(type=LeagueOfLegends_PlayerForTeams)
			addPlayerForTeam(team["starters"], json["players"], teamJSON["starters"])
			addPlayerForTeam(team["subs"], json["players"], teamJSON["subs"])

			team["tournamentStats"] = {} #orm.List(type=LeagueOfLegends_PlayerTournamentStats)

			for t in json["highlanderTournaments"]:
				if t["id"] not in team["tournamentStats"].keys():
					newTeamJSON = getTeam(str(teamJSON["id"]), t["id"])
					if "teamStatsSummaries" in newTeamJSON.keys():
						team["tournamentStats"][t["id"]] = {}
						if "teamStatsSummaries" in newTeamJSON.keys():
							handleTeamTournamentStats(newTeamJSON["teamStatsSummaries"][0], t["id"], team["tournamentStats"][t["id"]])
						if "teamRosterStats" in newTeamJSON.keys():
							addMorePlayerTournamentStats(newTeamJSON["teamRosterStats"], t["id"])

			populate_database.addTeam(team)

def handleTeamTournamentStats(statsJSON, tournamentId, teamStatsSummary):
	teamStatsSummary["kdaRatio"] = statsJSON.get("kdaRatio")
	teamStatsSummary["kdaRatioRank"] = statsJSON.get("kdaRatioRank")
	teamStatsSummary["averageWinLength"] = statsJSON.get("averageWinLength")
	teamStatsSummary["averageWinLengthRank"] = statsJSON.get("averageWinLengthRank")
	teamStatsSummary["firstDragonKillRatio"] = statsJSON.get("firstDragonKillRatio")
	teamStatsSummary["firstDragonKillRatioRank"] = statsJSON.get("firstDragonKillRatioRank")
	teamStatsSummary["firstTowerRatio"] = statsJSON.get("firstTowerRatio")
	teamStatsSummary["firstTowerRatioRank"] = statsJSON.get("firstTowerRatioRank")
	if statsJSON.get("averageDamageByPosition"):
		averageDamageByPosition = {}
		averageDamageByPosition["DUO_CARRY"] = statsJSON["averageDamageByPosition"].get("DUO_CARRY")
		averageDamageByPosition["DUO_SUPPORT"] = statsJSON["averageDamageByPosition"].get("DUO_SUPPORT")
		averageDamageByPosition["SOLO"] = statsJSON["averageDamageByPosition"].get("SOLO")
		averageDamageByPosition["NONE"] = statsJSON["averageDamageByPosition"].get("NONE")
		teamStatsSummary["averageDamageByPosition"] = averageDamageByPosition

def addBio(obj, bioJSON):
	for bioKey in bioJSON.keys():
		obj[bioKey] = bioJSON[bioKey]

def addPlayerForTeam(obj, playersJSON, teamPlayerGroupJSON, teamId=None):
	for playerJSON in playersJSON:
		if playerJSON["id"] in teamPlayerGroupJSON:
			if teamId != None:
				if playerJSON["liveGameTeam"] == teamId:
					addPlayerToObj(obj, playerJSON)
			else:
				addPlayerToObj(obj, playerJSON)

def addPlayerToObj(obj, playerJSON):
	player = {}
	player["id"] = playerJSON["id"]
	player["role"] = beautifyRole(playerJSON["roleSlug"])
	player["name"] = playerJSON["name"]
	obj[playerJSON["id"]] = player

def handlePlayers(allPlayersAndTeamsJSON):
	for player in allPlayersAndTeamsJSON["players"]:
		handlePlayer(populate_database.getPlayer(str(player["id"])), player["slug"], str(player["id"]))

def handlePlayer(player, playerSlug, playerId):
	print '\t\tHandling player ' + unicode(playerSlug).encode('utf-8')

	if player == None:
		player = {}
	else:
		return

	json = getPlayer(unicode(playerId.rstrip()), "0")

	if "message" in json.keys() or "error" in json.keys():
		print "\t\tSkipping " + unicode(playerSlug).encode('utf-8')
		return

	playerJSON = json["players"][0]
	player["role"] = playerJSON["roleSlug"]
	
	attributeSetter(player, playerJSON, ["playerStatsSummary", "playerStatsHistory", "bios", "scheduleItems", "roleSlug", "photoInformation", "createdAt", "starterOnTeams", "socialNetworks", "champions", "subOnTeams", "foreignIds", "teams"])
	
	player["bios"] = {} #orm.List(type=LeagueOfLegends_Bio)
	addBio(player["bios"], playerJSON["bios"])
		
	player["socialNetworks"] = {} #orm.List(type=LeagueOfLegends_PlayerSocialNetwork)
	for socialNetworkKey in playerJSON["socialNetworks"].keys():
		player["socialNetworks"][socialNetworkKey] = playerJSON["socialNetworks"][socialNetworkKey]

	player["teams"] = {} #orm.List(type=LeagueOfLegends_TeamForPlayers)
	for tid in playerJSON["teams"]:
		for team in json["teams"]:
			if tid == team["id"]:
				pTeam = {} #LeagueOfLegends_TeamForPlayers()
				pTeam["name"] = team["name"]
				pTeam["acronym"] = team["acronym"]
				pTeam["id"] = team["id"]
				player['teams'][team["id"]] = pTeam

	player["tournamentStats"] = {} #orm.List(type=LeagueOfLegends_PlayerTournamentStats)
	
	for t in json["highlanderTournaments"]:
		if t["id"] not in player["tournamentStats"].keys():
			newPlayerJSON = getPlayer(str(playerJSON["id"]), t["id"])
			if "playerStatsSummaries" in newPlayerJSON.keys():
				player["tournamentStats"][t["id"]] = {}
				handlePlayerTournamentStats(newPlayerJSON["playerStatsSummaries"][0], t["id"], player["tournamentStats"][t["id"]])

	populate_database.addPlayer(player)
	
def handlePlayerTournamentStats(statsJSON, tournamentId, tournamentStats):
	tournamentStats["tournament"] = tournamentId
	tournamentStats["kdaRatio"] = statsJSON.get("kdaRatio")
	tournamentStats["kdaRatioRank"] = statsJSON.get("kdaRatioRank")
	tournamentStats["csPerTenMinutes"] = statsJSON.get("csPerTenMinutes")
	tournamentStats["csPerTenMinutes"] = statsJSON.get("csPerTenMinutesRank")
	tournamentStats["killParticipation"] = statsJSON.get("killParticipation")
	tournamentStats["killParticipationRank"] = statsJSON.get("killParticipationRank")
	tournamentStats["mostPlayedChampions"] = []

	for champ in statsJSON.get("mostPlayedChampions"):
		playedChampion = {}
		attributeSetter(playedChampion, champ, [])
		tournamentStats["mostPlayedChampions"].append(playedChampion)

def addPlayerTournamentStats(tournamentId):
	playerTournamentStats = getPlayerTournamentStats(tournamentId)
	for playerStats in playerTournamentStats["stats"]:

		if firebaseMain.get("players/" + str(playerStats["id"]), None) == None:
			handlePlayer(None, playerStats["playerSlug"], tournamentId)
		tournamentStats = firebaseMain.get("players/" + str(playerStats["id"]) + "/tournamentStats/" + tournamentId, None)
		
		if tournamentStats == None:
			tournamentStats = {}

		addDataToPlayerTournamentStats(playerStats, tournamentStats)
		#firebaseMain.patch("players/" + str(playerStats["id"]) + "/tournamentStats/" + tournamentId, tournamentStats)
		populate_database.addPlayerTournamentStats(tournamentId, tournamentStats)

def addMorePlayerTournamentStats(teamRosterStatsJSON, tournamentId):
	for playerStats in teamRosterStatsJSON:
		playerId = playerStats["playerId"].split("urn:rg:lolesports:global:player:player:")[1]
		tournamentStats = firebaseMain.get("players/" + playerId + "/tournamentStats/" + tournamentId, None)
		if tournamentStats == None: 
			tournamentStats = {}
		addMoreDataToPlayerTournamentStats(playerStats, tournamentStats)
		firebaseMain.patch("players/" + playerId + "/tournamentStats/" + tournamentId, tournamentStats)

def addDataToPlayerTournamentStats(statsJSON, tournamentStats):
	tournamentStats["position"] = statsJSON.get("position")
	tournamentStats["gamesPlayed"] = statsJSON.get("gamesPlayed")
	tournamentStats["team"] = statsJSON.get("team")
	tournamentStats["kills"] = statsJSON.get("kills")
	tournamentStats["deaths"] = statsJSON.get("deaths")
	tournamentStats["assists"] = statsJSON.get("assists")
	tournamentStats["csPerMin"] = statsJSON.get("csPerMin")
	tournamentStats["minutesPlayed"] = statsJSON.get("minutesPlayed")
	tournamentStats["cs"] = statsJSON.get("cs")
	tournamentStats["name"] = statsJSON.get("name")
	tournamentStats["teamSlug"] = statsJSON.get("teamSlug")
	tournamentStats["playerSlug"] = statsJSON.get("playerSlug")

def addMoreDataToPlayerTournamentStats(statsJSON, tournamentStats):
	tournamentStats["averageAssists"] = statsJSON.get("averageAssists")
	tournamentStats["averageDeaths"] = statsJSON.get("averageDeaths")
	tournamentStats["averageKills"] = statsJSON.get("averageKills")
	tournamentStats["averageKillParticipation"] = statsJSON.get("averageKillParticipation")
	tournamentStats["summonerName"] = statsJSON.get("summonerName")

def handleMatch(match, matchJSON, tournamentMatchJSON, tournamentId):
	print "\t\tHandling match " + tournamentMatchJSON["id"]

	if match == None:
		match = {} #LeagueOfLegends_Match()
		match["id"] = tournamentMatchJSON["id"]
	else:
		return

	match["name"] = tournamentMatchJSON["name"]
	match["tournament"] = tournamentId

	match["teams"] = {} #orm.List(type=LeagueOfLegends_TeamForMatches)
	for team in matchJSON["teams"]:
		mTeam = {} #LeagueOfLegends_TeamForMatches()
		mTeam["id"] = team["id"]
		mTeam["name"] = team["name"]
		mTeam["starters"] = {}
		mTeam["subs"] = {}
		addPlayerForTeam(mTeam["starters"], matchJSON["players"], team["starters"], team["id"])
		addPlayerForTeam(mTeam["subs"], matchJSON["players"], team["subs"], team["id"])
		match["teams"][team["id"]] = mTeam

	# Don't technically need videos in here too
	match["videos"] = {} #orm.List(type=LeagueOfLegends_VideoForMatches)
	for _video in matchJSON["videos"]:
		anyVideoData = True
		mVideo = {} #LeagueOfLegends_VideoForMatches()
		attributeSetter(mVideo, _video, ["source", "createdAt", "reference", "updatedAt", "teams", "tournament"])
		mVideo["url"] = _video["source"]
		match["videos"][_video["id"]] = mVideo
		# handleVideos(firebaseMain.get("videos/" + str(_video["id"])), _video, matchJSON["teams"], tournamentId)

	match["games"] = {} #orm.List(type=LeagueOfLegends_GameForMatches)
	for gameKey in tournamentMatchJSON["games"].keys():
		for gameIdMap in matchJSON["gameIdMappings"]:
			if gameIdMap["id"] == gameKey:			
				anyGameData = True
				mGame = {} #LeagueOfLegends_GameForMatches()
			 	mGame["id"] = gameKey
			 	mGame["name"] = tournamentMatchJSON["games"][gameKey]["name"]
			 	mGame["generatedName"] = beautifyGeneratedName(tournamentMatchJSON["games"][gameKey]["generatedName"])
				match["games"][gameKey] = mGame

	firebaseMain.patch("matches/" + match["id"], match)

# def handleVideos(video, json, teamsJSON, tournamentId):
# 	if video == None:
# 		video = {} #Video()

# 	attributeSetter(video, json, ["source", "teams", "tournament"])
# 	video["url"] = json["source"]
# 	video["tournament"] = tournamentId
	
# 	video["teams"] = {} #orm.List(type=LeagueOfLegends_TeamForTournaments)
# 	for vTeam in teamsJSON:
# 		vmTeam = {} #LeagueOfLegends_TeamForTournaments()
# 		vmTeam["id"] = vTeam["id"]
# 		vmTeam["name"] = vTeam["name"]
# 		vmTeam["acronym"] = vTeam["acronym"]
# 		video["teams"].append(vmTeam)

# 	updateFirebaseList(video, firebaseLeagueOfLegendsBaseURL, "videos")

def handleGameStats(gameStats, gameIdMap, _gameRelam, _gameId, _gameHash, tournamentMatchJSON, tournamentRosterJSON, matchDetailsJSON, tournamentId):
	print "\t\t\tHandling details for game " + gameIdMap["id"].replace("/", "")

	gameStatsJSON = getGameStats(_gameRelam, _gameId, _gameHash)

	if gameStats == None:
		gameStats = {} #LeagueOfLegends_GameStats()
		gameStats["id"] = gameIdMap["id"].replace("/", "")
	else:
		return

	
	gameStats["match"] = tournamentMatchJSON["id"]
	attributeSetter(gameStats, gameStatsJSON, ["gameId", "platformId", "queueId", "gameMode", "gameType", "teams", "participants", "participantIdentities"])

	if "teams" in gameStatsJSON.keys():
		gameStats["teams"] = {} #orm.List(type=LeagueOfLegends_TeamForGameStats)
		for gt in gameStatsJSON["teams"]:
			gTeam = {} #LeagueOfLegends_TeamForGameStats()

			if gt["teamId"] == 100:
				gTeam["side"] = "Blue"
				gTeam["tempId"] = 100
				for rosterKey in tournamentRosterJSON:
					if rosterKey == tournamentMatchJSON["games"][gameIdMap["id"].replace("/", "")]["input"][0]["roster"]:
						if "team" in tournamentRosterJSON[rosterKey].keys():
							gTeam["id"] = int(tournamentRosterJSON[rosterKey]["team"])
							gTeam["type"] = "team"
						elif "player" in tournamentRosterJSON[rosterKey].keys():
							gTeam["id"] = int(tournamentRosterJSON[rosterKey]["player"])
							gTeam["type"] = "player"

			elif gt["teamId"] == 200:
				gTeam["side"] = "Red"
				gTeam["tempId"] = 200
				for rosterKey in tournamentRosterJSON:
					if rosterKey == tournamentMatchJSON["games"][gameIdMap["id"].replace("/", "")]["input"][1]["roster"]:
						if "team" in tournamentRosterJSON[rosterKey].keys():
							gTeam["id"] = int(tournamentRosterJSON[rosterKey]["team"])
							gTeam["type"] = "team"
						elif "player" in tournamentRosterJSON[rosterKey].keys():
							gTeam["id"] = int(tournamentRosterJSON[rosterKey]["player"])
							gTeam["type"] = "player"

			attributeSetter(gTeam, gt, ["teamId", "wins", "bans", "id"])
			gTeam["win"] = gt["win"] == "Win" or False and True
			
			gTeam["bans"] = []
			for b in gt.get("bans"):
				tBan = {} #LeagueOfLegends_TeamBansForGameStats()
				tBan["championId"] = b["championId"]
				tBan["pickTurn"] = b["pickTurn"]
				gTeam["bans"].append(tBan)

			gameStats["teams"][gTeam["id"]] = gTeam

	if "participants" in gameStatsJSON.keys():
		gameStats["participants"] = {} #orm.List(type=LeagueOfLegends_GameParticipant)
		for gp in gameStatsJSON["participants"]:
			gParticipant = {} #LeagueOfLegends_GameParticipant()
			attributeSetter(gParticipant, gp, ["masteries", "runes", "stats", "timeline", "highestAchievedSeasonTier"])

			for tK in gameStats["teams"].keys():
				if gameStats["teams"][tK]["tempId"] == gParticipant["teamId"]:
					gParticipant["team"] = gameStats["teams"][tK]["id"]

			gParticipant["masteries"] = []
			if "masteries" in gp.keys():
				for m in gp["masteries"]:
					pMastery = {} #MasteryForGameParticipant()
					pMastery["masteryId"] = m["masteryId"]
					pMastery["rank"] = m["rank"]
					gParticipant["masteries"].append(pMastery)
			
			gParticipant["runes"] = []
			if "runes" in gp.keys():
				for r in gp["runes"]:
					pRune = {} #RuneForGameParticipant()
					pRune["runeId"] = r["runeId"]
					pRune["rank"] = r["rank"]
					gParticipant["runes"].append(pRune)
		
			gParticipantStats = {} #GameParticipantStats()
			attributeSetter(gParticipantStats, gp["stats"], ["win", "participantId"])
			gParticipant["stats"] = gParticipantStats

			for p in gameStatsJSON.get("participantIdentities"):
				if p["participantId"] == gParticipant["participantId"]:
					gParticipant["summonerName"] = p["player"]["summonerName"]
					gParticipant["profileIcon"] = p["player"]["profileIcon"]

			tps = getPlayerTournamentStats(tournamentId)
			for ps in tps["stats"]:
				if " " in gParticipant["summonerName"]:
					if ps["name"].lower() == gParticipant["summonerName"].split(" ")[1].lower():
						gParticipant["id"] = ps["id"]

				else:
					if ps["name"].lower() == gParticipant["summonerName"].lower():
						gParticipant["id"] = ps["id"]

			timeline = {} #GameParticipantTimeline()
			gParticipant["role"] = gp["timeline"]["role"]
			gParticipant["lane"] = gp["timeline"]["lane"]

			for key in gp["timeline"].keys():
				if key not in ["role", "lane", "participantId"]:
					dList = {} #orm.List(type=LeagueOfLegends_Delta)
					for dKey in gp["timeline"][key].keys():
						dList[dKey] = round(gp["timeline"][key][dKey], 2)

					timeline[key] = dList
			
			gParticipant["timeline"] = timeline
			gameStats["participants"][gp["participantId"]] = gParticipant

			gParticipant["teamId"] = None
		for tK in gameStats["teams"].keys():
			gameStats["teams"][tK]["tempId"] = None

	firebaseMain.patch("gameStats/" + gameStats["id"], gameStats)

def handleGameTimeline(gameTimeline, gameIdMap, _gameRelam, _gameId, _gameHash, matchId):
	print "\t\t\tHandling timeline for game " + gameIdMap["id"].replace("/", "")
	gameTimelineJSON = getGameTimeline(_gameRelam, _gameId, _gameHash)
	
	if gameTimeline == None: 
		gameTimeline = {} #LeagueOfLegends_GameTimeline()
		gameTimeline["id"] = gameIdMap["id"].replace("/", "")
	else:
		return


	gameTimeline["match"] = matchId
	gameTimeline["frameInterval"] = gameTimelineJSON["frameInterval"] if gameTimelineJSON.get("frameInterval") else -1

	if "frames" in gameTimelineJSON.keys():
		gameTimeline["frames"] = [] #orm.List(type=LeagueOfLegends_GameTimelineFrame)
		for gtFrame in gameTimelineJSON["frames"]:
			gameTimelineFrame = {} #LeagueOfLegends_GameTimelineFrame()
			gameTimelineFrame["timestamp"] = gtFrame["timestamp"]

			gameTimelineFrame["events"] = []
			for gtfEvent in gtFrame["events"]:
				event = {} #LeagueOfLegends_Event()
				attributeSetter(event, gtfEvent, ["position", "assistingParticipantIds"])
				if "position" in gtfEvent.keys():
					position = {} #LeagueOfLegends_Position()
					attributeSetter(position, gtfEvent["position"])
					event["position"] = position

				event["assistingParticipants"] = []
				if "assistingParticipantIds" in gtfEvent.keys():
					for assistingParticipant in gtfEvent["assistingParticipantIds"]:
						event["assistingParticipants"].append(int(assistingParticipant))
				
				gameTimelineFrame["events"].append(event)

			gameTimelineFrame["participantFrames"] = {}
			for pFrameKey in gtFrame["participantFrames"].keys():
				gameTimelineFrameParticipantFrame = {} #LeagueOfLegends_GameTimelineFrameParticipantFrame()
				attributeSetter(gameTimelineFrameParticipantFrame, gtFrame["participantFrames"][pFrameKey], ["id", "position"])

				if gtFrame["participantFrames"][pFrameKey].get("position"):
					position = {} #LeagueOfLegends_Position()
					attributeSetter(position, gtFrame["participantFrames"][pFrameKey]["position"])
					gameTimelineFrameParticipantFrame["position"] = position

				gameTimelineFrame["participantFrames"][pFrameKey] = gameTimelineFrameParticipantFrame

			gameTimeline["frames"].append(gameTimelineFrame)

	else:
		print "\t\t\tNo timeline for game " + gameIdMap["id"].replace("/", "")
	firebaseMain.patch("gameTimelines/" + gameTimeline["id"], gameTimeline)

def handleTournament(tournament, json, league):
	print "\tHandling " + json["description"].encode('utf-8')

	if tournament == None:
		tournament = {} #LeagueOfLegends_Tournament()
	else:
		return

	tournament["league"] = int(json["league"])
	tournament["slug"] = json["title"]

	attributeSetter(tournament, json, ["title", "leagueId", "leagueReference", "rosters", "brackets", "matchType", "roles", "rosteringStrategy", "queues", "published", "breakpoints", "standings", "liveMatches", "platformIds", "gameIds", "league"])

	tournament["teams"] = {} #orm.List(type=LeagueOfLegends_TeamForTournaments)
	unknownTeamCounter = 0
	for rosterKey in json["rosters"]:
		tTeam = {} #LeagueOfLegends_TeamForTournaments()

		tTeam["acronym"] = json["rosters"][rosterKey]["name"]
		if "team" in json["rosters"][rosterKey].keys():
			tTeam["id"] = int(json["rosters"][rosterKey]["team"])
			tournament["teams"][json["rosters"][rosterKey]["team"]] = tTeam
		elif "player" in json["rosters"][rosterKey].keys():
			tTeam["id"] = int(json["rosters"][rosterKey]["player"])
			tournament["teams"][json["rosters"][rosterKey]["player"]] = tTeam
		else:
			print "WHAT IS GOING ON"
			print json["rosters"][rosterKey].keys()

	tournament["brackets"] = {}
	for bracketKey in json["brackets"].keys():
		tournament["brackets"][bracketKey] = {}

		tournamentBracket = {}
		tournamentBracket["matches"] = {}
		tournamentBracket["bracketType"] = {}
		tournamentBracket["matchType"] = {}
		tournamentBracket["id"] = bracketKey
		tournamentBracket["groupPosition"] = json["brackets"][bracketKey].get("groupPosition")
		tournamentBracket["position"] = json["brackets"][bracketKey].get("position")
		tournamentBracket["groupName"] = json["brackets"][bracketKey].get("groupName")
		tournamentBracket["name"] = json["brackets"][bracketKey].get("name")
	
		if "bracketType" in json["brackets"][bracketKey].keys():
			tournamentBracket["bracketType"]["type"] = json["brackets"][bracketKey]["bracketType"]["identifier"]
			if "options" in json["brackets"][bracketKey]["bracketType"].keys() and "rounds" in json["brackets"][bracketKey]["bracketType"]["options"].keys():
				tournamentBracket["bracketType"]["rounds"] = int(json["brackets"][bracketKey]["bracketType"]["options"]["rounds"])

		if "matchType" in json["brackets"][bracketKey].keys():
			tournamentBracket["matchType"] = json["brackets"][bracketKey]["matchType"]["identifier"]
			if "options" in json["brackets"][bracketKey]["matchType"].keys():
				tournamentBracket["matchType"] += "_" + json["brackets"][bracketKey]["matchType"]["options"].get("best_of")

		for matchKey in json["brackets"][bracketKey]["matches"].keys():
			tMatch = {} #LeagueOfLegends_MatchForTournaments()
			tMatch["id"] = json["brackets"][bracketKey]["matches"][matchKey]["id"]
			tMatch["name"] = json["brackets"][bracketKey]["matches"][matchKey]["name"]
			tMatch["games"] = {}
			matchJSON = getMatchDetails(json["id"], json["brackets"][bracketKey]["matches"][matchKey]["id"])
		
			if "error" not in matchJSON.keys():				
				if json["brackets"][bracketKey]["matches"][matchKey]["state"] == 'resolved':
					for gameKey in json["brackets"][bracketKey]["matches"][matchKey]["games"].keys():
						for gameIdMap in matchJSON["gameIdMappings"]:
							if gameIdMap["id"] == json["brackets"][bracketKey]["matches"][matchKey]["games"][gameKey]["id"]:
								mGame = {} #LeagueOfLegends_MatchForTournaments()
								mGame["id"] = gameIdMap["id"].replace("/", "")
								mGame["name"] = beautifyGeneratedName(json["brackets"][bracketKey]["matches"][matchKey]["games"][gameKey]["generatedName"])
								tMatch["games"][gameIdMap["id"].replace("/", "")] = mGame
			tournamentBracket["matches"][tMatch["id"]] = tMatch
		tournament["brackets"][bracketKey] = tournamentBracket
	firebaseMain.patch("tournaments/" + str(tournament["id"]), tournament)

# def handleLiveMatches():
# 	print ""
# 	newLiveMatchIds = []

# 	liveMatchesJSON = getStreamGroups()
# 	for tournament in liveMatchesJSON["highlanderTournaments"]:
# 		tmpRosters = {}
# 		for rosterKey in tournament["rosters"]:
# 			if "team" not in tournament["rosters"][rosterKey].keys():
# 				tmpRosters[rosterKey] = tournament["rosters"][rosterKey]["teamReference"]
# 			else:
# 				tmpRosters[rosterKey] = tournament["rosters"][rosterKey]["team"]

# 		for liveMatchId in tournament["liveMatches"]:
# 			for bKey in tournament["brackets"].keys():
# 				for mKey in tournament["brackets"][bKey]["matches"].keys():
# 					if tournament["brackets"][bKey]["matches"][mKey]["id"] == liveMatchId:
# 						if tournament["brackets"][bKey]["matches"][mKey]["state"] == "unresolved":

# 							print "\tHandling live match " + liveMatchId
# 							# liveMatch = LeagueOfLegends_LiveMatch.find_one({"id": tournament["brackets"][bKey]["matches"][mKey]["id"]})
# 							# if liveMatch == None:
# 							if firebase_find_one("liveMatches", "id", tournament["brackets"][bKey]["matches"][mKey]["id"]):
# 								liveMatch = {} #LeagueOfLegends_LiveMatch()

# 							# liveMatch["id"] = tournament["brackets"][bKey]["matches"][mKey]["id"]
# 							liveMatch["tournament"] = tournament["id"]
# 							liveMatch["league"] = int(tournament["league"])

# 							liveMatch["streams"] = {} #orm.List(type=LeagueOfLegends_StreamForCurrentMatch)
# 							for streamGroup in liveMatchesJSON["streamgroups"]:
# 								if "content" in streamGroup.keys():
# 									if streamGroup["content"].split("match:")[1] == liveMatchId:
# 										for stream in liveMatchesJSON["streams"]:
# 											if stream["id"] in streamGroup["streams"]:
# 												streamForLiveMatch = LeagueOfLegends_StreamForCurrentMatch()
# 												attributeSetter(streamForLiveMatch, stream, ["id", "slug", "enabled", "weight", "streamGroups"])
# 												# streamForLiveMatch["id"] = stream["id"]
# 												# liveMatch["streams"].append(streamForLiveMatch)
# 												liveMatch["streams"][stream["id"]] = streamForLiveMatch

# 							liveMatch["teams"] = {} #orm.List(type=LeagueOfLegends_TeamForMatches)
# 							for roster in tournament["brackets"][bKey]["matches"][mKey]["input"]:
# 								for team in liveMatchesJSON["teams"]:
# 									if team["id"] == int(tmpRosters[roster["roster"]]):
# 										lmTeam = {} #LeagueOfLegends_TeamForMatches()
# 										#lmTeam["id"] = team["id"]
# 										lmTeam["name"] = team["name"]

# 										for starter in liveMatchesJSON['players']:
# 											if starter['liveGameTeam'] == team['id'] and starter['id'] in team['starters']:
# 												lmtStarter = {} #LeagueOfLegends_PlayerForMatches()
# 												# lmtStarter["id"] = starter["id"]
# 												lmtStarter["name"] = starter["name"]
# 												lmtStarter["role"] = beautifyRole(starter["roleSlug"])
# 												# lmTeam["starters"].append(lmtStarter)
# 												lmTeam["starters"][starter["id"]] = lmtStarter

# 										for sub in liveMatchesJSON["players"]:
# 											if sub["liveGameTeam"] == team["id"] and sub['id'] in team['subs']:
# 												lmtSub = {} #LeagueOfLegends_PlayerForMatches()
# 												# lmtSub["id"] = sub["id"]
# 												lmtSub["name"] = sub["name"]
# 												lmtSub["role"] = beautifyRole(sub["roleSlug"])
# 												# lmTeam["subs"].append(lmtSub)
# 												lmTeam["subs"][sub["id"]] = lmtSub

# 										#liveMatch["teams"].append(lmTeam)
# 										liveMatch["teams"][team["id"]] = lmTeam
# 							newLiveMatchIds.append(liveMatch["id"])
# 							updateFirebaseList(liveMatch, firebaseLeagueOfLegendsBaseURL, "liveMatch")

# 	print ""
# 	# for uMatch in LeagueOfLegends_UpcomingMatch.find():
# 	for uMatch in firebase_find("upcomingMatches"):
# 		if uMatch["match"] in newLiveMatchIds:
# 			print "\tRemoving upcoming match " + uMatch["match"]
# 			# uMatch.remove()
# 			removeFirebaseListItem(firebaseLeagueOfLegendsBaseURL, "upcomingMatches", "id", uMatch["id"])

# 	# for lMatch in LeagueOfLegends_LiveMatch.find():
# 	for lMatch in firebase_find("liveMatches"):
# 		if lMatch["id"] not in newLiveMatchIds:
# 			handleLiveMatchDeath(lMatch, getTournaments(lMatch["league"]))

# def handleLiveMatchDeath(liveMatch, tournamentJSON):
# 	for tournament in tournamentJSON["highlanderTournaments"]:
# 		if tournament["id"] == liveMatch["tournament"]:
# 			for bKey in tournament["brackets"].keys():
# 				for mKey in tournament["brackets"][bKey]["matches"].keys():
# 					if mKey == liveMatch["id"]:
# 						matchJSON = getMatchDetails(liveMatch["tournament"], liveMatch["id"])

# 						# handleMatch(LeagueOfLegends_Match.find_one({"id": mKey}), matchJSON, tournament["brackets"][bKey]["matches"][mKey], liveMatch["tournament"])
# 						handleMatch(firebase_find_one("matches", "id", mKey), matchJSON, tournament["brackets"][bKey]["matches"][mKey], liveMatch["tournament"])
						
# 						for gameKey in tournament["brackets"][bKey]["matches"][mKey]["games"].keys():
							
# 							for gameIdMap in matchJSON["gameIdMappings"]:
# 								if gameIdMap["id"] == tournament["brackets"][bKey]["matches"][mKey]["games"][gameKey]["id"]:

# 									_gameHash = gameIdMap["gameHash"]

# 									if "gameRealm" in tournament["brackets"][bKey]["matches"][mKey]["games"][gameKey].keys() and "gameId" in tournament["brackets"][bKey]["matches"][mKey]["games"][gameKey].keys():
# 										_gameRelam = tournament["brackets"][bKey]["matches"][mKey]["games"][gameKey]["gameRealm"]
# 										_gameId = tournament["brackets"][bKey]["matches"][mKey]["games"][gameKey]["gameId"].strip() # This is here because Riot refuses to acknowledge an error in the lolesports.com api. \t ftw

# 										handleGameStats(firebase_find_one("gameDetails", "id", gameIdMap["id"]), gameIdMap, _gameRelam, _gameId, _gameHash, tournament["brackets"][bKey]["matches"][mKey], tournament["rosters"], matchJSON)
# 										handleGameTimeline(firebase_find_one("gameTimelines", "id", gameIdMap["id"]), gameIdMap, _gameRelam, _gameId, _gameHash, mKey)

# 									else:
# 										print "\t\t\tSkipping game " + gameKey + ", insufficiant data"

# 	print "\tRemoving live match " + liveMatch["id"]
# 	# liveMatch.remove()
# 	removeFirebaseListItem(firebaseLeagueOfLegendsBaseURL, "liveMatches", "id", liveMatch["id"])

# def handleUpcomingMatches():
# 	for i in range(0, 50):
# 		leaguesJSON = getLeagues(i)
# 		if "error" not in leaguesJSON.keys():
# 			league = leaguesJSON["leagues"][0]

# 			scheduledItems = getScheduleItems(league["id"])
# 			if "scheduleItems" in scheduledItems.keys():
# 				print "\tHandling scheduled Items for " + league["name"].encode('utf-8')
# 				for scheduledItem in scheduledItems["scheduleItems"]:
# 					if str(datetime.strptime(scheduledItem["scheduledTime"].split(".")[0], "%Y-%m-%dT%H:%M:%S") - datetime.strptime(time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()).split("+")[0].replace("Z", ""), "%Y-%m-%dT%H:%M:%S"))[0] != "-":
# 						print "\t\tHandling scheduled Item " + scheduledItem["id"].encode('utf-8')
# 						if "match" in scheduledItem.keys():
# 							upcomingMatch = firebaseMain.get("upcomingMatches/" + scheduledItem["id"], None)

# 							if upcomingMatch == None:
# 								upcomingMatch = {} #LeagueOfLegends_UpcomingMatch()
# 								upcomingMatch["id"] = scheduledItem["id"]
							
# 							upcomingMatch["match"] = scheduledItem["match"]
# 							upcomingMatch["scheduledTime"] = scheduledItem["scheduledTime"]
# 							upcomingMatch["tournament"] = scheduledItem["tournament"]
# 							upcomingMatch["league"] = league["id"]
# 							upcomingMatch["leagueName"] = league["name"]

# 							for schedTournament in scheduledItems["highlanderTournaments"]:
# 								if schedTournament["id"] == scheduledItem["tournament"]:
# 									upcomingMatch["tournamentName"] = schedTournament["description"]
							
# 							upcomingMatchDetailsJSON = getMatchDetails(scheduledItem["tournament"], scheduledItem["match"])
							
# 							upcomingMatch["teams"] = {} #orm.List(type=LeagueOfLegends_TeamForMatches)	
# 							for umdteam in upcomingMatchDetailsJSON.get("teams"):
# 								umTeam = {} #LeagueOfLegends_TeamForMatches()
# 								umTeam["id"] = umdteam["id"]
# 								umTeam["name"] = umdteam["name"]

# 								umTeam["starters"] = {}
# 								umTeam["subs"] = {}
# 								for starter in upcomingMatchDetailsJSON.get("players"):
# 									if starter['liveGameTeam'] == umdteam['id'] and starter['id'] in umdteam['starters']:
# 										umtStarter = {} #LeagueOfLegends_PlayerForMatches()
# 										umtStarter["id"] = starter["id"]
# 										umtStarter["name"] = starter["name"]
# 										umtStarter["role"] = beautifyRole(starter["roleSlug"])
# 										umTeam["starters"][starter["id"]] = umtStarter

# 								for sub in upcomingMatchDetailsJSON.get("players"):
# 									if sub["liveGameTeam"] == umdteam["id"] and sub['id'] in umdteam['subs']:
# 										umtSub = {} #LeagueOfLegends_PlayerForMatches()
# 										umtSub["id"] = sub["id"]
# 										umtSub["name"] = sub["name"]
# 										umtSub["role"] = beautifyRole(sub["roleSlug"])
# 										umTeam["subs"][sub["id"]] = umtSub

# 								upcomingMatch["teams"][umdteam["id"]] = umTeam

# 							firebaseMain.patch("upcomingMatches/" + upcomingMatch["id"], upcomingMatch)
# 			else:
# 				print "\tSkipping scheduled items for " + leagueName.encode('utf-8')

# playerIds = []
# teamIds = []

# teamsToAdd = {}
# playersToAdd = {}

def handleDatabase():
	allPlayersAndTeamsJSON = getScheduleItems(0)
	# handlePlayers(allPlayersAndTeamsJSON)
	# handleTeams(allPlayersAndTeamsJSON)
	gameReqs = {}
	for i in range(1, 50):
		leaguesJSON = getLeagues(i)
		if "error" not in leaguesJSON.keys():
			league = leaguesJSON["leagues"][0]
			handleLeague(firebaseMain.get("leagues/" + str(league["id"]), None), league)
			tournamentJSON = getTournaments(league["id"])
			scheduledItemJSON = getScheduleItems(league["id"])
			if "error" not in tournamentJSON.keys():

			 	for t in tournamentJSON["highlanderTournaments"]:
					handleTournament(firebaseMain.get("tournaments/" + str(t["id"]), None), t, league)

					for bracketKey in t["brackets"].keys():
						for matchKey in t["brackets"][bracketKey]["matches"].keys():

							if t["brackets"][bracketKey]["matches"][matchKey]["state"] == "resolved":

								matchJSON = getMatchDetails(t["id"], t["brackets"][bracketKey]["matches"][matchKey]["id"])
							
								if "error" not in matchJSON.keys():
									if t["brackets"][bracketKey]["matches"][matchKey]["state"] == 'resolved':

										handleMatch(firebaseMain.get("matches/" + matchKey, None), matchJSON, t["brackets"][bracketKey]["matches"][matchKey], t["id"])

										for gameKey in t["brackets"][bracketKey]["matches"][matchKey]["games"].keys():
											for gameIdMap in matchJSON["gameIdMappings"]:
												if gameIdMap["id"] == t["brackets"][bracketKey]["matches"][matchKey]["games"][gameKey]["id"]:

													_gameHash = gameIdMap["gameHash"]

													if "gameRealm" in t["brackets"][bracketKey]["matches"][matchKey]["games"][gameKey].keys() and "gameId" in t["brackets"][bracketKey]["matches"][matchKey]["games"][gameKey].keys():
														_gameRelam = t["brackets"][bracketKey]["matches"][matchKey]["games"][gameKey]["gameRealm"]
														_gameId = t["brackets"][bracketKey]["matches"][matchKey]["games"][gameKey]["gameId"].strip() # This is here because Riot refuses to acknowledge an error in the lolesports.com api. \t ftw

														handleGameStats(firebaseMain.get("gameStats/" + gameIdMap["id"].replace("/", ""), None), gameIdMap, _gameRelam, _gameId, _gameHash, t["brackets"][bracketKey]["matches"][matchKey], t["rosters"], matchJSON, t["id"])
														handleGameTimeline(firebaseMain.get("gameTimelines/" + gameIdMap["id"].replace("/", ""), None), gameIdMap, _gameRelam, _gameId, _gameHash, matchKey)

													else:
														print "\t\t\tSkipping game " + gameKey + ", insufficiant data"
									else:
										pass								

								else: 
									print "\t\tErrored trying match" + t["brackets"][bracketKey]["matches"][matchKey]["name"]				
					addPlayerTournamentStats(t["id"])
			else:
				print "\tErrored trying " + leaguesJSON["leagues"][0]["name"].encode('utf-8')
		else:
			print "Errored trying league " + str(i).encode('utf-8')

supportedMiscLanguageCodes = ["en_US"]

def handleRunes(runes, language, json):
	print "Handling Runes for " + language + " on patch " + json["version"]
	if runes == None:
		runes = {}
		for runeKey in json["data"].keys():
			rune = {} #LeagueOfLegends_Rune()

			rune["id"] = int(runeKey)
			rune["tier"] = json["data"][runeKey]["rune"]["tier"]
			rune["type"] = json["data"][runeKey]["rune"]["type"]
			
			rune["tags"] = []
			for tag in json["data"][runeKey]["tags"]:
				rune["tags"].append(tag)

			rune["stats"] = {} #orm.List(type=LeagueOfLegends_MiscStat)
			try:
				for statKey in json["data"][runeKey]["stats"].keys():
					rune["stats"][statKey] = json["data"][runeKey]["stats"][statKey]
			except: pass

			runeImage = {} #LeagueOfLegends_MiscImage()
			attributeSetter(runeImage, json["data"][runeKey]["image"], ["sprite", "full", "group"])
			runeImage["full"] = getRuneImage(json["version"], json["data"][runeKey]["image"]["full"])
			runeImage["sprite"] = getSprite(json["version"], json["data"][runeKey]["image"]["sprite"])
			rune["image"] = runeImage

			rune["names"] = {}
			rune["names"][language] = json["data"][runeKey]["name"]

			rune["descriptions"] = {}
			rune["descriptions"][language] = json["data"][runeKey]["description"]

			runes[int(runeKey)] = rune

		firebaseMisc.patch("runes/" + json["version"].replace(".", "-"), runes)
	
	else:
		existingLangs = [lang for lang in runes[runes.keys()[0]]["names"]]
		if language not in existingLangs:
			for runeKey in json["data"]:
				for rune in runes["runes"]:
					if int(runeKey) == rune["id"]:
						rune["names"][language] = json["data"][runeKey]["name"]

						rune["descriptions"][language] = json["data"][runeKey]["description"]

			firebaseMisc.patch("runes/" + json["version"].replace(".", "-"), runes)

def handleMasteries(masteries, language, json):
	print "Handling Masteries for " + language + " on patch " + json["version"]
	if masteries == None:
		masteries = {}
		masteries["tree"] = {}
		for treeBranchKey in json["tree"]:
			masteryTreeBranch = {} #LeagueOfLegends_MasteryTreeBranch()
			masteryTreeBranch["name"] = treeBranchKey
			masteryTreeBranch["branch"] = {}
			rowCount = 0
			for subBranch in json["tree"][treeBranchKey]:
				branchRow = {} #LeagueOfLegends_MasteryTreeBranchRow()
				branchRow["row"] = rowCount
				branchRow["masteries"] = []

				for twig in subBranch:
					masteryTreeBranchTwig = {} #LeagueOfLegends_MasteryTreeBranchTwig()
					if twig != None:
						masteryTreeBranchTwig["masteryId"] = twig["masteryId"]
						masteryTreeBranchTwig["prerep"] = twig["prereq"]
					else:
						masteryTreeBranchTwig["masteryId"] = None
						masteryTreeBranchTwig["prerep"] = None

					branchRow["masteries"].append(masteryTreeBranchTwig)
				rowCount += 1

				masteryTreeBranch["branch"][rowCount - 1] = branchRow 

			masteries["tree"][treeBranchKey] = masteryTreeBranch

		for masteryKey in json["data"].keys():
			mastery = {} #LeagueOfLegends_Mastery()

			mastery["id"] = json["data"][masteryKey]["id"]
			mastery["ranks"] = json["data"][masteryKey]["ranks"]
			mastery["prerep"] = json["data"][masteryKey]["prereq"]

			masteryImage = {} #LeagueOfLegends_MiscImage()
			attributeSetter(masteryImage, json["data"][masteryKey]["image"], ["sprite", "full", "group"])
			masteryImage["full"] = getMasteryImage(json["version"], json["data"][masteryKey]["image"]["full"])
			masteryImage["sprite"] = getSprite(json["version"], json["data"][masteryKey]["image"]["sprite"])
			mastery["image"] = masteryImage

			mastery["names"] = {}
			mastery["names"][language] = json["data"][masteryKey]["name"]

			mastery["descriptions"] = {}
			mastery["descriptions"][language] = []
			for description in json["data"][masteryKey]["description"]:
				if description != None:
					mastery["descriptions"][language] = json["data"][masteryKey]["description"]

			masteries[json["data"][masteryKey]["id"]] = mastery

		firebaseMisc.patch("masteries/" + json["version"].replace(".", "-"), masteries)

	else:
		existingLangs = [lang for lang in masteries[masteries.keys()[0]]["names"]]
		if language not in existingLangs:
			for masteryKey in json["data"]:
				for mastery in masteryList["masteries"]:
					if int(masteryKey) == mastery["id"]:
						mastery["names"][language] = json["data"][masteryKey]["name"]
						mastery["descriptions"][language] = []
						for description in json["data"][masteryKey]["description"]:
							if description != None:
								mastery["descriptions"][language].append(description)
						
			firebaseMisc.patch("masteries/" + json["version"].replace(".", "-"), masteries)

def handleItems(items, language, json, currentPatchMapJSON):
	print "Handling Items for " + language + " on patch " + json["version"]
	if items == None:
		items = {}

		for itemKey in json["data"].keys():
			item = {} #LeagueOfLegends_Item()
			item["id"] = int(itemKey)

			item["group"] = json["data"][itemKey].get("group") 

			item['builtFrom'] = []
			if json["data"][itemKey].get('from'):
				for _from in json["data"][itemKey]["from"]:
					item["builtFrom"].append(int(_from))

			item["effects"] = []
			if json["data"][itemKey].get('effect'):
				for effect in json["data"][itemKey]["effect"]:
					itemEffect = {} #LeagueOfLegends_MiscEffect()
					itemEffect["effect"] = effect
					itemEffect["value"] = json["data"][itemKey]["effect"][effect]
					item["effects"].append(itemEffect)

			item["depth"] =  json["data"][itemKey].get("depth")
			item["consumed"] = json["data"][itemKey].get("consumed")
			item["consumeOnFull"] = json["data"][itemKey].get("consumeOnFull")
			item["hideFromAll"] = json["data"][itemKey].get("hideFromAll")
			item["specialRecipe"] = json["data"][itemKey].get("specialRecipe")
			item["inStore"] = json["data"][itemKey].get("inStore")
			item["requiredChampion"] = json["data"][itemKey].get("requiredChampion")
			item["stacks"] = json["data"][itemKey].get("consumed")

			itemImage = {} #LeagueOfLegends_MiscImage()
			attributeSetter(itemImage, json["data"][itemKey]["image"], ["sprite", "full", "group"])
			itemImage["full"] = getItemImage(json["version"], json["data"][itemKey]["image"]["full"])
			itemImage["sprite"] = getSprite(json["version"], json["data"][itemKey]["image"]["sprite"])
			item["image"] = itemImage

			itemGold = {} #LeagueOfLegends_MiscGold()
			attributeSetter(itemGold, json["data"][itemKey]["gold"])
			item["gold"] = itemGold

			item["buildsInto"] = []
			if json['data'][itemKey].get('into'):
				for into in json["data"][itemKey]["into"]:
					if into != None:
						item["buildsInto"].append(int(into))

			item['tags'] = []
			for tag in json["data"][itemKey]["tags"]:
				item["tags"].append(tag)

			item['stats'] = {}
			for stat in json["data"][itemKey]["stats"]:
				item["stats"][stat] = json["data"][itemKey]["stats"][stat]

			item['maps'] = []
			if "maps" in json["data"][itemKey].keys():
				for _map in json["data"][itemKey].get("maps"):
					itemMap = {}
					itemMap[_map] = json["data"][itemKey]["maps"][_map]
					item["maps"].append(itemMap)

			# try:
			# 	for _map in json["data"][itemKey]["maps"]:
			# 		#############################################################
			# 		_tmpMap = _map
			# 		if type(_map) == unicode:
			# 			for mK in currentPatchMapJSON["data"].keys():
			# 				print currentPatchMapJSON["data"][mK]["MapName"], _map
			# 				if currentPatchMapJSON["data"][mK]["MapName"] == _map:
			# 					_tmpMap = int(currentPatchMapJSON["data"][mK]["MapId"])
			# 				elif _map == u"TwistedTreeline":
			# 					_tmpMap = 10
			# 		#############################################################
			# 		itemMap = {} #LeagueOfLegends_MiscMap()
			# 		#itemMap["mapId"] = _map
			# 		itemMap["mapId"] = _tmpMap
			# 		itemMap["available"] = json["data"][itemKey]["maps"][_map]
			# 		item["maps"].append(itemMap)
			# except: pass

			item['names'] = {}
			item["names"][language] = json["data"][itemKey]["name"]

			item['descriptions'] = {}
			item["descriptions"][language] = json["data"][itemKey]["description"]

			item['plaintexts'] = {}
			item["plaintexts"][language] = json["data"][itemKey]["plaintext"]

			items[int(itemKey)] = item

		firebaseMisc.patch("items/" + json["version"].replace(".", "-"), items)

	else:
		existingLangs = [lang for lang in items[items.keys()[0]]["names"]]
		if language not in existingLangs:
			for itemKey in json["data"]:
				for item in itemList["items"]:
					if int(itemKey) == item["id"]:
						item["names"][language] = json["data"][itemKey]["name"]			
						item["descriptions"][language] = json["data"][itemKey]["description"]			
						item["plaintexts"][language] = json["data"][itemKey]["plaintext"]
		
			firebaseMisc.patch("items/" + json["version"].replace(".", "-"), items)

def handleSummoners(summoners, language, json):
	print "Handling Summoner Spells for " + language + " on patch " + json["version"]
	if summoners == None:
		summoners = {}

		for summonerKey in json["data"].keys():
			summoner = {} #LeagueOfLegends_SummonerSpell()
			summoner["id"] = json["data"][summonerKey]["id"]

			summonerImage = {} #LeagueOfLegends_MiscImage()
			attributeSetter(summonerImage, json["data"][summonerKey]["image"], ["sprite", "full", "group"])
			summonerImage["full"] = getSpellImage(json["version"], json["data"][summonerKey]["image"]["full"])
			summonerImage["sprite"] = getSprite(json["version"], json["data"][summonerKey]["image"]["sprite"])
			summoner["image"] = summonerImage

			summoner['names'] = {}
			summoner["names"][language] = json["data"][summonerKey]["name"]

			summoner["descriptions"] = {}
			summoner["descriptions"][language] = json["data"][summonerKey]["description"]

			summoner["tooltips"] = {}
			summoner["tooltips"][language] = json["data"][summonerKey]["tooltip"]

			summoner["cooldown"] = int(json["data"][summonerKey]["cooldownBurn"])
			summoner["key"] = int(json["data"][summonerKey]["key"])

			if json["data"][summonerKey]["rangeBurn"] == "self":
				summoner["range"] = 0
			else:
				summoner["range"] = int(json["data"][summonerKey]["rangeBurn"])
				
			summoner["summonerLevel"] = json["data"][summonerKey].get("summonerLevel")

			summoner["maxAmmo"] = int(json["data"][summonerKey]["maxammo"]) if json["data"][summonerKey].get("maxammo") else None
			
			summoner["modes"] = []
			if json["data"][summonerKey].get("modes"):
				for mode in json["data"][summonerKey]["modes"]:
					summoner["modes"].append(mode)

			summoner["vars"] = []
			for var in json["data"][summonerKey]["vars"]:
				summonerVar = {} #LeagueOfLegends_MiscVar()
				summonerVar["link"] = var["link"]
				summonerVar["key"] = var["key"]
				summonerVar["coeff"] = []
				if type(var["coeff"]) == list:
					for coeff in var["coeff"]:
						summonerVar["coeff"].append(coeff)
				else:
					summonerVar["coeff"].append(var["coeff"])

				summoner["vars"].append(summonerVar)

			summoner["effect"] = []
			for effectTick in json["data"][summonerKey]["effectBurn"]:
				if effectTick != None:
					summoner["effect"].append(float(effectTick))
				else:
					summoner["effect"].append(-1)

			summoners[json["data"][summonerKey]["id"]] = summoner
		
		firebaseMisc.patch("summoners/" + json["version"].replace(".", "-"), summoners)

	else:
		existingLangs = [lang for lang in summoners[summoners.keys()[0]]["names"]]
		if language not in existingLangs:
			for summonerKey in json["data"]:
				for summoner in summonerList["summoners"]:
					if summonerKey == summoner["id"]:
						summoner["names"][language] = json["data"][summonerKey]["name"]
						summoner["descriptions"][language] = json["data"][summonerKey]["name"]
						summoner["tooltips"][language] = json["data"][summonerKey]["tooltip"]
			firebaseMisc.patch("summoners/" + json["version"].replace(".", "-"), summoners)

def handleChampions(champions, language, json):
	print "Handling Champions for " + language + " on patch " + json["version"]
	if champions == None:
		champions = {}

		for championKey in json["data"].keys():
			champion = {} #LeagueOfLegends_Champion()
			champion["id"] = json["data"][championKey]["id"]
			champion["key"] = int(json["data"][championKey]["key"])
			champion["parType"] = json["data"][championKey]["partype"]

			championImage = {} #LeagueOfLegends_MiscImage()
			attributeSetter(championImage, json["data"][championKey]["image"], ["sprite", "full", "group"])
			championImage["full"] = getChampionIcon(json["version"], json["data"][championKey]["image"]["full"])
			championImage["sprite"] = getSprite(json["version"], json["data"][championKey]["image"]["sprite"])
			champion["image"] = championImage

			champion["names"] = {}
			champion["names"][language] = json["data"][championKey]["name"]
			
			champion["titles"] = {}
			champion["titles"][language] = json["data"][championKey]["title"]
			
			champion["lores"] = {}
			champion["lores"][language] = json["data"][championKey]["lore"]
			
			champion["blurbs"] = {}
			champion["blurbs"][language] = json["data"][championKey]["blurb"]

			champion["allyTips"] = {}
			champion["allyTips"][language] = []
			for allyTip in json["data"][championKey]["allytips"]:
				champion["allyTips"][language].append(allyTip)

			champion["enemyTips"] = {}
			champion["enemyTips"][language] = []
			for enemyTip in json["data"][championKey]["enemytips"]:
				champion["enemyTips"][language].append(enemyTip)

			champion["tags"] = []
			for tag in json["data"][championKey]["tags"]:
				champion["tags"].append(tag)

			championInfo = {} #LeagueOfLegends_ChampionInfo()
			attributeSetter(championInfo, json["data"][championKey]["info"])
			champion["info"] = championInfo

			championStats = {} #LeagueOfLegends_ChampionStats()
			attributeSetter(championStats, json["data"][championKey]["stats"], ["hpperlevel", "mpperlevel", "movespeed", "armorperlevel", "spellblock", "spellblockperlevel", "attackrange", "hpregen", "hpregenperlevel", "mpregen", "mpregenperlevel", "critperlevel", "attackdamage", "attackdamageperlevel", "attackspeedoffset", "attackspeedperlevel"])
			championStats["hpPerLevel"] = json["data"][championKey]["stats"]["hpperlevel"]
			championStats["mpPerLevel"] = json["data"][championKey]["stats"]["mpperlevel"]
			championStats["moveSpeed"] = json["data"][championKey]["stats"]["movespeed"]
			championStats["armorPerLevel"] = json["data"][championKey]["stats"]["armorperlevel"]
			championStats["spellBlock"] = json["data"][championKey]["stats"]["spellblock"]
			championStats["spellBlockPerLevel"] = json["data"][championKey]["stats"]["spellblockperlevel"]
			championStats["attackRange"] = json["data"][championKey]["stats"]["attackrange"]
			championStats["hpRegen"] = json["data"][championKey]["stats"]["hpregen"]
			championStats["hpRegenPerLevel"] = json["data"][championKey]["stats"]["hpregenperlevel"]
			championStats["mpRegen"] = json["data"][championKey]["stats"]["mpregen"]
			championStats["mpRegenPerLevel"] = json["data"][championKey]["stats"]["mpregenperlevel"]
			championStats["critPerLevel"] = json["data"][championKey]["stats"]["critperlevel"]
			championStats["attackDamage"] = json["data"][championKey]["stats"]["attackdamage"]
			championStats["attackDamagePerLevel"] = json["data"][championKey]["stats"]["attackdamageperlevel"]
			championStats["attackSpeedOffset"] = json["data"][championKey]["stats"]["attackspeedoffset"]
			championStats["attackSpeedPerLevel"] = json["data"][championKey]["stats"]["attackspeedperlevel"]

			champion["stats"] = championStats
			champion["skins"] = {}
			for skin in json["data"][championKey]["skins"]:
				championSkin = {} #LeagueOfLegends_ChampionSkin()
				championSkin["id"] = int(skin["id"])
				
				# After patch 3.13.8 skins have urls
				if u"num" in skin.keys():
					championSkin["splashImage"] = getSplashImage(champion["id"], skin["num"])
					championSkin["loadingImage"] = getLoadingImage(champion["id"], skin["num"])

				attributeSetter(championSkin, skin, ["name", "id", "image"])
				
				championSkin["names"] = {}
				championSkin["names"][language] = skin["name"]
				champion["skins"][int(skin["id"])] = championSkin

			champion["spells"] = {}
			for spell in json["data"][championKey]["spells"]:
				championSpell = {} #LeagueOfLegends_ChampionSpell()
				championSpell["id"] = spell["id"]

				championSpell["names"] = {}
				championSpell["names"][language] = spell["name"]
				
				championSpell["descriptions"] = {}
				championSpell["descriptions"][language] = spell["description"]
				
				championSpell["tooltips"] = {}
				championSpell["tooltips"][language] = spell["tooltip"]

				if "leveltip" in spell.keys():
					championSpell["leveltip"] = {}
					championSpell["leveltip"]["labels"] = {}
					championSpell["leveltip"]["labels"][language] = []

					for tipLabel in spell["leveltip"]["label"]:
						championSpell["leveltip"]["labels"][language].append(tipLabel)

					championSpell["leveltip"]["effect"] = []
					for tipEffect in spell["leveltip"]["effect"]:
						championSpell["leveltip"]["effect"].append(tipEffect)

				championSpell["maxRank"] = spell["maxrank"]

				championSpell["cooldown"] = []
				for cooldown in spell["cooldown"]:
					championSpell["cooldown"].append(float(cooldown))

				championSpell["cooldownBurn"] = spell["cooldownBurn"]

				championSpell["cost"] = []
				for cost in spell["cost"]:
					championSpell["cost"].append(cost)

				championSpell["costBurn"] = spell["costBurn"]

				championSpell["effect"] = []
				for effect in spell["effect"]:
					if effect != None:
						championSpell["effect"].append(effect)

				championSpell["effectBurn"] = []
				for effectBurn in spell["effectBurn"]:
					if effectBurn != None:
						championSpell["effectBurn"].append(effectBurn)

				championSpell["vars"] = []
				for var in spell["vars"]:
					spellVar = {} #LeagueOfLegends_MiscVar()
					spellVar["key"] = var["key"]
					spellVar["link"] = var.get("link")
					spellVar["multiplier"] = var.get("multiplier")
					spellVar["coeff"] = []

					if type(var["coeff"]) == list:
						for coeff in var["coeff"]:
							spellVar["coeff"].append(float(coeff))
					else:
						spellVar["coeff"].append(float(var["coeff"]))

					championSpell["vars"].append(spellVar)

				championSpell["costType"] = spell["costType"]

				championSpell["maxAmmo"] = spell.get("maxammo")

				championSpell["range"] = []
				if spell["range"] == u"self":
					championSpell["range"].append(float(0))
				else:
					for range in spell["range"]:
						championSpell["range"].append(float(range))

				championSpell["rangeBurn"] = spell["rangeBurn"]

				spellImage = {} #LeagueOfLegends_MiscImage()
				attributeSetter(spellImage, spell["image"], ["sprite", "full", "group"])
				spellImage["full"] = getSpellImage(json["version"], spell["image"]["full"])
				spellImage["sprite"] = getSprite(json["version"], spell["image"]["sprite"])
				championSpell["image"] = spellImage

				championSpell["resources"] = {}
				championSpell["resources"][language] = spell.get("resource")

				champion["spells"][championSpell["id"]] = championSpell

			championPassive = {}
			championPassive["names"] = {}
			championPassive["names"][language] = json["data"][championKey]["passive"]["name"]

			championPassive["descriptions"] = {}
			championPassive["descriptions"][language] = json["data"][championKey]["passive"]["description"]

			try:
				passiveImage = {} #LeagueOfLegends_MiscImage()
				attributeSetter(passiveImage, json["data"][championKey]["passive"]["image"], ["sprite", "full", "group"])
				passiveImage["full"] = getPassiveImage(json["version"], json["data"][championKey]["passive"]["image"]["full"])
				passiveImage["sprite"] = getSprite(json["version"], json["data"][championKey]["passive"]["image"]["sprite"])
				championPassive["image"] = passiveImage
			except: pass

			champion["passive"] = championPassive

			champion["recommendations"] = []
			for recommendation in json["data"][championKey]["recommended"]:
				championRecommendation = {} #LeagueOfLegends_ChampionRecommendation()
				attributeSetter(championRecommendation, recommendation, ["blocks"])

				championRecommendation["blocks"] = []
				for reccaBlock in recommendation["blocks"]:
					championRecommendationBlock = {} #LeagueOfLegends_ChampionRecommendationBlock()
					championRecommendationBlock["items"] = []
					attributeSetter(championRecommendationBlock, reccaBlock, ["items"])
					for reccaBlockItem in reccaBlock["items"]:
						championRecommendationBlockItem = {} #LeagueOfLegends_ChampionRecommendationBlockItem()
						championRecommendationBlockItem["items"] = []
						attributeSetter(championRecommendationBlockItem, reccaBlockItem)
						championRecommendationBlock["items"].append(championRecommendationBlockItem)

					championRecommendation["blocks"].append(championRecommendationBlock)

				champion["recommendations"].append(championRecommendation)

			champions[championKey] = champion
		
		firebaseMisc.patch("champions/" + json["version"].replace(".", "-"), champions)

	else:
		existingLangs = [lang for lang in champions[champions.keys()[0]]["names"]]
		if language not in existingLangs:
			for championKey in json["data"]:
				for champion in championList["champions"]:
					if championKey == champion["id"]:
						champion["names"][language] = json["data"][championKey]["name"]
						champion["title"][language] = json["data"][championKey]["title"]
						champion["lore"][language] = json["data"][championKey]["lore"]
						champion["blurb"][language] = json["data"][championKey]["blurb"]

						champion["allyTips"][language] = []
						for allyTip in json["data"][championKey]["allytips"]:
							champion["allyTips"][language].append(allyTip)

						champion["enemyTips"][language] = []
						for enemyTip in json["data"][championKey]["enemytips"]:
							champion["enemyTips"][language].append(enemyTip)

						for skin in json["data"][championKey]["skins"]:
							for cSkin in champion["skins"]:
								if int(skin["id"]) == cSkin["id"]:
									cSkin["names"][language] = skin["name"]
							
						for spell in json["data"][championKey]["spells"]:
							for cSpell in champion["spells"]:
								if spell["id"] == cSpell["id"]:
									cSpell["names"][language] = spell["name"]
									cSpell["descriptions"][language].append(spell["description"])
									cSpell["tooltips"][language].append(spell["tooltip"])

									for tipLabel in spell["leveltip"]["label"]:
										cSpell["levelTip"]["labels"][language].append(tipLabel)
								
									cSpell["resources"][language] = spell["resource"]

						
						champion["passive"]["names"][language] = json["data"][championKey]["passive"]["name"]
						champion["passive"]["descriptions"][language] = json["data"][championKey]["passive"]["description"]

			firebaseMisc.patch("champions/" + json["version"].replace(".", "-"), champions)

def handleMaps(maps, json):
	if "data" in json.keys():
		if json["data"].keys() != []:
			if maps == None:
				print "Handling Maps for patch " + json["version"]
				maps = {}

				for mapKey in json["data"]:
					_map = {} #LeagueOfLegends_Map()
					_map["id"] = json["data"][mapKey]["MapId"]
					_map["name"] = json["data"][mapKey]["MapName"]

					mapImage = {} #LeagueOfLegends_MiscImage()
					attributeSetter(mapImage, json["data"][mapKey]["image"], ["sprite", "full", "group"])
					mapImage["full"] = getMapImage(json["version"], json["data"][mapKey]["image"]["full"])
					mapImage["sprite"] = getSprite(json["version"], json["data"][mapKey]["image"]["sprite"])
					_map["image"] = mapImage

					_map["unpurchasableItemList"] = []
					if json["data"][mapKey].get("UnpurchasableItemList"):
						for unpurchasableItem in json["data"][mapKey]["UnpurchasableItemList"]:
							_map["unpurchasableItemList"].append(int(unpurchasableItem))

					maps[int(mapKey)] = _map
				firebaseMisc.patch("maps/" + json["version"].replace(".", "-"), maps)

def handleProfileIcons(profileIcons, json):
	if "data" in json.keys():
		if json["data"].keys() != []:
			print "Handling Profile Icons for patch " + json["version"]
			if profileIcons == None:
				profileIcons = {}

				for iconKey in json["data"]:
					icon = {} #LeagueOfLegends_ProfileIcon()
					icon["id"] = json["data"][iconKey]["id"]

					iconImage = {} #LeagueOfLegends_MiscImage()
					attributeSetter(iconImage, json["data"][iconKey]["image"], ["sprite", "full", "group"])
					iconImage["full"] = getProfileIcon(json["version"], json["data"][iconKey]["image"]["full"])
					iconImage["sprite"] = getSprite(json["version"], json["data"][iconKey]["image"]["sprite"])
					icon["image"] = iconImage

					profileIcons[int(iconKey)] = icon
				firebaseMisc.patch("profileIcons/" + json["version"].replace(".", "-"), profileIcons)

def handleStickers(stickers, json):
	if "data" in json.keys():
		if json["data"].keys() != []:
			print "Handling Stickers for patch " + json["version"]
			if stickers == None:
				stickers = {}
				for stickerKey in json["data"]:
					sticker = {}
					sticker["id"] = int(json["data"][stickerKey]["id"])
					sticker["name"] = stickerKey
					
					stickerImage = {}
					attributeSetter(stickerImage, json["data"][stickerKey]["image"], ["sprite", "full", "group"])
					stickerImage["full"] = getStickerImage(json["version"], json["data"][stickerKey]["image"]["full"])
					stickerImage["sprite"] = getSprite(json["version"], json["data"][stickerKey]["image"]["sprite"])
					sticker["image"] = stickerImage

					stickers[sticker["name"]] = sticker
				firebaseMisc.patch("stickers/" + json["version"].replace(".", "-"), stickers)

def handleMisc(specificPatch=None):
	if specificPatch == None:
		patchs = getAPIVersions()
		# Comment out when done. For initialization purposes only. Replace 4.10.2 with whatever patch you last added.
		# Speeds up the process
		newVersions = []
		for patch in patchs:
			if patch == "6.19.1":
				break
			newVersions.append(patch)
		#patchs = newVersions

		#######################################
		patchs.reverse()

		for i in range(0, 7):
			for patch in patchs:
				if "lolpatch_" in patch:
					patchs.remove(patch)
		# I need to repeat this 7 times to remove the shit from the list. Each one removes half for some reason

	else:
		patchs = [specificPatch]

	for patch in patchs:
		print "---------------------- Handling " + patch + "----------------------"
		patchForFirebase = patch.replace(".", "-")
				
		runes = firebaseMisc.get("misc/" + patchForFirebase + "/runes", None)
		masteries = firebaseMisc.get("misc/" + patchForFirebase + "/masteries", None)
		items = firebaseMisc.get("misc/" + patchForFirebase + "/items", None)
		summoners = firebaseMisc.get("misc/" + patchForFirebase + "/summoners", None)
		champions = firebaseMisc.get("misc/" + patchForFirebase + "/champions", None)
		maps = firebaseMisc.get("misc/" + patchForFirebase + "/maps", None)
		profileIcons = firebaseMisc.get("misc/" + patchForFirebase + "/profileIcons", None)
		stickers = firebaseMisc.get("misc/" + patchForFirebase + "/stickers", None)

		json = getMapsData(patch, "en_US")
		if "error" not in json.keys():
			handleMaps(maps, json)

		json = getProfileIconsData(patch, "en_US")
		if "error" not in json.keys():
			handleProfileIcons(profileIcons, json)

		json = getStickersData(patch, "en_US")
		if "error" not in json.keys():
			handleStickers(stickers, json)

		for language in supportedMiscLanguageCodes:
			json = getRunesData(patch, language)
			if "error" not in json.keys():
				handleRunes(runes, language, json) # Come back and make this better

			json = getMasteriesData(patch, language)
			if "error" not in json.keys():
				handleMasteries(masteries, language, json)

			json = getItemsData(patch, language)
			if "error" not in json.keys():
				handleItems(items, language, json, getMapsData(getAPIVersions()[0], language))

			json = getSummonersData(patch, language)
			if "error" not in json.keys():
				handleSummoners(summoners, language, json)

			json = getChampionsData(patch, language)
			if "error" not in json.keys():
				handleChampions(champions, language, json)

		print ""


# def createDatabase():
# 	handleDatabase()
# 	handleMisc()

if __name__ == '__main__':
	# This removes a lot of warnings that would appear on the command line. Makes it easier to see the printout
	requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
	handleDatabase()
	#handleMisc()
	#handleUpcomingMatches()
	#handleLiveMatches()






