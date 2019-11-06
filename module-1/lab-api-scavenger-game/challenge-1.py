import os
import requests as r
from dotenv import load_dotenv
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
    res = r.get(url, headers=headers)
    return res

###########
print('Challenge 1: Fork Languages')
url = '/repos/ironhack-datalabs/datamad1019/languages'
params = ''
data = githubRequestAuthorized("{}{}".format(url, params)).json()
languages = []
for e in data.items():
    languages.append(e[0])

print(languages)

###########
print('Challenge 2: Fork Languages')

url = '/repos/ironhack-datalabs/datamad1019/commits'
params = "?since=2019-01-01T00:00:00Z"
commits = githubRequestAuthorized("{}{}".format(url, params)).json()

print(len(commits))


###########
print('Challenge 3:')

url = '/repos/ironhack-datalabs/scavenger/contents'
paths = githubRequestAuthorized("{}".format(url)).json()

folders = []
for path in paths: 
    for key, value in path.items():
        if key == 'path':
            folders.append(value)
folders.remove('.gitignore')
print(folders)

files =[]
for folder in folders:
    files.append(githubRequestAuthorized("{}/{}".format(url, folder)).json())
print(files)

fin = []
for file in files: 
    for fil in file:
        for key, value in path.items():
            if key == 'path':
                fin.append(value)
print(fin)