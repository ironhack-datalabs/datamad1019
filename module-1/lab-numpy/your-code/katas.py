
# Thinkful - Logic Drills: Red and bumpy

def color_probability(color, texture):
    balls = {
        'smooth': ['red', 'yellow', 'green'],
        'bumpy' : ['red', 'red', 'red', 'red', 'green', 'yellow', 'yellow']
    }
    return str(balls[texture].count(color)/len(balls[texture]))[:4]

print(color_probability('red', 'smooth'))