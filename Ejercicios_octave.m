##Ejerciciios Octave

##Ejercicio 1

origen_1= [-1,1]
origen_2= [1,2]
origen_3= [0,0]

destino_1=[0,1]
destino_2=[-1,0]
destino_3=[1,1]

##Creamos una funcion que sea capaz de hacer una ecuacion que nos encuentre
##las matrices afines que se han usado para la traslación


### Tenemos que | a b c | |ori.x|   | dest.x | 
###             | d e f | |ori.y| = | dest.y |
###             | g h i | |  1  |   |    1   |
### Por tanto tenemos que aori.x + bori.y = dest.x
    
###Aquí tenemos un sistema de ecuaciones con 4 incognitas y tenemos 3 puntos de entrada
#y 3 de salida

##Tenemos que cumplir que tengamos lo siguiente:

#Ecuacion 1
##Hemos sacado que c,f e i son 1
ecuacion_1 = "a + 2b +1 = -1"
ecuacion_2 = "d + 2e +1 =  0"
ecuacion_3 = "g + 2h +1 =  1" 
ecuacion_4 = "-a+  b +1 =  0"
ecuacion_5 = "-d+  e +1 =  1" 
ecuacion_6 = "-g+ 2h +2 =  1"

## Tenemos los siguientes resultados
 
resultado_aux1="g=2h"
resultado_aux2="e= d"
resultado_aux3="b= a-1"

resultado_aux4="3a + 1 = -1 --> a=0"
resultado_aux5="g = h = 0"
resultado_aux6=" e = d = -1/3"

resultado_final = [0,-1,1;-1/3,-1/3,1;0,0,1]

##Ejercicio 2

###Tenemos que realizar las siguientes transformaciones 
# Traslacion al (2,1)
# Giro 45
# Traslacion de nuevo (-2,-1)
# Traslacion -1,-1
# Simetria eje y

matriz_1 = [-1,0,0;0,1,0;0,0,1]
matriz_2 = [1,0,-1;0,1,-1;0,0,1]
matriz_5 = [1,0,-2;0,1,-1;0,0,1]
matriz_4 = [cos(pi/4),-sin(pi/4),0;sin(pi/4),cos(pi/4),0;0,0,1]
matriz_3 = [1,0,2;0,1,1;0,0,1]

matriz_afin = matriz_1*matriz_2*matriz_3*matriz_4*matriz_5

cuadrado_1=[0;0;1]
cuadrado_2=[0;1;1]
cuadrado_3=[1;0;1]
cuadrado_4=[1;1;1]

x=[0,1,1,0,0]
y=[0,0,1,1,0]


c1=matriz_afin * cuadrado_1
c2=matriz_afin * cuadrado_2
c3=matriz_afin * cuadrado_3
c4=matriz_afin * cuadrado_4

