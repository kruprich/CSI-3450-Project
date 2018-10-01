import json, requests, re, simplejson, urllib, time

def getLeagues(_id=None, slug=None):
	time.sleep(.2)
	if(_id == None and slug == None):
		url = "http://api.lolesports.com/api/v1/leagues"
	elif(_id == None and slug != None):
		url = "http://api.lolesports.com/api/v1/leagues?slug=" + str(slug)
	elif(_id != None and slug == None):
		url = "http://api.lolesports.com/api/v1/leagues/" + str(_id)
	elif(_id != None and slug != None):
		url = "http://api.lolesports.com/api/v1/leagues?id=" + str(_id) + "?slug=" + str(slug)
	return makeRequest(url)

def getScheduleItems(leagueId):
	url = "http://api.lolesports.com/api/v1/scheduleItems?leagueId=" + str(leagueId)
	return makeRequest(url)

def getTeam(slug, tournamentId):
	url = "http://api.lolesports.com/api/v1/teams?slug=" + slug + "&tournament=" + tournamentId
	return makeRequest(url)

def getPlayer(slug, tournamentId):
	url = "http://api.lolesports.com/api/v1/players?slug=" + slug + "&tournament=" + tournamentId
	return makeRequest(url)

def getTournaments(leagueId):
	url = "http://api.lolesports.com/api/v2/highlanderTournaments?league=" + str(leagueId)
	return makeRequest(url)

def getMatchDetails(tournamentId, matchId):
	url = "http://api.lolesports.com/api/v2/highlanderMatchDetails?tournamentId=" + str(tournamentId) + "&matchId=" + str(matchId)
	return makeRequest(url)

def getPlayerTournamentStats(tournamentId):
	url = "http://api.lolesports.com/api/v2/tournamentPlayerStats?tournamentId=" + str(tournamentId)
	return makeRequest(url)

def getArticles(language=None, _from=None):
	if(language == None and _from == None):
		url = "http://api.lolesports.com/api/v1/articles"
	elif(language == None and _from != None):
		url = "http://api.lolesports.com/api/v1/articles?from=" + str(_from)
	elif(language != None and _from == None):
		url = "http://api.lolesports.com/api/v1/articles?language=" + str(language)
	elif(language != None and _from != None):
		url = "http://api.lolesports.com/api/v1/articles?language=" + str(language) + "?from=" + str(_from)
	
	return makeRequest(url)

def getMarquees(locale):
	url = "http://api.lolesports.com/api/v1/marquees?locale=" + locale
	return makeRequest(url)

def getHTMLBlocks():
	url = "http://api.lolesports.com/api/v1/htmlBlocks"
	return makeRequest(url)

def getVideos():
	url = "http://api.lolesports.com/api/v2/videos"
	return makeRequest(url)

def getStreamGroups():
	url = "http://api.lolesports.com/api/v2/streamgroups"
	return makeRequest(url)

def getGameStats(gameRealm, gameId, gameHash):
	url = "https://acs.leagueoflegends.com/v1/stats/game/" + str(gameRealm) + "/" + str(gameId) + "?gameHash=" + str(gameHash)
	return makeRequest(url)

def getGameTimeline(gameRealm, gameId, gameHash):
	url = "https://acs.leagueoflegends.com/v1/stats/game/" + str(gameRealm) + "/" + str(gameId) + "/timeline?gameHash=" + str(gameHash)
	return makeRequest(url)

def getPlayerTournamentStats(tournamentId):
	url = "http://api.lolesports.com/api/v2/tournamentPlayerStats?tournamentId=" + tournamentId
	return makeRequest(url)

##################################################
def getAPIVersion(region):
	r = requests.get("https://ddragon.leagueoflegends.com/realms/" + region + ".js")
	return tryJSON(r)

def getLanguages():
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/languages.json")
	return tryJSON(r)

def getAPIVersions():
	r = requests.get("https://ddragon.leagueoflegends.com/api/versions.json")
	return json.loads(r.text)

def getRunesData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/rune.json")
	return tryJSON(r)

def getMasteriesData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/mastery.json")
	return tryJSON(r)

def getRunesReforgedData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/runesReforged.json")
	return tryJSON(r)

def getChampionsData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/champion.json")
	return tryJSON(r)

def getItemsData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/item.json")
	return tryJSON(r)

