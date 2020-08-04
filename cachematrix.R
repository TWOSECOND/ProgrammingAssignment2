## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
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


## this function create a matrix object can cache its inverse

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