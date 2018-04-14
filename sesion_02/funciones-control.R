# Funciones en R

f <- function (x, y) x+y

f(3, 5)


factoriza <- function(df, columna) {
  df[columna] <- factor(unlist(df[columna]))
  return(df)
}

ifelse <- function(x, verd, fals) {
  if (x) {
    return (verd)
    }
  else {
    return (fals)
  }
}

imprime_pares <- function(inicio=0, fin=1000) {
  indice <- inicio
  while (indice <= fin) {
    if (indice %% 2 == 0) print(indice)
    indice <- indice + 1
  }
} 

imprime_impares <- function(inicio=0, fin=1000) {
  try()
  for (indice in inicio:fin)
    if (indice %% 2) print(indice)
}