def color_probability(color, texture):

    sr = 1
    br = 4
    by = 2
    sy = 1
    bg = 1
    sg = 1
    
    bumpy = by + br + bg
    smooth = sg + sr + sy
    
    r = 0
    h = 0
    
    if texture == "bumpy":
        if color == "red":
            r = br / bumpy
            h = str(int(r * 100) / 100)

        elif color == "green":
            r = bg / bumpy
            h = str(int(r * 100) / 100)

        elif color == "yellow":
            r = by / bumpy
            h = str(int(r * 100) / 100)
    elif texture == "smooth":
        if color == "red":
            r = sr / smooth
            h = str(int(r * 100) / 100)

        elif color == "green":
            r = sg / smooth
            h = str(int(r * 100) / 100)

        elif color == "yellow":
            r = sy / smooth
            h = str(int(r * 100) / 100)

    return h
