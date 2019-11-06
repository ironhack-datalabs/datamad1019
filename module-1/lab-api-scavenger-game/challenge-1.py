# IMPORTS:
import os
from dotenv import load_dotenv
import json
import requests
import base64
import re

load_dotenv()
def githubRequestAuthorized(resource):
    authToken = os.getenv("GITHUB_API_TOKEN")
    if not authToken:
        raise ValueError("NECESITAS UN TOKEN")
    else:
        print("We have a github token: ", authToken[0:4])
    headers = {
        "Authorization": "token {}".format(authToken)
    }
    url = "https://api.github.com{}".format(resource)
    print("Requesting authorized {}".format(url))
    res = requests.get(url, headers=headers)
    return res# enter your code below

data = githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019").json()
data_forks =  githubRequestAuthorized("/repos/ironhack-datalabs/madrid-oct-2018/forks").json()

#Challenge 1: Fork Languages:
print('Challenge 1: Fork Languages')
languages = list(map(lambda data_forks: data_forks['language'],data_forks))
print('Used languages:',set(languages))

#Challenge 2: Count Commits:
print('Challenge 2: Count Commits')
data_comit =  githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019/commits?since=2019-01-01").json()
print('\nNumber of commits sice 2019-01-01, {}'.format(len(data_comit)))    

#Challenge 3: Hidden Cold Joke:
print('Challenge 3: Hidden Cold Joke')
sca_cont = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents").json()

# Filtro para obtener solo nombre de las carpetas
keyValList = ['dir']
directorios = list(filter(lambda sca_cont: sca_cont['type'] in keyValList, sca_cont))
folder_path = list(map(lambda directorios: directorios['path'],directorios))

keyNameList = []
ficheroDic = {}
for i in range(1,25):
    if i < 10:
        keyNameList.append('.000{}.scavengerhunt'.format(i))
    else:
        keyNameList.append('.00{}.scavengerhunt'.format(i))

for e in folder_path:
    folder = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}".format(e)).json()
    for fichero in folder:
        if fichero['name'] in keyNameList:
            contenido = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}/{}".format(e,fichero['name'])).json()
            ficheroDic[fichero['name']]=contenido['content']   

listafichero =[]
final =''
for e in keyNameList:
    decodify = (base64.b64decode(ficheroDic[e])).decode('UTF-8')
    listafichero.append(decodify)

for e in listafichero:
    final+=e

final = re.sub('\\n', ' ',final)
print(final)