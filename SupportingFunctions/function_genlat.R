library(MASS)

genLatent <- function(sigma2prime){
	
  latent <- mvrnorm(1, rep(0, 7), sigma2prime)
  
	return(latent)
}