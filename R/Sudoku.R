GenerGrille<-function(){
  grille <-matrix(data = c(rep(NA,81)),nrow=9, ncol=9, byrow=FALSE)
  a<-sample(9)
  grille[1,]<-a
  for(i in 1:9){
    grille[2,i]=a[(i+2)%%9+1]
  }
  for(i in 1:9){
    grille[3,i]=grille[2,(i+2)%%9+1]
  }
  for(i in 1:3){
    for(j in 1:3){
      grille[j+3,i]<-grille[(j-1)%%3+1,i%%3+1]
      grille[j+6,i]<-grille[(j-1)%%3+1,(i+1)%%3+1]
      grille[j+3,i+3]<-grille[(j-1)%%3+1,i%%3+1+3]
      grille[j+6,i+3]<-grille[(j-1)%%3+1,(i+1)%%3+1+3]
      grille[j+3,i+6]<-grille[(j-1)%%3+1,i%%3+1+6]
      grille[j+6,i+6]<-grille[(j-1)%%3+1,(i+1)%%3+1+6]
    }
  }
  
  return(grille)
}




existeDansCarre<-function(x, numMat, i, j){
  for(k in 1:3){
    for(n in 1:3){
      
      if(is.na(numMat[3*(i%/%3)+k,3*(j%/%3)+n])==FALSE){
        if(numMat[3*(i%/%3)+k,3*(j%/%3)+n]==x)  
          return(TRUE)
      }
    }
  }
  return(FALSE)
}



