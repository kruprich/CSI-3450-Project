MID_LANE_ROLE_STRING = "Mid Lane"
TOP_LANE_ROLE_STRING = "Top Lane"
AD_CARRY_LANE_ROLE_STRING = "AD Carry"
SUPPORT_ROLE_STRING = "Support"
JUNGLER_ROLE_STRING = "Jungler"

def beautifyRole(role):
	if role == "midlane":
		return "Mid Lane"
	elif role == "toplane":
		return "Top Lane"
	elif role == "adcarry":
		return "AD Carry"
	elif role == "support":
		return "Support"
	elif role == "jungle":
		return "Jungler"

def beautifyGeneratedName(generatedName):
	splitName = generatedName.split("|")
	if len(splitName) >= 3:
		return splitName[0] + " vs " + splitName[1] + " - " + splitName[2]
	else:
		return splitName[0]

def beautifyTeamReference(teamReference):
	return teamReference.split("urn:rg:lolesports:global:player:player:")[1]