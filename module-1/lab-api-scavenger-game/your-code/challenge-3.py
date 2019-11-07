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

def getnames(a):
    b=githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}".format(a)).json()
    return list(map(lambda contents: contents["name"],b))


def getcontents(c,d):
    e=githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}/{}".format(c,d)).json()
    return list(map(lambda contents: contents["content"],e))

##print(getcontents(15534))

secret_files=[g for f in folders for g in getnames(f) if g.endswith(".scavengerhunt")]
secret_files.sort(reverse=False)
##secret_content=[getcontents(f,getnames(f)) for f in folders for h in secret_files]

## Filtered List of files
## Answer is: ['.0001.scavengerhunt', '.0002.scavengerhunt', '.0003.scavengerhunt', '.0004.scavengerhunt', '.0005.scavengerhunt', '.0006.scavengerhunt', '.0007.scavengerhunt', '.0008.scavengerhunt', '.0009.scavengerhunt', '.0010.scavengerhunt', '.0011.scavengerhunt', '.0012.scavengerhunt', '.0013.scavengerhunt', '.0014.scavengerhunt', '.0015.scavengerhunt', '.0016.scavengerhunt', '.0017.scavengerhunt', '.0018.scavengerhunt', '.0019.scavengerhunt', '.0020.scavengerhunt', '.0021.scavengerhunt', '.0022.scavengerhunt', '.0023.scavengerhunt', '.0024.scavengerhunt']
print(secret_files)

##print(getcontents(15024,.0006.scavengerhunt))

words=[]

for file in secret_files:
    d=githubRequestAuthorized("repos/ironhack-datalabs/scavenger/contents/"+file).json()
    word.append(d['content'])
    
##sf=githubRequestAuthorized('/repos/ironhack-datalabs/scavenger/contents/'+secret_fil[0]).json()

print(words)

'''
print(list(l1_c))           
            
ficheroDic[fichero['name']]=contenido['content']]

secret_files2=[g for f in folders for g in getcontents(f) if g.endswith(".scavengerhunt")]
secret_files2.sort(reverse=False)
'''