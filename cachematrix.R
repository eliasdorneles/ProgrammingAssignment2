## These functions can be used to cache solving the inverse of matrices


## Returns a list of closures that allow to
## store together a matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL

    get <- function() x
    set <- function(m) { x <<- m }

    getinverse <- function() inverse
    setinverse <- function(inv) { inverse <<- inv }

    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Returns the cached inverse if it's in the cache
## Otherwise, solve it, caches it and returns the cached
cacheSolve <- function(x, ...) {
    if (is.null(x$getinverse())){
        x$setinverse(solve(x$get()))
    }
    return(x$getinverse())
}

# How to test in R Console:

# > mat = makeCacheMatrix(matrix(c(1, 2, 3, 4), ncol=2, nrow=2))
# > cacheSolve(mat)
