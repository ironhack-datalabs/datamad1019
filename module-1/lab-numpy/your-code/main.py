#1. Import the NUMPY package under the name np.
print("\n")
print("Exercise #1")
import numpy as np
print("\n")
#2. Print the NUMPY version and the configuration.
print("\n")
print("Exercise #2")

print(np.version.version)
print("\n")
#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
print("\n")
print("Exercise #3")
a = np.random.random((2,3,5))
print("\n")
#4. Print a.
print("\n")
print("Exercise #4")
print(a)
print("\n")
#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
print("\n")
print("Exercise #5")
b = np.ones((5,2,3))
print("\n")
#6. Print b.
print("\n")
print("Exercise #6")
print(b)
print("\n")
#7. Do a and b have the same size? How do you prove that in Python code?
print("\n")
print("Exercise #7")

print("Yes, they have (size = 30)")

np.size(a) == np.size(b)
print("\n")

#8. Are you able to add a and b? Why or why not?
print("\n")
print("Exercise #8")

print("They cannot be added as the three dimensions are the same but are not in the same order. I both were 2x3x5 they could be added.")
print("\n")
#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
print("\n")
c = b.T
print("\n")
#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
print("\n")
print("Exercise #10")

c = np.reshape(c,(2,3,5))
d = c+a
print(d)
print("It works because it has the same size / order")
print("\n")
#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print("\n")
print("Exercise #11")

print(a)
print(d)

a+1 == d

print("It seems each element is compared with the same of the equivalent position of the other array, returning a boolean array of the same size and order.")
print("\n")
#12. Multiply a and c. Assign the result to e.
print("\n")
print("Exercise #12")
e = a*c
print(e)
#13. Does e equal to a? Why or why not?
print("\n")
print("Exercise #13")

print(a == e)
print("It is the same because the matrix e is a multiplied by 1.")
print("\n")
#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
print("\n")
print("Exercise #14")

d_max = d.max()
d_min = d.min()
d_mean = d.mean()

print(d_max, d_min, d_mean)
print("\n")
#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
print("\n")
print("Exercise #15")

f = np.empty([2,3,5])
print("\n")


"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""
print("\n")
print("Exercise #16")
for i, x in enumerate(d):
        for j, y in enumerate(x):
                for k, z in enumerate(y):
                        if z > d_min and z < d_mean:
                                f[i, j, k] = 25
                        elif z > d_mean and z < d_max:
                                f[i, j, k] = 75
                        elif z == d_mean:
                                f[i, j, k] = 50
                        elif z == d_min:
                                f[i, j, k] = 0
                        elif z == d_max:
                                f[i, j, k] = 100
print(f)
print("\n")

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
print("Exercise #17\n")
print(d_max, d_min, d_mean)
print(d)
print(f)
print("\n")
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
print("Exercise #18\n")
f = f.astype(np.str) 


for i, x in enumerate(d):
        for j, y in enumerate(x):
                for k, z in enumerate(y):
                        if z > d_min and z < d_mean:
                                f[i, j, k] = "D"
                        elif z > d_mean and z < d_max:
                                f[i, j, k] = "B"
                        elif z == d_mean:
                                f[i, j, k] = "C"
                        elif z == d_min:
                                f[i, j, k] = "E"
                        elif z == d_max:
                                f[i, j, k] = "A"
print(f)