x2=[c1'(1),c2'(1),c4'(1),c3'(1),c1'(1)]
y2=[c1'(2),c2'(2),c4'(2),c3'(2),c1'(2)]
plot(x, y, 'b-', 'LineWidth', 3)
hold on;
plot(x2, y2, 'r-', 'LineWidth', 3)

##Ejercicio 3

##Tenemos que realizar primero una rotacion por pi/4 
##Luego una traslacion
##finalmente una reflexion con el eje x=y que es con z=0 por lo que tenemos el eje xy
matriz_1 = [1,0,0,0;0,1,0,0;0,0,-1,0;0,0,0,1]
matriz_2 = [1,0,0,-1;0,1,0,-1;0,0,-1,-1;0,0,0,1]
matriz_3 = [cos(pi/4),-sin(pi/4),0,-1;sin(pi/4),cos(pi/4),0,-1;0,0,-1,-1;0,0,0,1]

matriz_afin = matriz_1*matriz_2*matriz_3

[x, y, z] = sphere (40);
surf (x, y-3, z+1);
axis equal;
title ("esfera de radio 1 con centro en (0,-3,1)");

##Ejercicio 4
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
      
patch('Vertices',vertices,'Faces',F,...
      'FaceVertexCData',jet(4),'FaceColor','flat')
view(10,2);

##El area de la superficie será triangulo a triangulo

## Cada una de sus caras será el 
## el modulo del producto vectorial 
## de los dos vectores que lo forman
## entre 2 aunque tenemos que todas las caras son iguales, por lo que lo calculamos 1
## y por 8

vector1 = p2-p1
vector2 = p6-p1

area=(norm(cross (vector1,vector2))/2) * 8

##Caras visibles desde (10,2,1)

#Tenemos 8 caras y se ven si el escalat de OP por el vector normal es positivo, de P usaremos 3 y 1
puntoVista = [10 2 1];
vector_PO_1 = puntoVista - p1;
vector_PO_3 = puntoVista - p3;

##Calculamos el vector normal haciendo el prod vectorial de dos vectores
vectorNormalCara1 = cross ((p2-p1),(p6-p1));
vectorNormalCara2 = cross ((p5-p1),(p2-p1));
vectorNormalCara3 = cross ((p4-p1),(p6-p1));
vectorNormalCara4 = cross ((p2-p3),(p6-p3));
vectorNormalCara5 = cross ((p4-p3),(p6-p3));
vectorNormalCara6 = cross ((p5-p3),(p2-p3));
vectorNormalCara7 = cross ((p4-p1),(p5-p1));
vectorNormalCara8 = cross ((p5-p3),(p4-p3));

resultado1 = dot (vectorNormalCara1,vector_PO_1)
resultado2 = dot (vectorNormalCara2,vector_PO_1)
resultado3 = dot (vectorNormalCara3,vector_PO_1)
resultado4 = dot (vectorNormalCara4,vector_PO_3)
resultado5 = dot (vectorNormalCara5,vector_PO_3)
resultado6 = dot (vectorNormalCara6,vector_PO_3)
resultado7 = dot (vectorNormalCara7,vector_PO_1)
resultado8 = dot (vectorNormalCara8,vector_PO_3)

##Traslacion de vector (0,1,4)
matriz_traslacion = [1 0 0 0;
                     0 1 0 1;
                     0 0 1 4;
                     0 0 0 1];
                     
p1_trans = (matriz_traslacion * [p1';1])'
p2_trans = (matriz_traslacion * [p2';1])'
p3_trans = (matriz_traslacion * [p3';1])'
p4_trans = (matriz_traslacion * [p4';1])'
p5_trans = (matriz_traslacion * [p5';1])'
p6_trans = (matriz_traslacion * [p6';1])'

p1_trans = [p1_trans(1) p1_trans(2) p1_trans(3)]
p2_trans = [p2_trans(1) p2_trans(2) p2_trans(3)]
p3_trans = [p3_trans(1) p3_trans(2) p3_trans(3)]
p4_trans = [p4_trans(1) p4_trans(2) p4_trans(3)]
p5_trans = [p5_trans(1) p5_trans(2) p5_trans(3)]
p6_trans = [p6_trans(1) p6_trans(2) p6_trans(3)]

vertices = [p1_trans; p2_trans; p3_trans; p4_trans; p5_trans; p6_trans]

patch('Vertices',vertices,'Faces',F,...
      'FaceVertexCData',jet(4),'FaceColor','flat')
view(10,2);

##Vamos a preparar la proyeccion de cámara, para ello tenemos que montat la matriz
## de camara
## matriz_camara = KR[I3 | -C] donde -C es el vector origen cambiado de signo
## R es la rotacion y K es la matriz de calibracion, que vamos a suponer que es ideal

matriz_i3 = [1 0 0 0;
             0 1 0 0;
             0 0 1 0];

## Como está en un plano perpendicular a z --> no tenemos que realizar ninguna rotacion

rotacion = [1 0 0 ;
            0 1 0 ;
            0 0 1 ];
            

            
##Matriz K ideal -- distacia del centro de camara = 1
K=[1 0 0;
   0 1 0;
   0 0 1];
   
##calculamos la matriz de camara
matriz_camara = K*rotacion* matriz_i3;

p1_trans_2 = (matriz_camara * [p1_trans';1])';
p2_trans_2 = (matriz_camara * [p2_trans';1])';
p3_trans_2 = (matriz_camara * [p3_trans';1])'; 
p4_trans_2 = (matriz_camara * [p4_trans';1])'; 
p5_trans_2 = (matriz_camara * [p5_trans';1])'; 
p6_trans_2 = (matriz_camara * [p6_trans';1])'; 

vertices2 = [p1_trans_2; p2_trans_2; p3_trans_2; p4_trans_2; p5_trans_2; p6_trans_2]

##Así se vería la proyeccion de camara sobre el plano 
##(es una imagen 3D y se puede rotar, pero la idea es que se vea la proyeccion asi sin moverse)

patch('Vertices',vertices2,'Faces',F,...
      'FaceVertexCData',jet(4),'FaceColor','flat')
view(10,2);

##Ejercicio 5
pkg load quaternion
function retval = giro_eje (vector,angulo,p)

q=  rot2q (vector, angulo);
q_inv= inv(q)
q_norm= quaternion(0,p(1),p(2),p(3))
res=q*q_norm*q_inv
retval=[res.i res.j res.k]

endfunction

axis = [0; 0; 1]
angle = pi/4
#PUNTOS_CUBO
p1 = [0 0 0]
p2 = [1 0 0]
p3 = [0 1 0]
p4 = [1 1 0]

p5 = [0 0 1]
p6 = [1 0 1]
p7 = [0 1 1]
p8 = [1 1 1]

vertices = [p1; p2; p3; p4; p5; p6; p7; p8]

F =  [3,4,2,1;
      7,8,6,5;
      1,2,6,5;
      3,4,8,7;
      4,2,6,8;
      1,3,7,5]
patch('Vertices',vertices,'Faces',F,...
      'FaceVertexCData',jet(4),'FaceColor','flat')
view(10,2);
axis square;
p_1 = giro_eje (axis, angle, p1)
p_2 = giro_eje (axis, angle, p2)
p_3 = giro_eje (axis, angle, p3)
p_4 = giro_eje (axis, angle, p4)
p_5 = giro_eje (axis, angle, p5)
p_6 = giro_eje (axis, angle, p6)
p_7 = giro_eje (axis, angle, p7)
p_8 = giro_eje (axis, angle, p8)

vertices = [p_1; p_2; p_3; p_4; p_5; p_6; p_7; p_8]

F =  [3,4,2,1;
      7,8,6,5;
      1,2,6,5;
      3,4,8,7;
      4,2,6,8;
      1,3,7,5]
patch('Vertices',vertices,'Faces',F,...
      'FaceVertexCData',jet(4),'FaceColor','flat')
view(10,2);
axis square;