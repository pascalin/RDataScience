# Practica objetos

fraccion <- function(componentes) {
  stopifnot(is.numeric(componentes), length(componentes)==2, componentes[2] != 0)
  structure(componentes, class=c("fraccion", "racional"))
}

`*.fraccion` <- function(a, b) {
  fraccion(unclass(a)*unclass(b))
}

`+.fraccion` <- function(a, b) {
  fraccion(c(a[1]*b[2]+b[1]*a[2], a[2]*b[2]))
}

print.fraccion <- function(a) {
  print(paste(a[1],a[2], sep="/"))
}

f1 <- fraccion(c(1,2))
f2 <- fraccion(c(3,4))

f1 * f2

f1 + f2

