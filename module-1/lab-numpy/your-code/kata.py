b = 4547935
bs = str(b)
lista = []
s = ""
for e in bs:
    lista.append(e)
for e in bs:
    if int(e) % 2 == 0:
        s += e
    elif int(e) % 2 != 0:
        s += "-" + e

print(s)

