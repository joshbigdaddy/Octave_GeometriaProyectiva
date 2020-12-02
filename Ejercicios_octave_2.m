##Ejercicios hoja 2


##EJ 1
##Tenemos este sistema de ecuaciones 2x ? y = 1, ?x + 3y = 5 y x + y = ?8 

matriz = [ 2 -1 -1
          ;-1 3 -5
          ;1  1  8];
det (matriz) ## TIENE SOLUCION -- SISTEMA DETERMINADO

##EJ 2

2. Calcular la intersecci´on de las rectas 3x ? 2y = 5 y 3x ? 2y = ?2 en P

matriz = [ 3 -2 -5
          ;4 -2  2 ];
          
#Si intentamos resolverlo por  sustitución llegamos a 

### x = 5 + 2y /3 --> 5+2y -2y = -2 -> 0y = -7 INCOMPATIBLE 
          
## Tenemos un caso de sistema incompatible, porque son dos rectas paralelas, en x e y como 0

##EJ3
##La interseccion entre dos rectas paralelas abc - abc' sería el vector resultado 
##del prod vectorial entre ellas 2 
a = 5
b = 7
c = 3
c_1 = 0
vect1 = [a b c]
vect2 = [a b c_1]
res = cross(vect1,vect2)

##Ambas rectas se cortan en el infinito
##obtenemos un punto que es el corte en el infinito de ambas rectas
#EJ4
###3x + 2y ? 1 = 0  PUNTO EN EL INFINITO
###TENEMOS QUE SACAR EL resultado del prod vectorial entre esta recta y otra paralelas

vect1=[3 2 -1]
vect2=[3 2  0]

resultado=cross(vect1,vect2)

##EJ5
##Calcularemos la recta con plucker por determinantes

matriz = [1 1 3 1;
         1 1 2 0]
matriz = matriz'
l_12 = det([matriz(1,1) matriz(2,1);
            matriz(1,2) matriz(2,2)])
l_14 = det([matriz(1,1) matriz(4,1);
            matriz(1,2) matriz(4,2)])
l_13 = det([matriz(1,1) matriz(3,1);
            matriz(1,2) matriz(3,2)])
l_23 = det([matriz(2,1) matriz(3,1);
            matriz(2,2) matriz(3,2)])
l_42 = det([matriz(4,1) matriz(2,1);
            matriz(4,2) matriz(2,2)])
l_34 = det([matriz(3,1) matriz(4,1);
            matriz(3,2) matriz(4,2)])
            
l =  [l_12 l_13 l_14 l_23 l_42 l_34]
l_1= [l_34 l_42 l_23 l_14 l_13 l_12]

##Ahora l_1 * P
P=[1 0 0 1]
plano= [0 l_12 l_13 l_14;
        -l_12 0 l_23 -l_42;
        -l_13 -l_23 0 l_34;
        -l_14  l_42 -l_34 0] * P'
        
#EJ6
P1 = [-1 0 -1 1]
P2 = [1 0 -1 1]

L_1 = P1'*P2 - P2'*P1

##EJ7 -- MAS ADELANTE 

##EJ8 
mat = [1 1 -1 1; -9 7 3 1; 2 0 5 1];
[U,D,V] = svd(mat);
x = V(:,end) # solucion en la ultima columna de V
plano = x/x(end) # divide por la ultima entrada y obtiene el resultado

##EJ9
p1 = [1 1 1 0]
p2 = [1 -1 0 1]
#Plucker
l = p1'*p2 - p2'*p1 
L = [l(1,2) l(1,3) l(1,4) l(2,3) l(4,2) l(2,4)]
##ESTA SEGUNDA PARTE NO ESTOY SEGURO DE HACERLA BIEN
puntos=[1 1 0;
-1 0 1;2 2 0];
b=[0 0 0];
puntos/b

##EJ10
L = [1 -1 1 0 2 2]
#puntos = [1 x y z] [1 x2 y2 z2]
##calculamos el sistema de ecuaciones
#|1 x  y  z |
#|1 x2 y2 z2| 

# |1 x | = 1
# |1 x2|
# |1 y | = -1
# |1 y2|
##? = ?12: ?13: ?14: ?23: ?42: ?34
# |1 z | = 1
# |1 z2|
# |x  y | =0
# |x2 y2|
# |z  x | = 2
# |z2 x2|
# |y  z | = 2
# |y2 z2|

# x - x2=1
# y - y2=1
# z - z2=1
# xy2 - x2y = 0
# x2x - xz2 = 2
# yz2 - zy2 = 2

# x = 1+x2
# y = 1+y2
# z = 1+z2
#  
#
#

##EJ11
##EJ12
##Vamos a preparar la proyeccion de cámara, para ello tenemos que montat la matriz
## de camara
## matriz_camara = KR[I3 | -C] donde -C es el vector origen cambiado de signo
## R es la rotacion y K es la matriz de calibracion, que vamos a suponer que es ideal

matriz_i3 = [1 0 0 -3;
             0 1 0  0;
             0 0 1  4];

## Como está en x=1, tenemos que rotar -90 grados

rotacion = [0 1 0 ;
            -1 0 0 ;
            0 0 1 ];
         

            
##Matriz K ideal -- distacia al origen = 1
K=[1 0 0;
   0 1 0;
   0 0 1];
   
##calculamos la matriz de camara
matriz_camara = K*rotacion* matriz_i3;

p1 = [1 0 0]
p2 = [0 1 0]
p3 = [-1 0 0]
p4 = [0 -1 0]
p5 = [0 -1 1]
p6 = [0 0 -1]
F =  [1,2,6;
      1,5,2;
      1,4,6;
      3,2,6;
      3,4,6;
      3,5,2;
      1,4,5;
      3,5,4]

vertices = [p1; p2; p3; p4; p5; p6]

p1_trans_2 = (matriz_camara * [p1';1])';
p2_trans_2 = (matriz_camara * [p2';1])';
p3_trans_2 = (matriz_camara * [p3';1])'; 
p4_trans_2 = (matriz_camara * [p4';1])'; 
p5_trans_2 = (matriz_camara * [p5';1])'; 
p6_trans_2 = (matriz_camara * [p6';1])'; 

vertices2 = [p1_trans_2; p2_trans_2; p3_trans_2; p4_trans_2; p5_trans_2; p6_trans_2]
patch('Vertices',vertices2,'Faces',F,...
      'FaceVertexCData',jet(4),'FaceColor','flat')
view(10,2);
##EJ13
##EJ14