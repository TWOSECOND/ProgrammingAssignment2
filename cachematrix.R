## this function creat a matrix object can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv<- NULL
  set<-function(y){
    x<<- y
    inv<<- NULL
  }
  get<-function()x
  setinverse<-function(inverse) inv<<-inverse
  getinverse<-function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## This function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv<-x$getinverse
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  matrix<- x$get()
  inv<- solve(matrix,...)
  x$setinverse(inv)
  inv ## Return a matrix that is the inverse of 'x'
}
