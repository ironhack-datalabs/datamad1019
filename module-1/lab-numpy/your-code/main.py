#1. Import the NUMPY package under the name np.

import numpy as np

#2. Print the NUMPY version and the configuration.
print("=>ej 2:")
print(np.__version__)
print(np.show_config())

#3. Generate a 2x3x5 3-dimensional array with random values. Assign the array to variable "a"
# Challenge: there are at least three easy ways that use numpy to generate random arrays. How many ways can you find?
print("=> ej 3:")
a = np.random.random((2,3,5))

#4. Print a.
print("=> ej 4:")
print(a)

#5. Create a 5x2x3 3-dimensional array with all values equaling 1.
#Assign the array to variable "b"
print("=> ej 5:")
b=np.ones((5,2,3))

# TA: tengo dudas, creo que por pensar demasiado.
# el 3 dimensional son 3 corchetes y  punto.
# el 5x2x3 no sé si se refiere a 5 columnas... o 5 filas... 
# cual es el orden lógico en programación?? primero columnas... luego... filas? luego espacio? 

#6. Print b.
print("=> ej 6: ")
print(b)

#7. Do a and b have the same size? How do you prove that in Python code?
print("=> ej 7: ")
if a.size == b.size:
        print(True)
else:
        print(False)

#8. Are you able to add a and b? Why or why not?
print("8. Are you able to add a and b? Why or why not?")
print("si tienen la misma estructura de matriz sí se pueden sumar.")
print("c=np.add(a,b) # esto va a dar error.")

#9. Transpose b so that it has the same structure of a (i.e. become a 2x3x5 array). Assign the transposed array to varialbe "c".
print("=> ej 9")
c=np.transpose(b)
print(c)

#10. Try to add a and c. Now it should work. Assign the sum to varialbe "d". But why does it work now?
print("=> ej 10")
cbuena=np.reshape(c,(2,3,5))
print(cbuena)

d=np.add(a,cbuena)
# También podría haber hecho, como si fueran variables de python 
# d=a+cbuena
print(d)


#11. Print a and d. Notice the difference and relation of the two array in terms of the values? Explain.
print("")
print(a)
print(d)

# con esto puedo comparar arrays

print("\n"+"==============="+"\n"+"ej11: comparar")
np.array_equal(a,d)
print(np.array_equal(a,d))     



#12. Multiply a and c. Assign the result to e.
print("\n"+"==============="+"\n"+"ej12: multiplicar")

e=np.multiply(a,cbuena)
print(e)        

#13. Does e equal to a? Why or why not?
print("\n"+"==============="+"\n"+"ej13: comparar")
print("ej 13:")
print("-- e es:  ")
print(e)
print("-- a es:   ")
print(a)

print(np.array_equal(e,a))



#14. Identify the max, min, and mean values in d. Assign those values to variables "d_max", "d_min", and "d_mean"
print("\n"+"==============="+"\n"+"ej14: max,min,mean")
d_max=np.max(d)
d_min=np.min(d)
d_mean=np.mean(d)
print("max",d_max)
print("min",d_min)
print("mean",d_mean)



#15. Now we want to label the values in d. First create an empty array "f" with the same shape (i.e. 2x3x5) as d using `np.empty`.
print("\n"+"==============="+"\n"+"ej15: numpy vacío")
print("si uso f=np.empty((2,3,5)) lo que obtengo es un numpy NO vacío. No sé por qué, mira:")
f=np.empty((2,3,5))
print(f)
print(np.shape(f))
print("Peeeero si uso g=numpy.array([])) sí que consigo un numpy vacío")
g=np.array([])
print("mi numpy vacío es ", g)
print(np.shape(g))

"""
#16. Populate the values in f. For each value in d, if it's larger than
#  d_min but smaller than d_mean, assign 25 to the corresponding value in f.

If a value in d is larger than d_mean but smaller than d_max, assign 75 to 
the corresponding value in f.

If a value equals to d_mean, assign 50 to the corresponding value in f.

Assign 0 to the corresponding value(s) in f for d_min in d. 

Assign 100 to the corresponding value(s) in f for d_max in d.
In the end, f should have only the following values: 0, 25, 50, 75, and 100.
Note: you don't have to use Numpy in this question.

"""
print("\n"+"==============="+"\n"+"ej16: llenar lista vacía con parámetros")
print("")

for i in range(len(d)):
        for j in range(len(d[i])):
                for k in range(len(d[i][j])):
                        if d[i][j][k]>d_min and d[i][j][k]<d_mean:
                                f[i,j,k]=25
                        elif d[i][j][k]>d_mean and d[i][j][k]<d_max:
                                f[i,j,k]=75
                        elif d[i][j][k]==d_mean:
                                f[i,j,k]=50
                        elif d[i][j][k]==d_min:
                                f[i][j][k]=0
                        elif d[i][j][k]==d_max:
                                f[i][j][k]==100
                        
                        

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
print("\n"+"==============="+"\n"+"ej17: mi función f")
print(d,"\n",f)

print("tengo un error que intentaré mirar si tengo tiempo")


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
print("\n"+"==============="+"\n"+"ej18: ")
print("")



nueva=np.empty((2,3,5),dtype = str)
print(nueva)

