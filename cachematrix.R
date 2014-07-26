## makeCacheMatrix create a list as the requirement in the example:
#
#1 set the value of the matrix
#2 get the value of the matrix
#3 set the value of the inverse matrix
#4 get the value of the inverse matrix

makeCacheMatrix <- function(a = matrix()) {
     inver <- NULL # We need to clear our global enviroment :)
    set <- function(b) { # setting 'special' matrix...
      a <<- b
      inver <<- NULL
    }
    get <- function() a # getting...
    setinverse <- function(inverse) inver <<- inverse # setting inverse matrix
    getinverse <- function() inver # getting inverse matrix
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) # Here the list...
}



## It gives the inverse matrix using cache memory in order to reduce the time. See test.R in the repo to test the difference!

cacheSolve <- function(a, ...) {
  
    inver <- a$getinverse() # getting inverse matrix...
    if(!is.null(inver)) {
      message("getting cached data.") #as the example, it give you this message if "inver" exists..
      return(inver)
    }
    data <- a$get() # Using the list if there is not cache...
    inver <- solve(data) # 
    a$setinverse(inver)
    inver
  }

# Please read test.R in order to test this assigment and see the difference in time! 
# This is the result in my computer using test.R. This could change depending on you computer...

#cacheSolve correctly found the inverse!
#  getting cached data.
#[1] cached sys.time(): 
#  user  system elapsed 
#0       0       0 
#[1] 
#[1] uncached sys.time():
#  user  system elapsed 
#0.16    0.00    0.16 
