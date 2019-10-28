#1. Import the NUMPY package under the name np.
import numpy as np


#2. Print the NUMPY version and the configuration.
print(np.__version__)


#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
a = np.random.randint(0,100, size =(2,3,5))
# BUscar otras maneras de hacerlo
#np.random.random
#4. Print a.
print(a)


#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
#b = np.ones()
b = np.full((5,2,3),1)


#6. Print b.
print(b)


#7. Do a and b have the same size? How do you prove that in Python code?
#indices = [np.where(a<=x)[0][0] for x in c]
#print(indices)
if a.size == b.size:
        print(True)
if a.size != b.size:
        print(False)       


#8. Are you able to add a and b? Why or why not?
#suma = a + b
#print(suma)
'''No es posible'''
#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
c =np.transpose(b,(1,2,0))
print(c)



#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
d =np.concatenate((a,c),axis =1)
print(d)


#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print(a)

print(d)



#12. Multiply a and c. Assign the result to e.
e = a * c
print(e)

#13. Does e equal to a? Why or why not?
for x in a:
        for y in e:
                if y == x:
                        print(True) 
                if y != x:
                        print(False)     
print ((e == a))


#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
d_max = np.max(d)
d_min = np.min(d)
d_mean = np.mean(d)



#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
f = np.empty((2,3,5))
print(f)
print(d)


"""
#16. Populate the values in f. For each value in d, if it's larger than d_min but smaller than d_mean, assign 25 to the corresponding value in f.
If a value in d is larger than d_mean but smaller than d_max, assign 75 to the corresponding value in f.
If a value equals to d_mean, assign 50 to the corresponding value in f.
Assign 0 to the corresponding value(s) in f for d_min in d.
Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.
"""
'''for i in f:
        for x in d:
                if np.logical_and(x > d_min , x < d_mean):
                        print(25)
                if np.logical_and(x > d_mean , x < d_max):
                        print(75) 
                if x == d_mean:
                        print(50)
                if x == d_min:
                        print(0)
                if x == d_max:
                        print(100)
print(x) AQUI NO ENTIENDO PORQUE ESTE CODIGO NO ME VA PUEDE SER PORQUE NO RECORRA POR TODAS LAS MATRICES '''


for x in range(2):
        for y in range(3):
                for z in range(5):
                        if d =[x,y,z] > d_min and  d =[x,y,z] < d_mean:
                                print(25)
                        if d =[x,y,z]  > d_mean and d =[x,y,z] < d_max:
                                print(75) 
                        if d =[x,y,z] == d_mean:
                                print(50)
                        if d =[x,y,z] == d_min:
                                print(0)
                        if d =[x,y,z] == d_max:
                                print(100)

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