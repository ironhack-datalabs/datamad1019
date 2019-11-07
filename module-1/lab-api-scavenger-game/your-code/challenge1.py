### Challenge 1: Fork Languages

import os
import requests
from dotenv import load_dotenv
import json

load_dotenv()


# https://developer.github.com/v3/
def githubRequestAuthorized(resource):
    authToken = os.getenv("LAB_API_TOKEN")
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
def cutUrlDomain(url):
    return (url.split('github.com')[1])


data = githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019").json()
#Obtain the full list of forks
forks = githubRequestAuthorized(cutUrlDomain(data['forks_url'])).json()
languages = []

#Loop the JSON response to find out the `language` attribute of each fork
#Use an array to store the `language` attributes
for f in forks:
    language = githubRequestAuthorized(cutUrlDomain(f['languages_url'])).json()
    languages.append(list(language.keys()))

#Print the language array
print(*languages, sep='\n')