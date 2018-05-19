# Práctica clasificación


# kNN
library(class)

tumores <- read.csv("data/wisc_bc_data.csv")[c(-1)]
levels(tumores$diagnosis) <- c("Benign", "Malign")
str(tumores)
summary(tumores)

#Creamos una función que transforma nuestros datos en la escala de 0 a 1.
normalizar <- function(x) {
  (x-min(x))/(max(x)-min(x))
}

#Usamos lapply para normalizar todas las columnas, escepto 'diagnosis'
tumores_norm <- as.data.frame(lapply(tumores[2:31], normalizar))
summary(tumores_norm)

#Aleatorizamos las muestras para generar el conjunto de entrenamiento y el de prueba.
set.seed(1200)
orden <- order(runif(nrow(tumores_norm)))
tumores <- tumores[orden,]
tumores_norm <- tumores_norm[orden,]

#Generamos conjuntos de entrenamiento, prueba y las etiquetas para el conjunto de entrenamiento
tumores_norm_train <- tumores_norm[1:426, ]
tumores_norm_test <- tumores_norm[427:569, ]
tumores_norm_train_labels <- tumores$diagnosis[1:426]

tumores_pred <- knn(train=tumores_norm_train, test=tumores_norm_test,
                    cl=tumores_norm_train_labels, k=4.5)

#Evaluamos la efectividad de nuestra clasificación
library(gmodels)
table(tumores$diagnosis[427:569] == tumores_pred)
CrossTable(x=tumores$diagnosis[427:569], y=tumores_pred)