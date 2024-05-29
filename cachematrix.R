## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object that can cache its inverse. 

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL #This will hold the cached inverse
	
	#Function to set the value of the matrix
	set <- function(y){
		x <<- y
		inv <<- NULL # Reset the cached inverse when the matrix is updated
	}

	#Function to get the value of the matrix

	get <- function()x

	#Function to set the value of the inverse
	setInverse <- function(inverse) inv <<- inverse

	# Function to get the value of the inverse
  	getInverse <- function() inv

	# Return a list of the four functions
  	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()

	#if the inverse is already cached, return it
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}

	#otherwise, calculate the inverse, cache it, and return it
	mat <- x$get()
	inv <- solve(mat, ...)
	x$setInverse(inv)

	inv

}
