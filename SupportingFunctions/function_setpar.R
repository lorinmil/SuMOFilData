
setPar <- function(alpha, Rsq)
{
	sg <- 1  # var(G) set to 1
	
	sh <- sg    # same as G. H is assoc with Y, ow independent
	bxg <- sqrt(alpha)
	byx.g <- sqrt(alpha)
	byg.x <- 1 - alpha
	bys <- alpha
	byh <- alpha
	tau <- (1 - Rsq)/Rsq
	sxg <- alpha * tau   # error variance of X given G
	ss <- sxg + sg * alpha    # same as X. S is assoc with Y, ow independent
	
	syxgsh <- tau + (alpha * tau)^2 + 2 * (alpha ^ 2) * tau #alpha^2*tau^2 + 3*tau  # error variance of Y given X, S, G, H
	list(alpha=alpha, Rsq=Rsq, sg=sg, ss=ss, sh=sh, 
			bxg=bxg, 	byx.g=byx.g, byg.x=byg.x, bys=bys, byh=byh, 
			tau=tau, sxg=sxg, syxgsh=syxgsh)
}