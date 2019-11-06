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

data = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents").json()

folders = list(map(lambda contents: contents["path"], data))
folders.remove(".gitignore")
print("folders are:{}".format(folders))

##data2 = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/30351").json()
##files = list(map(lambda contents: contents["name"], data2))
##print(files)

def getcontents(a):
    b=githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}".format(a)).json()
    return list(map(lambda contents: contents["name"],b))

print(getcontents(15534))

secret_files=[g for f in folders for g in getcontents(f) if g.endswith(".scavengerhunt")]
print(secret_files)