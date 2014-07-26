#Set your wd
#setwd("~/GitHub/ProgrammingAssignment2")
source("cachematrix.R")
SIZE <- 500
set.seed(123)
x<- matrix(runif(SIZE*SIZE), SIZE, SIZE)
m = makeCacheMatrix(x)
m$get()
inv1<-cacheSolve(m)
inv2<-solve(x)
identical(inv1,inv2)

if (all(inv1 == inv2)) {
  print("cacheSolve :happy: correctly found the inverse!", quote=0)
  inv1 <- system.time(cacheSolve(m))
  inv2 <- system.time(solve(x))
  print("cached sys.time(): ", quote=0)
  print(inv1)
  print("", quote=0)
  print("uncached sys.time():", quote=0)
  print(inv2)
  print("", quote=0)
} else {
  print("It's not working :sad:")
}
