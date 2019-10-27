
# Thinkful - Logic Drills: Red and bumpy

def color_probability(color, texture):
    balls = {
        'smooth': ['red', 'yellow', 'green'],
        'bumpy' : ['red', 'red', 'red', 'red', 'green', 'yellow', 'yellow']
    }
    return str(balls[texture].count(color)/len(balls[texture]))[:4]

print(color_probability('red', 'smooth'))


# Weird matrix multiplication

# La función que he planteado pasa todos los tests (example cases y edge cases)
# excepto el stress test :( 
# lo he intentado 150 millones de veces y ya no sé cómo corregir
# el código

import numpy as np

def weird_mul(A, B):
    c = []
    if (B.shape > (1, 0)) and (A.shape > (1, 0)) and (len(B.shape) ==2) and (len(A.shape)==2):
        for i in range(A.shape[0]):
            for k in range(B.shape[0]):
                for j in range(A.shape[1]):
                    c += [A[i][j]*x for x in B[k]]
        return np.array(c).reshape(A.shape[0]*B.shape[0], A.shape[1]*B.shape[1])
    return None