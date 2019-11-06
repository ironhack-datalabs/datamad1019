import os
import requests
import json
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
    res = requests.get(url, headers=headers)
    return res

githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019")

datafork = githubRequestAuthorized("/repos/ironhack-datalabs/madrid-oct-2018/forks").json()

languages = list(map(lambda repo: repo["language"], datafork))
languages = set(languages)
Languagesfiltered = [e for e in languages if e !=None]

print ("Los lenguajes del repositorio son {},{} y {}".format(Languagesfiltered[0],Languagesfiltered[1],Languagesfiltered[2]))