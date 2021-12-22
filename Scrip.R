---
title: "Recuperacion primer parcial Fuentes de Datos."
autor: "Julia Uson Zuazo"
date: "Diciembre 2021"

output:
  html_document: default
pdf_document: default

---
  <style>
  body {
    text-align: justify}
</style>
  
## Introduccion
  
En este proyecto vamos a trabajar los contenidos que entraban en el primer parcial de prÃ¡cticas de la asignatura trabajaremos 
los verbos de `dplyr`. Todos los verbos los voy a probar con el paquete starwars y con la base datos Galapagos_summary.
Para realizar esto seguiremos los manuales "Vignettes".

Lo primero que tenemos que hacer es cargar los paquetes que utilizaremos en nuestro proyecto:

library(dplyr)
library(readr)

Seguido vamos a importar el set de datos que vamos a usar:

Galapagos <- read_csv("DATA/Galapagos_summary.csv")
View(Galapagos)

## Trabajo con los verbos del paquete dyply:
vignette("dplyr")
Utilizamos vignette() para conocer mejor los paquetes que vamos a utilizar y sus posibilidades.

1. Utilizamos dim() para conocer la dimension del set de datos con el que vamos a trabajar.

```{r}
dim(Galapagos)

```

El set de datos Galapagostiene 48 filas y 6 columnas.



2. Funcion filter(), la utilizamos para que se nos muestre la fila con un dato o datos concretos dentro de una columna.

```{r}
Galapagos %>% filter(Island == "Santa Cruz")
```
Este comando nos mostrará únicamente los datos que corresponde a la isla Santa Cruz.

Podemos seleccionar más de una característica en concreto:
  
```{r}
Galapagos %>% filter(Island == "Santa Cruz", Station == "East")
```

3. Utilizamos arrange() cuya funcion es reordenar, es decir, nosotros seleccionamos unas columna y las filas se ordenan en funcion
del menor al mayor valor de la columna elegida.

```{r}
Galapagos %>% arrange(Av_Temp)
```
Para que el orden de las filas sea inverso, es decir, ordenando el valor de la columna elegida de mayor a menor utilizamos desc()
```{r}
Galapagos %>% arrange(desc(Av_Salinity))
```
4. slice() sirve para seleccionar columnas y trabajar con ellas de manera mas sencilla.

Nuestro set de datos tiene 48 si queremos ver las filas de la 13 a la 27 debemos utilizar el siguiente comando:

```{r}
Galapagos %>% slice(13:27)
```
slice() tambien nos sirve para selecionar las x primeras o x ultimas filas pero modificando ligeramente el conditionMessage.condition(

Seleccion 5 primeras filas:

```{r}
Galapagos %>% slice_head(n=5)
```

Seleccion 5 últimas filas:

```{r}
Galapagos %>% slice_tail(n=5)
```

Otra aplicación interesante de slice es slice_sample() que sirve para seleccionar un número determiando de filas al azar:

```{r}
Galapagos %>% slice_sample(n=5)
```  
Tambien podemos ordenar en función del que destaque mas o menos de en una caracteristica, por ejemplo, ordenamos en funcion
de la temperatura mas alta:
  
```{r}
Galapagos %>% slice_max(Av_Temp)
```  

Ahora temperatura mas baja:
```{r}
Galapagos %>% slice_min(Av_Temp)
```   
  
5. select() se utiliza para que se nos muestre solo las columnas que nos interesan:
  
```{r}
Galapagos %>% select(Island, Station, distance)
```   

6. El paquete dyplr tambien nos ofrece la posibilidad de cambiar los nombres de las columnas. 

```{r}
Galapagos %>% rename(Isla = Island)
```  
```{r}
Galapagos %>% rename(Isla = Island, Orientacion = Station, distancia = distance)
```  
  
7. Una de las funciones mas interesantes de este paquete es mutate() que nos sirve para crear nuevas columnas en funcion de otras.

En este caso vamos a añadir una columna que se llame temperatura_F (Tº en Fahrenheit) a partir de la columna Av_Temp.

Para pasar de ºC a ºF: ºC*9/5+32

```{r}
Galapagos %>% mutate(temperatura_f = (Av_Temp*9/5)+32)
``` 

8. Para cambiar el orden de las columnas utilizamos relocate()

La primera columna es Islan pero queremos que sea Station, para ello:

```{r}
Galapagos %>% relocate(Station:Island)
``` 

9. Si queremos la media de los valores de una columna numérica utilizamos summarise()
  
```{r}
Galapagos %>% summarise(distance = mean(distance, na.rm = TRUE))
``` 

10. Si queremos ver una columna en concreto debemos poner en corchetes el número de columna que es

```{r}
Galapagos[1]
``` 

11. Para ver una casilla concreta primero seleccioanmso la fila y después la columna.

```{r}
Galapagos[1,3]
```   


