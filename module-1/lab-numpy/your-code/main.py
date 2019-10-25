#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.
print("Print the NUMPY version and the configuration")

# Versión:
print(np.version.version) # print(np.__version__)

# Configuración:
# print(np.show_config())

#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. 
# How many ways can you find?

a = np.random.random((2,3,5))

'''
Me falta el challenge!
'''

#4. Print a.

print("Print a:")
print(a)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"

b = np.ones((5,2,3))

#6. Print b.

print("Print b:")
print(b)

#7. Do a and b have the same size? How do you prove that in Python code?

print("Do a and b have the same size?")
# print(a.size)
# print(b.size)
print(a.size == b.size) # They have the same number of elements in total.

#8. Are you able to add a and b? Why or why not?

# No. It's not possible to add arrays with different shape.
# print(a + b)
# ValueError: operands could not be broadcast together with shapes (2,3,5) (5,2,3)

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). 
# Assign the transposed array to varialbe "c".

# Opción 1: Con reshape:
c = b.T
# print(b.shape) # (5, 2, 3)
# print(a.shape) # (2, 3, 5)
# print(c.shape) # (3, 2, 5)
# print(a.shape==c.shape) # False
# Hago un reshape sobre c para que tenga = shape que a:
c = np.reshape(c,a.shape)
# print(c.shape) # (2, 3, 5)

# Opción 2: Directamente con transpose:
c = np.transpose(b, axes=[1,2,0]) # Con axes puedo indicar en qué orden quiero las dimensiones de b
# print(c.shape) # (2, 3, 5)

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?

d = a + c
# It works because now a and c have the same shape.

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.

print("Print a and d:")
print("This is a:")
print(a)
print("This is d:")
print(d)
# d = a + c
# c es un array cuyos elementos son todos 1. Al sumar c+a, se ha sumado 1 a todos los elementos de a.

#12. Multiply a and c. Assign the result to e.

e = a * c

#13. Does e equal to a? Why or why not?

print("Does e equal to a?")

# print(a)
# print(e)
print(a==e) # Todos sus elementos son iguales.
# print(np.equal(a,e))

#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"

d_max = np.max(d)
d_min = np.min(d)
d_mean = np.mean(d)

#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.

f = np.empty(np.shape(d))
# print(f) # No está vacía porque con este comando lo que estamos haciendo es reservar un espacio en
#  la memoria RAM

"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, 
assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""

for k in range(f.shape[0]):
        for j in range(f.shape[1]):
                for i in range(f.shape[2]):
                        if d[k,j,i] > d_min and d[k,j,i] < d_mean:
                                f[k,j,i] = 25
                        if d[k,j,i] > d_mean and d[k,j,i] < d_max:
                                f[k,j,i] = 75
                        if d[k,j,i] == d_mean:
                                f[k,j,i] = 50
                        if d[k,j,i] == d_min:
                                f[k,j,i] = 0        
                        if d[k,j,i] == d_max:
                                f[k,j,i] = 100


"""
#17. Print d and f. Do you have your expected f?
For instance, if your d is:
array([[[1.85836099, 1.67064465, 1.62576044, 1.40243961, 1.88454931],
        [1.75354326, 1.69403643, 1.36729252, 1.61415071, 1.12104981],
        [1.72201435, 1.1862918 , 1.87078449, 1.7726778 , 1.88180042]],

       [[1.44747908, 1.31673383, 1.02000951, 1.52218947, 1.97066381],
        [1.79129243, 1.74983003, 1.96028037, 1.85166831, 1.65450881],
        [1.18068344, 1.9587381 , 1.00656599, 1.93402165, 1.73514584]]])

Your f should be:
array([[[ 75.,  75.,  75.,  25.,  75.],
        [ 75.,  75.,  25.,  25.,  25.],
        [ 75.,  25.,  75.,  75.,  75.]],

       [[ 25.,  25.,  25.,  25., 100.],
        [ 75.,  75.,  75.,  75.,  75.],
        [ 25.,  75.,   0.,  75.,  75.]]])
"""

print("Print d and f:")
print("This is d:")
print(d)
print("This is f:")
print(f)


"""
#18. Bonus question: instead of using numbers (i.e. 0, 25, 50, 75, and 100), how to use string values 
("A", "B", "C", "D", and "E") to label the array elements? You are expecting the result to be:
array([[[ 'D',  'D',  'D',  'B',  'D'],
        [ 'D',  'D',  'B',  'B',  'B'],
        [ 'D',  'B',  'D',  'D',  'D']],

       [[ 'B',  'B',  'B',  'B',  'E'],
        [ 'D',  'D',  'D',  'D',  'D'],
        [ 'B',  'D',   'A',  'D', 'D']]])
Again, you don't need Numpy in this question.
"""

f = f.astype(str)

for k in range(f.shape[0]):
        for j in range(f.shape[1]):
                for i in range(f.shape[2]):
                        if d[k,j,i] > d_min and d[k,j,i] < d_mean:
                                f[k,j,i] = "B"
                        if d[k,j,i] > d_mean and d[k,j,i] < d_max:
                                f[k,j,i] = "D"
                        if d[k,j,i] == d_mean:
                                f[k,j,i] = "C"
                        if d[k,j,i] == d_min:
                                f[k,j,i] = "A"       
                        if d[k,j,i] == d_max:
                                f[k,j,i] = "E"

print("This is my new f:")
print(f)
