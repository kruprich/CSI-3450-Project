def generateAddFunctionSQL(tableName, _d):

	vs = ""
	for v in _d[tableName]:
		if v['type'] == 'SERIAL':
			continue
		vs += v['col'] + " " + v['type'] + ", "

	vs = vs[:-2]

	vs2 = ""
	for v2 in _d[tableName]:
		if v2['type'] == 'SERIAL':
			continue
		vs2 += v2['col'] +  ", "

	vs2 = vs2[:-2]

	meh = ""
	for m in range(1, (len(_d[tableName]) + 1 if _d[tableName][0]["type"] != "SERIAL" else len(_d[tableName]))):
		meh += "$" + str(m) + ", "
	meh = meh[:-2]

	sql = 'DROP FUNCTION IF EXISTS "add' + tableName + '" (' + vs + ');\n' \
	'CREATE OR REPLACE FUNCTION "add' + tableName + '" (' + vs + ')\n' \
		'\tRETURNS ' + ('INT' if _d[tableName][0]['type'] == 'SERIAL' else _d[tableName][0]['type']) + "\n" \
	'AS $BODY$\n' \
	'DECLARE \n' \
	'\t_' +  _d[tableName][0]['col'] + ' ' + ('INT' if _d[tableName][0]['type'] == 'SERIAL' else _d[tableName][0]['type']) + ';\n' \
	'BEGIN\n' \
		'\tIF EXISTS (\n' \
				'\t\tSELECT\n' \
					'\t\t\t$1\n' \
				'\t\tFROM\n' \
					'\t\t\t' + tableName + "\n" \
				'\t\tWHERE\n' \
					'\t\t\t' + tableName + '.' + _d[tableName][0]["col"] + ' = $1) THEN\n' \
				"\t\tRETURN -1;\n" \
		"\tELSE\n" \
			"\t\tINSERT INTO " + tableName + " (" + vs2 + ")\n" \
			"\t\tVALUES (" + meh + ")\n" \
		"\tRETURNING " + _d[tableName][0]['col'] + " INTO _" + _d[tableName][0]['col']  +"\n" \
			"\t\tRETURN _" + _d[tableName][0]['col'] + ";\n" \
		"\tEND IF;\n" \
	"END;\n" \
	"$BODY$\n" \
	"LANGUAGE plpgsql VOLATILE NOT LEAKPROOF;\n\n"

	return sql


def generateEditFunctionSQL(tableName, _d):

	vs = ""
	for v in _d[tableName]:
		vs += v['col'] + " " + ('INT' if v['type'] == 'SERIAL' else v['type']) + ", "

	vs = vs[:-2]

	vs2 = ""
	for v2 in _d[tableName]:
		vs2 += v2['col'] +  ", "

	vs2 = vs2[:-2]

	meh = ""

	for m in range(1, len(_d[tableName]) + 1):
		if(_d[tableName][m - 1]['type'] == "SERIAL"):
			continue
		meh += _d[tableName][m - 1]['col'] + "=$" + str(m) + ", "
	meh = meh[:-2]

	sql = 'DROP FUNCTION IF EXISTS "edit' + tableName + '" (' + vs +');\n' \
	'CREATE OR REPLACE FUNCTION "edit' + tableName + '" (' + vs +')\n' \
	    '\tRETURNS VOID\n' \
	'AS $$\n' \
	'UPDATE\n' \
	    '\t' + tableName + '\n' \
	'SET ' \
	    '\t' + meh + '\n' \
	    '\tWHERE id=' + tableName + '.' + _d[tableName][0]['col'] + ';\n' \
	'$$\n' \
	'LANGUAGE sql VOLATILE NOT LEAKPROOF;\n\n'

	return sql

