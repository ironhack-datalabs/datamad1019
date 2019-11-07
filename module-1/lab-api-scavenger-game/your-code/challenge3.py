### Challenge 3: Hidden Cold Joke
import base64
import re
from challenge1 import githubRequestAuthorized, cutUrlDomain

repo = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents").json()
folders = [githubRequestAuthorized(cutUrlDomain(f['url'])).json() for f in repo]
folders_without_gitignore = [f for f in folders[1:]]

#Check if files name contains the words: scavengers hunt

files = [e for f in folders_without_gitignore for e in f if re.search('scavengerhunt',e['name'])]
#Sort by name 
files = sorted(files,key=lambda f: f["name"])
text = ''
for f in files:
    word = githubRequestAuthorized(cutUrlDomain(f['url'])).json()
    text += (base64.b64decode(word['content'])).decode('utf8')

print(text)