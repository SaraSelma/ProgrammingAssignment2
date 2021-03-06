makeCacheMatrix <-function(x=matrix()){
  m <-NULL
  set <-function (y=matrix) {
    x <<-y
    m<<-NULL
  }
  get<-function()x
  setinv<-function(solve)m <<-solve 
  getinv <-function()m
  list(set=set,get=get,
       setinv=setinv,
       getinv=getinv)
}

cacheSolve <-function(x,...){
  m<-x$getinv()
  if(!is.null(m)){
    message("getting cache data")
    return(m)
  }
  data <-x$get()
  m<-solve(data,...)
  x$setinv(m)
  m
}
