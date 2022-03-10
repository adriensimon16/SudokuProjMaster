#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
bool existeSurLigne(int x, NumericMatrix grille, int j){
  for (int k=0; k<9; k++){
    if(grille(k,j-1)==x){
      return TRUE;
    }
  }
  return FALSE;
}

// [[Rcpp::export]]
bool existeSurColonne(int x, NumericMatrix grille, int j){
  for (int k=0; k<9; k++){
    if(grille(j-1,k)==x){
      return TRUE;
    }
  }
  return FALSE;
}





