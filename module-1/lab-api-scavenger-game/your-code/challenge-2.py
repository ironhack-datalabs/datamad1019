import os
import requests
from dotenv import load_dotenv
load_dotenv()

# https://developer.github.com/v3/
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

data = githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019/commits").json()

print(len(data))

commits2019=list(map(lambda commits: str(commits["commit"]["author"]["date"])[:4],data))

print(commits2019.count("2019"))

## ANswer I get is: all 30 commits are from 2019