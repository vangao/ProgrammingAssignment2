
## The first function creat a matrix and cache its inverse. The second function
## will calcutlate the inverse matrix created by the first function if it isn't 
## exist, and cache it.

## The function, makeCacheMatrix, will creat a matrix, return it, set its inverse
## matrix, and return this matrix.

makeCacheMatrix<-function(x=matrix(NULL)){
	inverse_matrix<<-NULL
	set_matrix<-function(y){
		x<<-y
		inverse_matrix<<-NULL
	}
	get_matrix<-function() x
	set_inverse<-function(inverse) inverse_matrix<<-inverse
	get_inverse<-function() inverse_matrix
	list(set=set_matrix,get=get_matrix,
	     setinverse=set_inverse,getinverse=get_inverse)
}

## The function, cacheSolve, will calculate the inverse matrix created by function
## makeCacheMatrix, if the matrix is already exists, then read it from the cache
## , and if not, calculate it and save the inverse matrix in the cache. 

cacheSolve<-function(x){
	inverse_matrix<-x$getinverse()
	if(!is.null(inverse_matrix)) {
                message("getting cached data")
                return(inverse_matrix)
      }
	data<-x$get()
	inverse_matrix<-solve(data)
	x$setinverse(inverse_matrix)
	inverse_matrix
}

