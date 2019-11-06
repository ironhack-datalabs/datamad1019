import os
import requests as r
from dotenv import load_dotenv
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


