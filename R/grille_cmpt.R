library(combinat)

Aleatoire = sample(1:9)


Permuation = function(vect){
  n = length(vect)
  init = rep(0,n)
  init[1:3] = vect[(n-2):n]
  for (i in 4:n){
    init[i] = vect[i-3]
    if (i == n)
      return(init)
  }
}




Grille_complete = function(){
  matrice = matrix(0, nrow = 9, ncol = 9)
  Aleatoire = sample(1:9)
  matrice[1, ] = Aleatoire
  matrice[2, ] = Permuation(Aleatoire)
  matrice[3, ] = Permuation(matrice[2,])
  
  
  for (j in seq(1, 7, by = 3)){
    for (i in seq(4, 7, by = 3)){
      init = c(matrice[(i-3):(i-1), j], matrice[(i-3):(i-1), j+1], matrice[(i-3):(i-1), j+2])
      pvt = Permuation(init)
      matrice[i:(i+2), j] = pvt[1:3]
      matrice[i:(i+2), j+1] = pvt[4:6]
      matrice[i:(i+2), j+2] = pvt[7:9]
    }
  }
  return(matrice)
}
