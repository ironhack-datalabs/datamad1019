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
# name o path
path_list = list(map(lambda repo: repo["path"], dataScavenger))
path_list = path_list[1:26]

hunt_list1 = [".000{}.scavengerhunt".format(i) for i in range (1, 10)]
hunt_list2 = [".00{}.scavengerhunt".format(i) for i in range (10, 25)]
hunt_list = hunt_list1 + hunt_list2

tup_fold_file = []
for e in path_list:
    dataFolder = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}".format(e)).json()
    if dataFolder[0]["name"] in hunt_list:
        tup_fold_file.append((e, dataFolder[0]["name"]))
    if dataFolder[1]["name"] in hunt_list:
        tup_fold_file.append((e, dataFolder[1]["name"]))

tup_fold_file.sort(key=lambda x: x[1])

code_lst = []
for fo, fi in tup_fold_file:
    dataFile = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}/{}".format(fo, fi)).json()
    code_lst.append(dataFile['content'])

#encode base64
import re

print ("Code List: ", code_lst)
str_code = "".join(code_lst)
encode = re.sub (r"\\n", "", str_code)
print("Code str: ", str_code)

import base64   
final = base64.b64decode(encode)
print("Final: ", final)

# b'In\ndata\n'
# no consigo decodificarlo completamente
'''

print ("Code List: ", code_lst)
encode = [re.sub (r"\\n", "", e) for e in code_lst]
str_code = "".join(encode)
print("Code str: ", str_code)

import base64   
final = base64.b64decode(str_code)
print("Final: ", final)
'''