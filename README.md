# btest

El usuario, siempre que pertenezca al grupo **btest**, podra subir un programa candidato para resolver un problema. 

##upload.sh

- uso: `upload.sh`

- Fes les següents assignacions de variables:
 
    $name ha de valer EX1
    
    $source ha de valer test1.c 
    
    $input ha de valer in1.txt in2.txt 

- Crea un directori a /etc/btest/$name i copia-hi els fitxers:

    manifest.txt  
    
    els fitxers d'entrada, e.g. in1.txt in2.txt 
    
    el fitxer del codi font, e.g. test1.c 

- Embelleix el codi font amb la comanda indent

- Compila el codi i genera l'executable amb la comanda cc

##listproblems.sh

- uso: `listproblems.sh`

- Listara los problemas dados de alta en el directorio **etc/btest**

##showmanifest.sh

- uso: `showmanifest.sh XXX` donde XXX sera el problema a mostrar el contenido de manifest

- Mostrara el contenido del archivo **manifest.txt** indicado

- En caso de no existir el manifest especificado mostrara un error

##testcandidate.sh

- uso: `testcandidate.sh XXX YYY` donde XXX sera el problema a solucionar y YYY la solucion aportada

- Se propone un codigo fuente para resolver un problema

- Se compila el original del problema y la solcuion aportada con los mismos ficheos de entrada y se comparan los ficheros de salida. Si valida y los fiches de salida son iguales se indica. EN caso de error tambien se indica
