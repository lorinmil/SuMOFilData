genIndicators <- function(alpha, Rsq, nsample, #latent, sigma, 
													rind, nx, nxPrime, ns, ntranscriptNoise, 
													ng, ngPrime, nh, ngeneNoise, noiseSD)
{
	set.seed(NULL)
  
	set.seed(sample(x = seq(1,20000),size = 1))
	tauInd <- (1 - rind^2)/rind^2
	dfg <- NULL
	dfy <- NULL
	dfx <- NULL
	for (i in 1:nsample){
	  #Set  up the covariance matrix for (Y, X, G, S, H, X', G')
		sigma <- calSigma(setPar(alpha, Rsq)) #Set up the standard devs for the latent vars
		#Get latent variable values for this person under a multivariate normal using the covariance matrix
		latent <- genLatent(sigma)
		
		#Simulate the "observed" variables for this subject using the latent values
		y <- rnorm(1, latent["Yprime"], sqrt(tauInd * sigma["Yprime", "Yprime"]))
		
		x <- c(rnorm(nx, latent["X"], sqrt(tauInd * sigma["X", "X"])), #X's in pathway
					 rnorm(nxPrime, latent["Xprime"], sqrt(tauInd * sigma["Xprime", "Xprime"])), #X's related to G only
				 	 rnorm(ns, latent["S"], sqrt(tauInd * sigma["S", "S"])), #X's related to Y only
					 rnorm(ntranscriptNoise, 0, noiseSD * sqrt(tauInd * sigma["Yprime", "Yprime"]))) #X noise
		
		g <- c(rnorm(ng, latent["G"], sqrt(tauInd * sigma["G", "G"])), 
					 rnorm(ngPrime, latent["Gprime"], sqrt(tauInd * sigma["Gprime", "Gprime"])), 
					 rnorm(nh, latent["H"], sqrt(tauInd * sigma["H", "H"] )), 
					 rnorm(ngeneNoise, 0, noiseSD * sqrt(tauInd * sigma["Yprime", "Yprime"])))
		
		dfy <- rbind(dfy, y)
		dfx <- rbind(dfx, x)
		dfg <- rbind(dfg, g)
	}
	#Indicator for pathway elements or not
	truegenes <- c(rep(1, ng), rep(0, ngPrime + nh + ngeneNoise) )
	truetranscripts <- c(rep(1, nx), rep(0, nxPrime + ns + ntranscriptNoise) )
	#Center the results to zero
	df <- list(y = dfy - mean(y),
						transcripts = scale(dfx, scale=FALSE), # only centered
						genes = scale(dfg, scale=FALSE), 			# only centered
						truetranscripts = truetranscripts, 
						truegenes = truegenes)
						
	dimnames(df$transcripts) <- NULL
	dimnames(df$genes) <- NULL
	dimnames(df$y) <- NULL
	set.seed(NULL)
	return(df)
}