def generateDeleteFunctionSQL(tableName, _d):
	sql = 'DROP FUNCTION IF EXISTS "delete' + tableName + '" (' + _d[tableName][0]["col"] + ' ' +('INT' if _d[tableName][0]['type'] == 'SERIAL' else _d[tableName][0]['type']) +');\n' \
	'CREATE OR REPLACE FUNCTION "delete' + tableName + '" (' + _d[tableName][0]["col"] + ' ' +('INT' if _d[tableName][0]['type'] == 'SERIAL' else _d[tableName][0]['type']) +')\n' \
    	'\tRETURNS VOID\n' \
	'AS $$ DELETE FROM ' + tableName + ' WHERE ' + _d[tableName][0]["col"] + '=$1;\n' \
	'$$\n' \
	'LANGUAGE sql VOLATILE NOT LEAKPROOF;\n\n'

	return sql


def generateGetFunctionSQL(tableName, _d):
	vs = ""
	for v in _d[tableName]:
		vs += v['col'] + " " + ('INT' if v['type'] == 'SERIAL' else v['type']) + ", "

	vs = vs[:-2]

	vs2 = ""
	for v2 in _d[tableName]:
		vs2 += v2['col'] +  ", "

	vs2 = vs2[:-2]

	meh = ""

	for m in range(1, len(_d[tableName]) + 1):
		if(_d[tableName][m - 1]['type'] == "SERIAL"):
			continue
		meh += _d[tableName][m - 1]['col'] + "=$" + str(m) + ", "
	meh = meh[:-2]

	sql = 'DROP FUNCTION IF EXISTS "get' + tableName + '" (' + _d[tableName][0]["col"] + ' ' + ('INT' if _d[tableName][0]['type'] == 'SERIAL' else _d[tableName][0]['type']) +');\n' \
	'CREATE OR REPLACE FUNCTION "get' + tableName + '" (' + _d[tableName][0]["col"] + ' ' + ('INT' if _d[tableName][0]['type'] == 'SERIAL' else _d[tableName][0]['type']) +')\n' \
	    '\tRETURNS TABLE (' + vs + ')\n' \
	'AS $$\n' \
	'SELECT ' + vs2 + '\n' \
	'FROM\n' \
	    '\t' + tableName + '\n' \
	    '\tWHERE ' + _d[tableName][0]["col"] + '=$1\n' \
	'$$' \
	'LANGUAGE sql VOLATILE NOT LEAKPROOF;\n\n'

	return sql

def generateGetAllFunctionSQL(tableName, _d):

	vs = ""
	for v in _d[tableName]:
		vs += v['col'] + " " + ('INT' if v['type'] == 'SERIAL' else v['type']) + ", "

	vs = vs[:-2]

	vs2 = ""
	for v2 in _d[tableName]:
		vs2 += v2['col'] +  ", "

	vs2 = vs2[:-2]

	sql = 'DROP FUNCTION IF EXISTS "getAll' + tableName + '"();\n' \
		'CREATE OR REPLACE FUNCTION "getAll' + tableName + '"()\n' \
		'RETURNS TABLE(' + vs + ')  AS $$\n' \
			'\tSELECT ' + vs2 + '\n' \
			'\tFROM ' + tableName + '\n' \
		'$$ LANGUAGE sql VOLATILE NOT LEAKPROOF;\n\n'

	return sql


def s():
	rf = open("sql_tables_for_script_pls_ignore_thanks.sql", "r")
	tl = {}
	cur = ""
	for l in rf:
		if(l != "\n"):
			if("CREATE TABLE" in l):
				cur = l.strip().split("(")[0].split("TABLE ")[1]
				tl[cur] = []
			else:
				r = {}
				r["col"] = l.strip().split(" ")[0]
				r["type"] = l.strip().split(" ")[1].split(")")[0].split(",")[0]
				tl[cur].append(r)


	wf = open("sql_funcs.sql", "w")
	for t in tl.keys():
		print "Generating SQL Functions for " + t
		wf.write(generateAddFunctionSQL(t, tl))
		wf.write(generateEditFunctionSQL(t, tl))
		wf.write(generateGetFunctionSQL(t, tl))
		wf.write(generateGetAllFunctionSQL(t, tl))
		wf.write(generateDeleteFunctionSQL(t, tl))
		wf.write("-------------------" + t + "-------------------\n\n")

if __name__ == '__main__':
	s()