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

#Challenge 3

dataScavenger = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents").json()

path_list = list(map(lambda repo: repo["path"], dataScavenger))

hunt_list1 = [".000{}.scavengerhunt".format(i) for i in range (1, 10)]
hunt_list2 = [".00{}.scavengerhunt".format(i) for i in range (10, 25)]
hunt_list = hunt_list1 + hunt_list2

# .0001.scavengerhunt




'''
aux = []
for e in path_list:
    for h in hunt_list:
        hunt = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}/{}".format(e, h)).json()
        aux.append (hunt)

scavenger = list(map(lambda repo: repo["content"], aux))

print (scavenger)
'''