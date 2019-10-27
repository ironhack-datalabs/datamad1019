def insert_dash(num):
    b = list(str(num))
    s = ""
    v = ""

    for e in b:
        e = int(e)
        if e % 2 == 0:
            s += str(e)
        elif e % 2 != 0:
            s += str(e) + "-"

    s = s.strip("-")
    # s[e]=="-" and
    s = list(s)
    for e in range(len(s) - 1):
        try:
            if (s[e] == "-") and (int(s[e + 1]) % 2 == 0):
                s.pop(e)
        except:
            pass
    for e in s:
        v += e
    return v
