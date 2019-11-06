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

datacommit = githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019/commits?since=2018-10-30").json()
print (len(datacommit),"commits desde 2018-10-30")