# f=f.astype(str)
for i in range(len(f)):
        for j in range(len(f[i])):
                for k in range(len(f[i][j])):
                        if f[i,j,k]==25:
                                nueva[i,j,k]="A"
                                
                        elif f[i,j,k]==75:
                                nueva[i,j,k]="B"
                        elif f[i,j,k]==50:
                                nueva[i,j,k]="C"
                        elif f[i][j][k]==0:
                                nueva[i,j,k]="D"
                        elif f[i][j][k]==100:
                                nueva[i,j,k]="E"
                        

print(nueva)

print(" ````````````````````````````````````````````````````` ")
print(" ````````````````````````````````````````````````````` ")
print(" ``````````````````````↓7↕↓↕↓↓↓11↓```````````````````` ")
print(" `````````````````↕11§1↕↕7↓11↓↓↓↓1171§7``````````````` ")
print(" ```````````````↓1§↕↓7↓``````````````↓1§7↓```````````` ")
print(" ````````````7§§§↓```````````````````````↓1↕`````````` ")
print(" ```````````1§↓↓↓↓`````````````````````````11````````` ")
print(" ``````````1↕`↓``````````````````````````↓↓``↕7``````` ")
print(" ````````11↕7↓```````````````````````↓7111↓```1¶`````` ")
print(" ```````§1`↓↓```↕↕↕7↕`````````````````1↕↓↓7↕7``17````` ")
print(" ``````↓1`↓↓↓````↓↕111↓``````````````1↕```↓↓§§``17```` ")
print(" `````↓§7↓↓↓````1↓```↓11````````````↓§`↓↓````↕↕``1↕↓`` ")
print(" ````↓¶`↓↓↓↓```¶↓↓↓↓↓↓`11``````↓7```1````1````1````§`` ")
print(" ````↕↕`↓↓↓```1↓```↓````1↓``````11``↕7```````↓1``1§↓`` ")
print(" ````§`↓↓↓↓```1````1````↓↕```````11``§1↓↓↓↓↓↕¶``↓1```` ")
print(" ``↕↕↓↓↓↓↓↓```↕7````````§```````↓1````117↓↓↕1```1````` ")
print(" ``1`↓↓↓↓↓↓↓```§1↓↓↓```§↕```````````````↓↓↓↓```1↓````` ")
print(" ``↕↕↕7`↓↓↓↓````↕↕↓↓↓71↓````````↓↓¶↓``````````1↕`````` ")
print(" ````↓1↓`↓↓↓↓`````↓↓↓↓````````↕1↓§§↓`````````1↕``````` ")
print(" ``````↕↕`↓↓↓↓``````````````````````````````1↓```````` ")
print(" ```````↓1↓↓↓↓↓```````````````````````````↕1`````````` ")
print(" `````````↕↕7↓↓↓↓``````````````````````↓↕1↓``````````` ")
print(" ```````````↓↕↕↕↓↓↓``````````````````7↕↕↓````````````` ")
print(" ``````````````↓↕↕1↕7↓↓````````↓↓7↓1§↓```````````````` ")
print(" ```````````````````1111¶¶¶↕↓7↓7¶¶7``7```````````````` ")
print(" ``````````````````↓↕↓↓↓1¶¶§`↓↓`§¶¶```1``````````````` ")
print(" ``````````````````↕77```§¶1`↓↕↕§¶¶↓``↓↕`````````````` ")
print(" ``````````````````↕7↕`````````↕↕↓↓````↕`````````````` ")
print(" ``````````````````↕↓↓7````````§↓`````↓↕`````````````` ")
print(" ``````````````````↓`↓↓↓↓````↓↕↓↓````↓1``````````````` ")
print(" ``````````````````¶↓↓↕§1↓↓§¶¶¶§77↓7§1```````````````` ")
print(" `````````````````↓¶¶¶¶¶¶§§¶¶§¶¶¶¶¶¶¶§```````````````` ")
print(" `````````````````7¶¶¶¶¶§¶§§§¶§§§¶¶¶¶¶```````````````` ")
print(" `````````````````7¶¶¶¶§§§§§§§§§§§§§¶¶```````````````` ")
print(" ``````````````````¶¶¶¶§§§§§§§§§§§§§¶1```````````````` ")
print(" ``````````````````¶¶¶¶§§§§§§§§§§§§§¶````````````````` ")
print(" ``````````````````7¶¶¶§§§§§§¶¶§§¶§¶1````````````````` ")
print(" ```````````````````¶¶¶§§§§§§¶¶§§§§¶↕````````````````` ")
print(" ```````````````````¶¶¶¶§§§§§¶¶§§¶§¶1````````````````` ")
print(" ``````````````````↓¶¶¶¶§§¶§¶¶¶§¶¶¶¶§````````````````` ")
print(" ``````````````````↕¶¶¶¶¶¶¶¶¶¶¶¶¶¶§§1````````````````` ")
print(" ``````````````````7¶¶¶§1↓```↓¶1↕````↓1``````````````` ")
print(" ``````````````````1↓↓↓````````1↓`````7↕`````````````` ")
print(" ``````````````````↕11↕`````↓``11↓7↓77↕``````````````` ")
print(" ``````````````````````↓↓↓↓↓↓↓```````````````````````` ") 
print(" Stewee dice que es una vergüenza hacer tantos prints, debería")
print(" haber hecho un str de todo el texto e ir dividiéndolo en una función.")
print(" Problema del Vargas del futuro")

            