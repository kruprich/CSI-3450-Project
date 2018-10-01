import datetime, logging, json, requests, pytz, os, urllib, time, sys, shutil, psycopg2, decimal
from requests.packages.urllib3.exceptions import InsecureRequestWarning

from datetime import datetime
from dateutil import parser
from common import *
from lol_esports_api import *

conn = psycopg2.connect(database="", user="", password="")

# example function
# sql statement: CREATE OR REPLACE FUNCTION "addPlayer"(firstName TEXT, lastName TEXT, inGameName TEXT, photoURL TEXT, region INT, birthdate TIMESTAMP)
def addPlayer(player):
	curr = conn.cursor()
	SQL_STATEMENT_STRING = 'SELECT * FROM "addPlayer"(CAST(%s AS TEXT), CAST(%s AS TEXT), CAST(%s AS TEXT), CAST(%s AS TEXT), %s, %s)'
	values = [firstName, lastName, inGameName, photoURL, region, birthdate]
	executeSQL(curr, SQL_STATEMENT_STRING, values)
	result = curr.fetchone()
	conn.commit()
	curr.close()

def updatePlayer():
	curr = conn.cursor()
	SQL_STATEMENT_STRING = 'SELECT * FROM "updatePlayer"()'
	values = []
	executeSQL(curr, SQL_STATEMENT_STRING, values)
	result = curr.fetchone()
	conn.commit()
	curr.close()

def deletePlayer():
	curr = conn.cursor()
	SQL_STATEMENT_STRING = 'SELECT * FROM "deletePlayer"()'
	values = []
	executeSQL(curr, SQL_STATEMENT_STRING, values)
	result = curr.fetchone()
	conn.commit()
	curr.close()

def addLeague(league):
	curr = conn.cursor()
	SQL_STATEMENT_STRING = 'SELECT * FROM "addLeague"()'
	values = []
	executeSQL(curr, SQL_STATEMENT_STRING, values)
	result = curr.fetchone()
	conn.commit()
	curr.close()

def getLeague(leagueId):
	curr = conn.cursor()
	SQL_STATEMENT_STRING = 'SELECT * FROM "getLeague"(%s)'
	values = [leagueId]
	executeSQL(curr, SQL_STATEMENT_STRING, values)
	result = curr.fetchone()
	conn.commit()
	curr.close()

def excecuteSQL(curr, SQL_STATEMENT_STRING, values):
	try:
		curr.execute(SQL_STATEMENT_STRING, values)
	except (psycopg2.DataError, psycopg2.InternalError, Exception) as e:
		log.msg("ERROR: An error occurred (psycopg2) = " + str(e))
		conn.rollback()