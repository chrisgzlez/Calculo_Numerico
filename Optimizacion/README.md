# Optimización
## Descripcion del Proyecto
El objetivo del proyecto era emplear los metodos de Descenos Rapido y de Newton para encontrar raices y posteriormente aplicarle el Criterio de la hessiana para determinar de que tipo son (maximos, mínimos y puntos de sela). 

Nosotros decidimos encontrar TODAS las raices (no requerido por el proyecto) y realizar un mapeado de la sección del mar (lo que representaba nuestra función en el intervalo dado) y poder crear un grafo con todas las puntos criticos (asignados unos pesos según su tipo) y así poder crear un sistema de navegación marítima.
  
## Archivos
Se encuentran los siguientes archivos y carpetas:
  * Optimizacion.pdf: Presentación del proyecto, en ella se encuentra todo el código importante utilizado, visualización de los datos obtenidos, explicacion del proyecto...
  * Datos/: archivos txt con los datos obtenidos de distintas funciones del programa. Están escritos en un archivo de texto para facilitar su visualización a la hora de exponer (y poder trabajar con los mismos datos en distintas sesiones de trabajo)
  * Fotos/: carpeta con capturas de pantalla de los outputs de distintas funciones de visualización de datos.
  * Archivos .sage: funciones ya implementadas (NO por nosotros) que contienen los métodos algorítmicos a usar.
  * Optimizacion.ipynb: Nuestro Jupyter Notebook principal de trabajo con todas las funciones y código empleado

## Disclaimer:
### [1]
  Los archivos .sage NO fueron escritos por nosotros
  
### [2]
  Mi principal aportación fueron las funciones en Optimizacion.ipynb especialmente aquellas que son a "GranEscala" una adaptación de las funciones del TAD pero adaptadas para encontrar TODAS las raíces de la función en el intervalo dado. Esto no era un requerimiento del proyecto pero decidimos implementarlo como un reto personal.
  
### [3]
  La idea original era implementar una función que analizase los distintos caminos que podía tomar el barco una vez realizado el grafo y buscar el más óptimo para llegar a su destino. Por falta de tiempo esta última parte no la pudimos implementar y el grafo que aparece al final de la presentación esta realizado a mano.

### [4]
  Notable falta de comentarios. El proyecto lo completamos en apenas 3 dias y el código es bastante simple (esta cuidadamente organizado) y de acciones sencillas. Aún así revisandolo ahora noto la falta de comentarios que en un proyecto de programación (no solo de visualización como era el caso) no se podría permitir
