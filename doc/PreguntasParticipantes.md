# Curso de R: Dudas participantes
1. Leer un archivo de texto en una variable para utilizarlo como consulta. (RODBC):

```
paste(readLines('mydbquery.sql'), collapse='\n')
```

2. Mantener el tipo de dato (o medida) de los campos al momento de importar o exportar archivos (csv):

```
read.csv(…, **colClasses=**
```

3. Convertir tipo de variable discreta a continua:

```
# coerción con las funciones
as.integer()
as.double()
as.character()
# etc.
```

4. Programar la ejecución de tareas:

```
# Enviar un correo electrónico con un archivo adjunto de manera diaria:
library(mailR)

me <- 'david.suarez@yahoo.com'
admin <- 'admin@r-project.org'
congrats <- "Congratulations"
message <- "<p>Thank you for your <strong>excellent</strong> woRk!</p>"
data <- c("/tmp/today-values.csv", "/tmp/last-graph.png")
smtp_params <- list(
host.name = 'smtp.gmail.com',
user.name = 'my.user@gmail.com',
passwd = 'xxx',
port = 465,
ssl = TRUE
)

send.mail(from=me, to=admin, subject=congrats, body=message, encoding="iso-8859-1",
html=TRUE, smtp=smtp_params, authenticate=TRUE,
send=TRUE, attach.files=data)
```

5. Operaciones con fechas:

```
library(lubridate)
```

6. Descargar archivos adjuntos en correos electrónicos y ejecutar una macro desde R.

7. Límites de caracteres en una línea de R
8. ~~Funciones de agregado en R.~~
9. Editar archivos de texto:

```
library(stringr)
```

10. Web scraping o descarga de información de internet:

```
library(RCurl) #Permite hacer peticiones HTTP con múltiples opciones de parámetros, autenticación, etc.
library(rvest) #Permite hacer web scraping
```

11. Almacenar diferentes archivos en diferentes data frames en R:

```
#Usando `assign` es posible convertir una lista de nombres de archivos en sus dataframes correspondientes:

fnames <- c("A.csv", "B.csv", "C.csv", "D.csv")

for (f in fnames) {
  assign(sub("\\.csv", "", f), read.csv(f))
}
ls() #Mostrará cuatro dataframes con nombres: A, B, C y D
```

12. Leer nombres de encabezados sin sustituir puntos por espacios al importar archivos:

```
read.csv(…, check.names=False, …)
```