#Generation de grille

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


deleteNum<-function(a, matrice){
  matrice[((a-1)%/%9+1),((a-1)%%9+1)]=NA
  return(matrice)
}
facile<-function(matrice){
  t<-sample(1:81,54,replace = FALSE)
  q<-matrice
  for(i in 1:54){
  q<-deleteNum(t[i],q)

  }
  return(q)
}
moyen<-function(matrice){
  t<-sample(1:81,59,replace = FALSE)
  q<-matrice
  for(i in 1:54){
    q<-deleteNum(t[i],q)

  }
  return(q)
}
difficile<-function(matrice){
  t<-sample(1:81,63,replace = FALSE)
  q<-matrice
  for(i in 1:54){
    q<-deleteNum(t[i],q)

  }
  return(q)
}

#PARTIE BACKTRACKING

Resolve<-function(matrice){
  m<-0
  for(i in 1:9){
    for(j in 1:9){
      if(is.na(matrice[i,j])){
        m<-c(m,j+(i-1)*9)
      }
    }
  }
  z<-m[2:length(m)]
  return(z)
}
trier<-function(matrice){
  K<-0#liste qui stockera le nombre de possibilités pour chaque case vide
  M<-0#vecteur des emplacements vides triés en fonction de de leur nombre de possibilités croissant
  y<-Resolve(matrice)
  for(i in 1:length(y)){
    t<-0
    for (j in 1:9) {
      if(!existeDansCarre(j,matrice,((y[i]-1)%/%9+1),((y[i]-1)%%9+1))){
          if(!existeSurColonne(j,matrice,((y[i]-1)%%9+1))){
            if(!existeSurLigne(j,matrice,((y[i]-1)%/%9+1))){
              t=t+1
              }
           }
        }
    }
   K=c(K,t)
  }
  Z<-K[2:length(K)]
  for(l in 1:9){
  for(k in 1:length(Z)){
    if(Z[k]==l){
      M=c(M,y[k])
    }
    }
  }
  W<-M[2:length(M)]
  return(W)
}


existeDansCarre<-function(x, numMat, i, j){
  for(k in 1:3){
    for(n in 1:3){

      if(is.na(numMat[3*((i-1)%/%3)+k,3*((j-1)%/%3)+n])==FALSE){
        if(numMat[3*((i-1)%/%3)+k,3*((j-1)%/%3)+n]==x)
          return(TRUE)
      }
    }
  }
  return(FALSE)
}
existeSurLigne<- function( x, grille, j){
  for (k in 1:9){
    if(is.na(grille[j,k])==FALSE){
      if(grille[j,k]==x){
        return (TRUE)
      }
    }
  }
  return (FALSE)
}

existeSurColonne<-function(x, grille, j){
  for (k in 1:9){
    if(is.na(grille[k,j])==FALSE){
    if(grille[k,j]==x){
      return (TRUE)
    }
    }
  }
  return (FALSE)
}
estValide<-function(x,A,i,j){
  return(!(existeSurColonne(x,A,j) | existeDansCarre(x,A,i,j) | existeSurLigne(x,A,i)))
}
SolveGrille<-function(grille){
  x<-trier(grille)
  for(i in 1:length(x)){


  }
}



