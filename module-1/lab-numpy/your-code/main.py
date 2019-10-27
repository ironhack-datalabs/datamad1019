#1. Import the NUMPY package under the name np.

print("Ejercicio 1\n")
import numpy as np

#2. Print the NUMPY version and the configuration.
print("Ejercicio 2\n")
print(np.version.version)


#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
print("Ejercicio 3\n")
a = np.random.random(30).reshape(2,3,5)

#4. Print a.
print("Ejercicio 4\n")
print(a)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
print("Ejercicio 5\n")
b = np.ones((5,2,3))

#6. Print b.
print("Ejercicio 6\n")
print(b)

#7. Do a and b have the same size? How do you prove that in Python code?
print("Ejercicio 7\n")
print(a.size == b.size)

#8. Are you able to add a and b? Why or why not?
print("Ejercicio 8\n")
#np.add(a,b) 
print("No se pueden sumar, ya que tienen distintos tamaños")

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
print("Ejercicio 9\n")
c = b.T

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
print("Ejercicio 10\n")
c = c.reshape(2,3,5)
d = np.add(a,c)

#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print("Ejercicio 11\n")
print(a)

print(d)


#12. Multiply a and c. Assign the result to e.
print("Ejercicio 12\n")
e = np.multiply(a,c)

#13. Does e equal to a? Why or why not?
print("Ejercicio 13\n")
print(e)
print(a)
print(np.array_equal(a,e))
print ("Sí, ya que el el array C son todo unos, luego al hacer a*c el array no varía")


#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
print("Ejercicio 14\n")
d_max = d.max()
print(d_max)
d_min = d.min()
print(d_min)
d_mean = d.mean()
print(d_mean)

#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
print("Ejercicio 15\n")
f = np.empty((2,3,5))
print(f)


"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""
print("Ejercicio 16\n")

valores = []
for uno in d:
        for dos in uno:
                for tres in dos:
                        valores.append(tres)

print(valores)

value_list = []
for values in valores:
        if (d_min > values) and (values < d_mean):
                values = 25
                value_list.append(values)
        elif (d_mean > values) and (values < d_max):
                values = 75
                value_list.append(values)
        elif  values == d_mean:
                values = 50
                value_list.append(values)
        elif values == d_min:
                values = 0
                value_list.append(values)
        elif values > d_max:
                values = 100
                value_list.append(values)


print(value_list)       



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