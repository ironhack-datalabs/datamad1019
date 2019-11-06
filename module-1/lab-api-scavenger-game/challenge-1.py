import os
import requests
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

#Challenge 1

dataFork = githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019/forks").json()
lang_list = list(map(lambda repo: repo["language"], dataFork))
lang_list = set (lang_list)
print (lang_list)