def getLanguagesData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/language.json")
	return tryJSON(r)

def getSummonersData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/summoner.json")
	return tryJSON(r)

def getChampionData(version, language, champion):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/champion/" + champion + ".json")
	return tryJSON(r)

def getChampionsData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/championFull.json")
	return tryJSON(r)

def getMapsData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/map.json")
	return tryJSON(r)

def getProfileIconsData(version, language):
	r = requests.get("https://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/profileicon.json")
	return tryJSON(r)

def getMiscData(version, language):
	r = requests.get("http://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/language.json")
	return tryJSON(r)

def getStickersData(version, language):
	r = requests.get("http://ddragon.leagueoflegends.com/cdn/" + version + "/data/" + language + "/sticker.json")
	return tryJSON(r)

####################################################################################################################################
# Un-comment the saveImage... and comment out the returns to save to file. Also, change return .... to url = <the url>
def getChampionIcon(version, champion):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/champion/" + champion
	#saveImageToFile(url, "/assets/leagueoflegends/champion/icon/" + champion + ".png")

def getSpellImage(version, spell):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/spell/" + spell
	#saveImageToFile(url, "/assets/leagueoflegends/spell/" + spell + ".png")

def getItemImage(version, item):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/item/" + item
	#saveImageToFile(url, "/assets/leagueoflegends/item/" + item + ".png")

def getRuneImage(version, rune):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/rune/" + rune
	#saveImageToFile(url, "/assets/leagueoflegends/rune/" + rune + ".png")

def getSprite(version, sprite):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/sprite/" + sprite
	#saveImageToFile(url, "/assets/leagueoflegends/sprite/" + sprite + ".png")

def getProfileIcon(version, icon):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/profileicon/" + icon
	#saveImageToFile(url, "/assets/leagueoflegends/profileIcon/" + icon + ".png")

def getBgImage(imageName):
	return "https://ddragon.leagueoflegends.com/cdn/img/bg/" + imageName
	#saveImageToFile(url, "/assets/leagueoflegends/bg/" + imageName + ".png")

def getLoadingImage(champion, skin):
	return "https://ddragon.leagueoflegends.com/cdn/img/champion/loading/" + champion + "_" + str(skin) + ".jpg"
	#saveImageToFile(url, "/assets/leagueoflegends/champion/loading/" + champion + "_" + skin + ".jpg")

def getSplashImage(champion, skin):
	return "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/" + champion + "_" + str(skin) + ".jpg"
	#saveImageToFile(url, "/assets/leagueoflegends/champion/splash/" + champion + "_" + skin + ".jpg")

def getGlobalImage(imageName):
	return "https://ddragon.leagueoflegends.com/cdn/img/global/" + imageName
	#saveImageToFile(url, "/assets/leagueoflegends/global/" + imageName)

def getMasteryImage(version, mastery):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/mastery/" + mastery
	#saveImageToFile(url, "/assets/leagueoflegends/mastery/" + imageName)

def getMapImage(version, _map):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/map/" + _map
	#saveImageToFile(url, "/assets/leagueoflegends/map/" + _map)

def getPassiveImage(version, passive):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/passive/" + passive
	#saveImageToFile(url, "/assets/leagueoflegends/passive/" + passive)

def getStickerImage(version, sticker):
	return "https://ddragon.leagueoflegends.com/cdn/" + version + "/img/sticker/" + sticker

####################################################################################

def saveImageToFile(url, path):
	response = requests.get(url, stream=True)
	with open(path, 'wb') as out_file:
		shutil.copyfileobj(response.raw, out_file)
	del response

####################################################################################

def shortenVersion(version):
	n = 2
	groups = version.split('.')
	return '.'.join(groups[:n]), '.'.join(groups[n:])

def getStreamToken():
	r = requests.get("http://api.lolesports.com/api/issueToken")
	return tryJSON(r)

# I gave up. None were working on their own. But they worked like this. So I give up
def tryJSON(response):
	try:
		response = json.loads(response)
	except:
		return {"error": "Problem with request"}
	
	return response

def makeRequest(url):
	time.sleep(.2)
	r = requests.get(url, verify=False)
	if r.status_code != 200 and r.status_code != 404 and r.status_code != 500:
		time.sleep(5)
		return makeRequest(url)
	return tryJSON(r)