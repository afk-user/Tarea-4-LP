Nombre: Javier Matamala
Rol: 202274560-0

Adiciones al código base:
- En P1, se añadió la función auxiliar largo
- En P3, se añadieron las siguientes funciones:
    - La función Largo
    - La función Checkear
- En P4, se añadió la función buscar_ingrediente
- En P5, se añadieron las siguientes funciones:
    - La estructura Cola (Queue)
    - El algoritmo de Búsqueda a lo Ancho (BFS)
    - El loop Buscar
- La utilidad de estas funciones es legible en sus respectivos archivos

Instrucciones de uso:
Para P1:
- Se hace correr el programa y se le entrega por terminal una cantidad que dice la supuesta longitud de lista y la lista en el siguiente formato:
    (checkear numero lista)
    ej: (checkear 4 '(a b c d))
Para P2:
- Se hace correr el programa y se le entrega por terminal un número base y una lista de operaciones lambda en el siguiente formato:
    (cantidades_cola numero lista)
    ej: (cantidades_cola 2 (list (lambda (x) (/ x 2)) (lambda (x) (* x 3)) (lambda (x) (- 2 2))))
Para P3:
- Se hace correr el programa y se le entrega por terminal una lista de pares que contiene la cantidad necesaria y una lista homogénea de cuantos ingredientes hay.
    (armar_lista '(cant_necesaria lista))
    ej: (armar_lista ‘((5 (cebolla cebolla)) (3 (tomate tomate tomate)) (2 (ajo))))
Para P4:
- Se hace correr el programa y se le entrega por terminal una lista de recetas y un ingrediente por buscar en las recetas en el siguiente formato:
    ((nombre_receta1 ingrediente1 ingrediente2 …) (nombre_receta2 …))
    ej: (buscar_recetas '(salmon) '((pescado_arroz salmon atun) (ratatouille tomate berenjena romero) (sushi salmon arroz wasabi) (cazuela papa carne zapallo apio)))
Para P5:
- Se hace correr el programa y se le entrega por terminal una lista de nodos que tiene el siguiente formato:
    (valor_nodo árbol_izquierdo árbol_derecho)
    ej: (buscar_utensilio '(vaso) '(cocina (arriba (alacena (gabinete () (vaso () ())) (vaso () ())) (estante (tenedor () ()) (batidor () ()))) (abajo (taburete (vaso () ()) ()) (cajon (batidor () ()) (tenedor () ())))))