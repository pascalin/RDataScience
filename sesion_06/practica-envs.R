#Práctica Ambientes

#TODO en R se ejecuta dentro de un ambiente:
environment()

f <- function(x) {
  print(environment())
  print(parent.env(environment()))
}

f(12)
f(12)

sum_x <- function(x) {
  print(environment())
  print(parent.env(environment()))
  total <- 0
  function(a) {
    print(environment())
    print(parent.env(environment()))
    (total <<- total + a + x)
  }
}
sum_2 <- sum_x(2)
sum_3 <- sum_x(3)

sum_2(0)
sum_3(0)