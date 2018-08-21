import re

file = open("students.sql", "r")
outfile = open("studentid_list.txt", "w")
statementList = file.readlines()

def findStudentIDs(statement):
    IDsInStatement = re.findall("\([0-9]+", statement)
    IDs = []
    for ID in IDsInStatement:
        IDs.append(ID[1:])
    print(IDs)
    return IDs

def getIDList(statementList):
    IDList = []
    for statement in statementList:
        IDs = findStudentIDs(statement)
        for ID in IDs:
            IDList.append(ID)
    print(IDList)
    return IDList

IDList = getIDList(statementList[2:])
print(IDList)
output = ""
for ID in IDList:
    output += "{0}|".format(ID)
output = output[:-1]
outfile.write(output)
outfile.close()
