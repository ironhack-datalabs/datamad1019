import os
import requests
import json
import re
import itertools
import base64
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

scavenger = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents").json()
# Consigo la lista de carpetas del repositorio
paths = list(map(lambda repo: repo["path"], scavenger))
print(len(set(paths)))

# Borro la carpeta gitignore de la lista de carpetas del repositorio
paths.pop(0)
print (len(paths))


# Consigo la lista de archivos y la filtro a los que me interesan
archivos = []
for i in paths:
    carpetas = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}".format(i)).json()
    archivos.append(list(map(lambda repo: repo["name"], carpetas)))

archivos1 = (list(itertools.chain.from_iterable(archivos)))

archivos2 = []
for e in archivos1:
    archivos2.append(re.findall(r".\w+.scavengerhunt", e))
archivos2.sort()


del archivos2[:59]

archivosfinal = [item for sublist in archivos2 for item in sublist]
print(archivosfinal)

prelista = []
for e in paths:
    carpeton = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}".format(e)).json() 
    for y in carpeton:
        if y['name'] in archivosfinal:
            carpetos = githubRequestAuthorized("/repos/ironhack-datalabs/scavenger/contents/{}/{}".format(e,y['name'])).json()
            prelista.extend([[carpetos['name'],carpetos['content']]])

prelista.sort()

# Limpio la lista con el contenido de los archivos y le cambio la codificación

prelista2=[]
for e in prelista:
    e = re.sub(r"\n","", e[1] )
    prelista2.append(e)

print(prelista2)


prefinal = []
for e in prelista2:
    prefinal.append(base64.b64decode(e))


final = []
for e in prefinal:
    final.append(e.decode('UTF-8'))

solucion=[]
for e in final:
    e = re.sub(r"\n","", e )
    solucion.append(e)
solucion = " ".join(solucion)

print(solucion)